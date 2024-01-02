<?php

namespace App\Http\Controllers\Agent\Auth;

use App\Http\Controllers\Controller;
use App\Models\Agent;
use App\Models\AgentPasswordReset;

class ForgotPasswordController extends Controller
{
    function __construct() {
        parent::__construct();
        $this->middleware('guest');
    }

    function requestForm() {
        $pageTitle = 'Forgot Password';
        return view($this->activeTheme . 'agent.auth.password.email', compact('pageTitle'));
    }

    function sendResetCode() {
        $this->validate(request(), [
            'value' => 'required',
        ]);

        $fieldType = $this->findFieldType();
        $agent     = Agent::where($fieldType, request('value'))->first();

        if (!$agent) {
            $toast[] = ['error', 'No account corresponds to the given information'];
            return back()->withToasts($toast);
        }

        AgentPasswordReset::where('email', $agent->email)->delete();

        $verCode                = verificationCode(6);
        $passReset              = new AgentPasswordReset();
        $passReset->email       = $agent->email;
        $passReset->code        = $verCode;
        $passReset->created_at  = now();
        $passReset->save();

        $agentIpInfo      = getIpInfo();
        $agentBrowserInfo = osBrowser();

        notify($agent, 'PASS_RESET_CODE', [
            'code'             => $verCode,
            'operating_system' => $agentBrowserInfo['os_platform'],
            'browser'          => $agentBrowserInfo['browser'],
            'ip'               => $agentIpInfo['ip'],
            'time'             => $agentIpInfo['time']
        ],['email']);

        session()->put('agent_pass_res_email', $agent->email);

        $toast[] = ['success', 'Well, we found you as a registered one'];
        return to_route('agent.password.code.verification.form')->withToasts($toast);
    }

    function findFieldType()
    {
        $input = request('value');

        $fieldType = filter_var($input, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$fieldType => $input]);
        return $fieldType;
    }

    function verificationForm() {
        $pageTitle = 'Code Verification';
        $email     = session()->get('agent_pass_res_email');

        if (!$email) {
            $toast[] = ['error','Oops! session expired'];
            return to_route('agent.password.request.form')->withToasts($toast);
        }

        return view($this->activeTheme . 'agent.auth.password.codeVerification', compact('pageTitle', 'email'));
    }

    function verificationCode() {
        $this->validate(request(), [
            'code'   => 'required|array|min:6',
            'code.*' => 'required|integer',
            'email'  => 'required|email'
        ], [
            'code.*.required' => 'All code field is required',
            'code.*.integer'  => 'All code should be integer',
        ]);

        $email   = request('email');
        $verCode = (int)(implode("", request('code')));

        if (AgentPasswordReset::where('code', $verCode)->where('email', $email)->count() != 1) {
            $toast[] = ['error', 'Invalid verification code'];
            return to_route('agent.password.request.form')->withToasts($toast);
        }

        session()->flash('Agent_fpass_email', $email);

        $toast[] = ['success','Code matched. You can reset your password'];
        return to_route('agent.password.reset.form', $verCode)->withToasts($toast);
    }
}
