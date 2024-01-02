<?php

namespace App\Http\Controllers\Agent\Auth;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Models\AdminNotification;
use App\Models\Agent;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class RegisterController extends Controller
{
    use RegistersUsers;

    function __construct() {
        parent::__construct();
        $this->middleware('guest');
        $this->middleware('register.status')->except('registrationNotAllowed');
    }

    function registerForm(){
        $pageTitle ='Agent Registration';
        $info       = json_decode(json_encode(getIpInfo()), true);
        $mobileCode = @implode(',', $info['code']);
        $countries  = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        return view($this->activeTheme.'agent.auth.register',compact('pageTitle','countries','mobileCode','info'));
    }

    protected function guard()
    {
        return auth()->guard('agent');
    }

    protected function validator(array $data) {
        $setting = bs();
        $passwordValidation = Password::min(6);

        if ($setting->strong_pass) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $agree = 'nullable';

        if ($setting->agree_policy) {
            $agree = 'required';
        }

        $countryData  = (array)json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $countryCodes = implode(',', array_keys($countryData));
        $mobileCodes  = implode(',',array_column($countryData, 'dial_code'));
        $countries    = implode(',',array_column($countryData, 'country'));
        $validate     = Validator::make($data, [
            'firstname'    => 'required|string|max:40',
            'lastname'     => 'required|string|max:40',
            'email'        => 'required|string|email|max:40|unique:agents',
            'mobile'       => 'required|max:40|regex:/^([0-9]*)$/',
            'password'     => ['required', 'confirmed', $passwordValidation],
            'username'     => 'required|unique:agents|min:6|max:40',
            'mobile_code'  => 'required|in:'.$mobileCodes,
            'country_code' => 'required|in:'.$countryCodes,
            'country'      => 'required|in:'.$countries,
            'agree'        => $agree
        ]);

        return $validate;
    }

    function register()
    {   
        $this->validator(request()->all())->validate();

        request()->session()->regenerateToken();

        if(preg_match("/[^a-z0-9_]/", trim(request('username')))) {
            $toast[] = ['info', 'Usernames are limited to lowercase letters, numbers, and underscores'];
            $toast[] = ['error', 'Username must exclude special characters, spaces, and capital letters'];
            return back()->withToasts($toast)->withInput(request()->all());
        }

        $exist = Agent::where('mobile', request('mobile_code') . request('mobile'))->first();

        if ($exist) {
            $toast[] = ['error', 'That mobile number is already on our records'];
            return back()->withToasts($toast)->withInput();
        }

        event(new Registered($agent = $this->create(request()->all())));

        $this->guard()->login($agent);

        return $this->registered(request(), $agent) ? : redirect($this->redirectPath());
    }

    protected function create(array $data)
    {
        $setting = bs();
        $referBy = session()->get('reference');

        if ($referBy) {
            $referAgent = Agent::where('username', $referBy)->first();
        } else {
            $referAgent = null;
        }
  
        // Agent Create
        $agent               = new Agent();
        $agent->firstname    = $data['firstname'];
        $agent->lastname     = $data['lastname'];
        $agent->email        = strtolower($data['email']);
        $agent->password     = Hash::make($data['password']);
        $agent->username     = $data['username'];
        $agent->ref_by       = $referAgent ? $referAgent->id : 0;
        $agent->country_code = $data['country_code'];
        $agent->country_name = isset($data['country']) ? $data['country'] : null;
        $agent->mobile       = $data['mobile_code'].$data['mobile'];
        $agent->kc           = $setting->kc ? ManageStatus::NO : ManageStatus::YES;
        $agent->ec           = $setting->ec ? ManageStatus::NO : ManageStatus::YES;
        $agent->sc           = $setting->sc ? ManageStatus::NO : ManageStatus::YES;
        $agent->ts           = ManageStatus::NO;
        $agent->tc           = ManageStatus::YES;
        $agent->save();


        $adminNotification            = new AdminNotification();
        $adminNotification->agent_id   = $agent->id;
        $adminNotification->title     = 'New agent member registered';
        $adminNotification->click_url = urlPath('admin.user.index');
        $adminNotification->save();

        return $agent;
    }

    function checkAgent(){
        $exist['data'] = false;
        $exist['type'] = null;

        if (request('email')) {
            $exist['data'] = Agent::where('email', request('email'))->exists();
            $exist['type'] = 'email';
        }
        if (request('mobile')) {
            $exist['data'] = Agent::where('mobile', request('mobile'))->exists();
            $exist['type'] = 'mobile';
        }
        if (request('username')) {
            $exist['data'] = Agent::where('username', request('username'))->exists();
            $exist['type'] = 'username';
        }
        return response($exist);
    }

    function registered()
    {
        return to_route('agent.dashboard');
    }
}
