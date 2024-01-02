<?php

namespace App\Http\Controllers\Agent;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Models\Agent;
use App\Models\Form;
use App\Lib\FormProcessor;
use App\Models\Transaction;
use App\Lib\GoogleAuthenticator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rules\File;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Hash;

class AgentController extends Controller
{
    function dashboard() {
        $pageTitle    ='Agent Dashboard';
        $agentProfile = Agent::find(Auth::guard('agent')->id());

        return view($this->activeTheme.'agent.dashboard',compact('pageTitle','agentProfile'));
    }

    function KycForm() {

        if (auth()->guard('agent')->user()->kc == ManageStatus::PENDING) {
            $toast[] = ['warning', 'Your identity verification is being processed'];
            return back()->withToasts($toast);
        }

        if (auth()->guard('agent')->user()->kc == ManageStatus::VERIFIED) {
            $toast[] = ['success', 'Your identity verification is being succeed'];
            return back()->withToasts($toast);
        }

        $pageTitle = 'Identification Form';
        $form      = Form::where('act','kyc')->first();

        return view($this->activeTheme . 'agent.kyc.form', compact('pageTitle','form'));
    }

    function kycSubmit() {

        $form           = Form::where('act','kyc')->first();
        $formData       = $form->form_data;
        $formProcessor  = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);

        request()->validate($validationRule);

        $agentData       = $formProcessor->processFormData(request(), $formData);
        $agent           = auth()->guard('agent')->user();
        $agent->kyc_data = $agentData;
        $agent->kc       = ManageStatus::PENDING;
        $agent->save();

        $toast[] = ['success', 'Your identity verification information has been received'];
        return to_route('agent.dashboard')->withToasts($toast);
    }

    function kycData() {
        $pageTitle  = 'Identification Information';
        $agent      = auth()->guard('agent')->user();

        return view($this->activeTheme . 'agent.kyc.info', compact('pageTitle','agent'));
    }

    function fileDownload() {

        $path = request('filePath');
        $file = fileManager()->$path()->path.'/'.request('fileName');

        return response()->download($file);
    }

    function depositHistory() {

        $pageTitle = 'Agent Deposit History';
        $deposits  = auth()->guard('agent')->user()->deposits()->searchable(['trx'])->index()->with('gateway')->latest()->paginate(getPaginate());

        return view($this->activeTheme.'agent.deposit.index', compact('pageTitle', 'deposits'));
    }

    function transactions() {
        $pageTitle    = 'Transactions';
        $remarks      = Transaction::distinct('remark')->orderBy('remark')->get('remark');
        $transactions = Transaction::where('agent_id', auth()->guard('agent')->id())->searchable(['trx'])->filter(['trx_type','remark'])->orderBy('id','desc')->paginate(getPaginate());

        return view($this->activeTheme.'agent.transactions', compact('pageTitle', 'transactions', 'remarks'));
    }

    function show2faForm() {
        $ga        = new GoogleAuthenticator();
        $agent     = auth()->guard('agent')->user();
        $secret    = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($agent->username . '@' . bs('site_name'), $secret);
        $pageTitle = 'Two Factor Setting';

        return view($this->activeTheme . 'agent.twoFactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    function disable2fa() {
        $this->validate(request(), [
            'code'   => 'required|array|min:6',
            'code.*' => 'required|integer',
        ]);

        $verCode  = (int)(implode("", request('code')));
        $agent    = auth()->guard('agent')->user();
        $response = verifyG2fa($agent, $verCode);

        if ($response) {
            $agent->tsc = null;
            $agent->ts  = ManageStatus::NO;
            $agent->save();

            $toast[] = ['success', 'Two factor authenticator deactivated successfully'];
        } else {
            $toast[] = ['error', 'Wrong verification code'];
        }
        return back()->withToasts($toast);
    }

    function enable2fa() {
        $agent = auth()->guard('agent')->user();

        $this->validate(request(), [
            'key'    => 'required',
            'code'   => 'required|array|min:6',
            'code.*' => 'required|integer',
        ]);

        $verCode  = (int)(implode("", request('code')));
        $response = verifyG2fa($agent, $verCode, request('key'));

        if ($response) {
            $agent->tsc = request('key');
            $agent->ts  = ManageStatus::YES;
            $agent->save();

            $toast[] = ['success', 'Google authenticator activation success'];
            return back()->withToasts($toast);
        } else {
            $toast[] = ['error', 'Wrong verification code'];
            return back()->withToasts($toast);
        }
    }

    function profile() {
        $pageTitle  = 'Profile Update';
        $agent      = auth()->guard('agent')->user();
        return view($this->activeTheme. 'agent.profile', compact('pageTitle','agent'));
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

        $agent = auth()->guard('agent')->user();

        if (request()->hasFile('image')) {
            try {
                $agent->image = fileUploader(request('image'), getFilePath('userProfile'), getFileSize('userProfile'), @$agent->image);
            } catch (\Exception $exp) {
                $toast[] = ['error', 'Image upload failed'];
                return back()->withToasts($toast);
            }
        }

        $agent->firstname = request('firstname');
        $agent->lastname  = request('lastname');

        $agent->address = [
            'state' => request('state'),
            'zip'   => request('zip'),
            'city'  => request('city'),
        ];

        $agent->save();

        $toast[] = ['success', 'Profile updated success'];
        return back()->withToasts($toast);
    }

    function password() {
        $pageTitle = 'Password Change';
        return view($this->activeTheme . 'agent.password', compact('pageTitle'));
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

        $agent = auth()->guard('agent')->user();

        if (!Hash::check(request('current_password'), $agent->password)) {
            $toast[] = ['error', 'Current password mismatched !!'];
            return back()->withToasts($toast);
        }

        $agent->password = Hash::make(request('password'));
        $agent->save();

        $toast[] = ['success', 'Password change success'];
        return back()->withToasts($toast);
    }
}
