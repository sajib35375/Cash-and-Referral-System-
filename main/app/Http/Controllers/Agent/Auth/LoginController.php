<?php

namespace App\Http\Controllers\Agent\Auth;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    protected $username;

    function __construct() {
        parent::__construct();
        $this->middleware('agent.guest')->except('logout');
        $this->username = $this->findUsername();
    }

    function loginForm() {
        $pageTitle ='Agent Login';
        return view($this->activeTheme.'agent.auth.login',compact('pageTitle'));
    }

    protected function guard() {
        return auth()->guard('agent');
    }

    function agentLogin() {

        $this->validateLogin(request());

        request()->session()->regenerateToken();

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.

        if ($this->hasTooManyLoginAttempts(request())) {
            $this->fireLockoutEvent(request());

            return $this->sendLockoutResponse(request());
        }

        if ($this->attemptLogin(request())) {
            return $this->sendLoginResponse(request());
        }

        // If the login attempt was unsuccessful we will increment the number of attempts
        // to login and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.

        $this->incrementLoginAttempts(request());

        return $this->sendFailedLoginResponse(request());
    }

    function findUsername() {
        $login     = request()->input('username');
        $fieldType = filter_var($login, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';

        request()->merge([$fieldType => $login]);
        return $fieldType;
    }

    function username() {
        return $this->username;
    }

    protected function validateLogin() {
        $this->validate(request(), [
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);
    }

    function logout() {
        $this->guard()->logout();
        request()->session()->invalidate();

        $toast[] = ['success', 'Logout success'];
        return back()->withToasts($toast);
    }

    function authenticated(Request $request, $agent) {
        $agent->tc = $agent->ts == ManageStatus::VERIFIED ? ManageStatus::UNVERIFIED : ManageStatus::VERIFIED;
        $agent->save();

        return to_route('agent.dashboard');
    }
}
