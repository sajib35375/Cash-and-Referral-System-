<?php

namespace App\Http\Controllers\Agent;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Request;

class AuthorizationController extends Controller
{
    function authorizeForm(){
        $agent = auth()->guard('agent')->user();

        if (!$agent->status) {
            $pageTitle = 'Banned';
            $type      = 'ban';
        }elseif(!$agent->ec) {
            $type          = 'email';
            $pageTitle     = 'Confirm Email';
            $toastTemplate = 'EVER_CODE';
        }elseif (!$agent->sc) {
            $type          = 'sms';
            $pageTitle     = 'Confirm Mobile Number';
            $toastTemplate = 'SVER_CODE';
        }elseif (!$agent->tc) {
            $pageTitle = '2FA Confirmation';
            $type      = '2fa';
        }else{
            return to_route('agent.dashboard');
        }

        if (!$this->checkCodeValidity($agent) && ($type != '2fa') && ($type != 'ban')) {
            $agent->ver_code         = verificationCode(6);
            $agent->ver_code_send_at = now();
            $agent->save();

            notify($agent, $toastTemplate, [
                'code' => $agent->ver_code
            ],[$type]);
        }

        return view($this->activeTheme. 'agent.auth.authorization.'.$type, compact('agent', 'pageTitle'));
    }


    function emailVerification() {
        $verCode  = $this->codeValidation(request());
        $agent    = auth()->guard('agent')->user();

        if ($agent->ver_code == $verCode) {
            $agent->ec               = ManageStatus::VERIFIED;
            $agent->ver_code         = null;
            $agent->ver_code_send_at = null;
            $agent->save();

            return to_route('agent.dashboard');
        }

        throw ValidationException::withMessages(['code' => 'Verification code didn\'t match!']);
    }

    function sendVerifyCode($type){
        $agent = auth()->guard('agent')->user();

        if ($this->checkCodeValidity($agent)) {
            $targetTime = $agent->ver_code_send_at->addMinutes(2)->timestamp;
            $delay      = $targetTime - time();
            throw ValidationException::withMessages(['resend' => 'Please try after ' . $delay . ' seconds']);
        }

        $agent->ver_code         = verificationCode(6);
        $agent->ver_code_send_at = now();
        $agent->save();

        if ($type == 'email') {
            $type = 'email';
            $toastTemplate = 'EVER_CODE';
        } else {
            $type = 'sms';
            $toastTemplate = 'SVER_CODE';
        }

        notify($agent, $toastTemplate, [
            'code' => $agent->ver_code
        ],[$type]);

        $toast[] = ['success', 'Verification code send success'];
        return back()->withToasts($toast);
    }

    function mobileVerification(){
        $verCode  = $this->codeValidation(request());
        $agent    = auth()->guard('agent')->user();

        if ($agent->ver_code == $verCode) {
            $agent->sc               = ManageStatus::VERIFIED;
            $agent->ver_code         = null;
            $agent->ver_code_send_at = null;
            $agent->save();

            return to_route('agent.dashboard');
        }

        throw ValidationException::withMessages(['code' => 'Verification code didn\'t match!']);
    }

    function g2faVerification()
    {
        $verCode  = $this->codeValidation(request());
        $agent    = auth()->guard('agent')->user();
        $response = verifyG2fa($agent, $verCode);

        if ($response) {
            $toast[] = ['success', 'Verification success'];
        }else{
            $toast[] = ['error', 'Wrong verification code'];
        }

        return back()->withToasts($toast);
    }


    protected function checkCodeValidity($agent, $addMin = 2) {
        if (!$agent->ver_code_send_at){
            return false;
        }

        if ($agent->ver_code_send_at->addMinutes($addMin) < now()) {
            return false;
        }

        return true;
    }

    protected function codeValidation() {
        $this->validate(request(), [
            'code'   => 'required|array|min:6',
            'code.*' => 'required|integer',
        ]);

        return (int)(implode("", request('code')));
    }
}
