<?php

namespace App\Http\Controllers\Agent\Auth;

use App\Http\Controllers\Controller;
use App\Models\Agent;
use App\Models\AgentPasswordReset;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class ResetPasswordController extends Controller
{
    function __construct() {
        parent::__construct();
        $this->middleware('guest');
    }

    function resetForm($verCode = null) {
        $pageTitle = 'Account Recovery';
        $email     = session('Agent_fpass_email');

        if (AgentPasswordReset::where('code', $verCode)->where('email', $email)->count() != 1) {
            $toast[] = ['error', 'Invalid verification code'];
            return to_route('agent.password.request.form')->withToasts($toast);
        }

        return view($this->activeTheme . 'agent.auth.password.reset')->with(
            ['code' => $verCode, 'email' => $email, 'pageTitle' => $pageTitle]
        );
    }

    function resetPassword() {
        $passwordValidation = Password::min(6);

        if (bs('strong_pass')) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $this->validate(request(), [
            'code'     => 'required|int',
            'email'    => 'required|email',
            'password' => ['required', 'confirmed', $passwordValidation],
        ]);

        $email     = request('email');
        $checkCode = AgentPasswordReset::where('code', request('code'))->where('email', $email)->orderBy('created_at', 'desc')->first();

        if (!$checkCode) {
            $toast[] = ['error', 'Invalid verification code'];
            return to_route('agent.password.request.form')->withToasts($toast);
        }

        $agent           = Agent::where('email', $email)->first();
        $agent->password = Hash::make(request('password'));
        $agent->save();

        $agentIpInfo      = getIpInfo();
        $agentBrowserInfo = osBrowser();

        notify($agent, 'PASS_RESET_DONE', [
            'operating_system' => $agentBrowserInfo['os_platform'],
            'browser'          => $agentBrowserInfo['browser'],
            'ip'               => $agentIpInfo['ip'],
            'time'             => $agentIpInfo['time']
        ],['email']);

        $toast[] = ['success', 'Password reset successfully'];
        return to_route('agent.login.form')->withToasts($toast);
    }
}
