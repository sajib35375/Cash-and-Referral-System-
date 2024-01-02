<?php

namespace App\Http\Controllers\User;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Lib\GoogleAuthenticator;
use App\Models\Form;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\File;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    function home() {
        $pageTitle   = 'Dashboard';
        $userProfile = User::where('id',auth()->id())->active()->first();
        return view($this->activeTheme . 'user.dashboard', compact('pageTitle','userProfile'));
    }

    function kycForm() {
        if (auth()->user()->kc == ManageStatus::PENDING) {
            $toast[] = ['warning', 'Your identity verification is being processed'];
            return back()->withToasts($toast);
        }

        if (auth()->user()->kc == ManageStatus::VERIFIED) {
            $toast[] = ['success', 'Your identity verification is being succeed'];
            return back()->withToasts($toast);
        }

        $pageTitle = 'Identification Form';
        $form      = Form::where('act','kyc')->first();

        return view($this->activeTheme . 'user.kyc.form', compact('pageTitle','form'));
    }

    function kycSubmit() {
        $form           = Form::where('act','kyc')->first();
        $formData       = $form->form_data;
        $formProcessor  = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);

        request()->validate($validationRule);

        $userData       = $formProcessor->processFormData(request(), $formData);
        $user           = auth()->user();
        $user->kyc_data = $userData;
        $user->kc       = ManageStatus::PENDING;
        $user->save();

        $toast[] = ['success', 'Your identity verification information has been received'];
        return to_route('user.home')->withToasts($toast);
    }

    function kycData() {
        $pageTitle = 'Identification Information';
        $user      = auth()->user();

        return view($this->activeTheme . 'user.kyc.info', compact('pageTitle','user'));
    }

    function profile() {
        $pageTitle = 'Profile Update';
        $user      = auth()->user();
        return view($this->activeTheme. 'user.profile', compact('pageTitle','user'));
    }

    function profileUpdate() {
        $this->validate(request(), [
            'firstname' => 'required|string',
            'lastname'  => 'required|string',
            'image'     => [File::types(['png', 'jpg', 'jpeg'])],
        ],[
            'firstname.required' => 'First name field is required',
            'lastname.required'  => 'Last name field is required'
        ]);

        $user = auth()->user();

        if (request()->hasFile('image')) {
            try {
                $user->image = fileUploader(request('image'), getFilePath('userProfile'), getFileSize('userProfile'), @$user->image);
            } catch (\Exception $exp) {
                $toast[] = ['error', 'Image upload failed'];
                return back()->withToasts($toast);
            }
        }

        $user            = auth()->user();
        $user->firstname = request('firstname');
        $user->lastname  = request('lastname');

        $user->address = [
            'state' => request('state'),
            'zip'   => request('zip'),
            'city'  => request('city'),
        ];

        $user->save();

        $toast[] = ['success', 'Profile updated success'];
        return back()->withToasts($toast);
    }

    function password() {
        $pageTitle = 'Password Change';
        return view($this->activeTheme . 'user.password', compact('pageTitle'));
    }

    function passwordChange() {
        $passwordValidation = Password::min(6);

        if (bs('strong_pass')) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $this->validate(request(), [
            'current_password' => 'required',
            'password'         => ['required', 'confirmed', $passwordValidation],
        ]);

        $user = auth()->user();

        if (!Hash::check(request('current_password'), $user->password)) {
            $toast[] = ['error', 'Current password mismatched !!'];
            return back()->withToasts($toast);
        }

        $user->password = Hash::make(request('password'));
        $user->save();

        $toast[] = ['success', 'Password change success'];
        return back()->withToasts($toast);
    }

    function show2faForm() {
        $ga        = new GoogleAuthenticator();
        $user      = auth()->user();
        $secret    = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . bs('site_name'), $secret);
        $pageTitle = 'Two Factor Setting';

        return view($this->activeTheme . 'user.twoFactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    function enable2fa() {
        $user = auth()->user();

        $this->validate(request(), [
            'key'    => 'required',
            'code'   => 'required|array|min:6',
            'code.*' => 'required|integer',
        ]);

        $verCode  = (int)(implode("", request('code')));
        $response = verifyG2fa($user, $verCode, request('key'));

        if ($response) {
            $user->tsc = request('key');
            $user->ts  = ManageStatus::YES;
            $user->save();

            $toast[] = ['success', 'Google authenticator activation success'];
            return back()->withToasts($toast);
        } else {
            $toast[] = ['error', 'Wrong verification code'];
            return back()->withToasts($toast);
        }
    }

    function disable2fa() {
        $this->validate(request(), [
            'code'   => 'required|array|min:6',
            'code.*' => 'required|integer',
        ]);

        $verCode  = (int)(implode("", request('code')));
        $user     = auth()->user();
        $response = verifyG2fa($user, $verCode);

        if ($response) {
            $user->tsc = null;
            $user->ts  = ManageStatus::NO;
            $user->save();

            $toast[] = ['success', 'Two factor authenticator deactivated successfully'];
        } else {
            $toast[] = ['error', 'Wrong verification code'];
        }
        return back()->withToasts($toast);
    }

    function depositHistory() {
        $pageTitle = 'Deposit History';
        $deposits  = auth()->user()->deposits()->searchable(['trx'])->index()->with('gateway')->latest()->paginate(getPaginate());

        return view($this->activeTheme.'user.deposit.index', compact('pageTitle', 'deposits'));
    }

    public function transactions() {
        $pageTitle    = 'Transactions';
        $remarks      = Transaction::distinct('remark')->orderBy('remark')->get('remark');
        $transactions = Transaction::where('user_id',auth()->id())->searchable(['trx'])->filter(['trx_type','remark'])->orderBy('id','desc')->paginate(getPaginate());

        return view($this->activeTheme.'user.transactions', compact('pageTitle', 'transactions', 'remarks'));
    }

    function fileDownload() {
        $path = request('filePath');
        $file = fileManager()->$path()->path.'/'.request('fileName');

        return response()->download($file);
    }
}
