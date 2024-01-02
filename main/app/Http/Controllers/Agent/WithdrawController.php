<?php

namespace App\Http\Controllers\Agent;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Models\AdminNotification;
use App\Models\Transaction;
use App\Models\Withdrawal;
use App\Models\WithdrawMethod;

class WithdrawController extends Controller
{
    function withdraw(){
        $pageTitle = 'Make Agent Withdraw';
        $methods   = WithdrawMethod::active()->get();;

        return view($this->activeTheme . 'agent.withdraw.methods', compact('pageTitle', 'methods'));
    }

    function store(){
        $this->validate(request(), [
            'method_id' => 'required',
            'amount'    => 'required|numeric|gt:0'
        ]);

        $agent   = auth()->guard('agent')->user();
        $amount  = request('amount');
        $method  = WithdrawMethod::where('id', request('method_id'))->active()->firstOrFail();

        if ($amount < $method->min_amount) {
            $toast[] = ['error', 'The requested amount is below the minimum allowable amount'];
            return back()->withToasts($toast);
        }

        if ($amount > $method->max_amount) {
            $toast[] = ['error', 'The requested amount exceeds the maximum allowable amount'];
            return back()->withToasts($toast);
        }

        if ($amount > $agent->balance) {
            $toast[] = ['error', 'You lack the necessary balance to process a withdrawal'];
            return back()->withToasts($toast);
        }

        $charge      = $method->fixed_charge + ($amount * $method->percent_charge / 100);
        $afterCharge = $amount - $charge;
        $finalAmount = $afterCharge * $method->rate;

        $withdraw               = new Withdrawal();
        $withdraw->method_id    = $method->id; // wallet method ID
        $withdraw->agent_id     = $agent->id;
        $withdraw->amount       = $amount;
        $withdraw->currency     = $method->currency;
        $withdraw->rate         = $method->rate;
        $withdraw->charge       = $charge;
        $withdraw->final_amount = $finalAmount;
        $withdraw->after_charge = $afterCharge;
        $withdraw->trx          = getTrx();
        $withdraw->save();

        session()->put('wtrx', $withdraw->trx);
        return to_route('agent.withdraw.preview');
    }

    function preview(){
        $pageTitle = 'Withdraw Preview';
        $withdraw  = Withdrawal::with('method','agent')->where('trx', session()->get('wtrx'))->initiate()->latest()->firstOrFail();
        return view($this->activeTheme . 'agent.withdraw.preview', compact('pageTitle','withdraw'));
    }

    function submit() {
        $withdraw = Withdrawal::with('method', 'agent')->where('trx', session()->get('wtrx'))->initiate()->latest()->firstOrFail();

        $method   = $withdraw->method;

        if ($method->status == ManageStatus::INACTIVE) {
            abort(404);
        }

        $formData       = $method->form->form_data;
        $formProcessor  = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);

        request()->validate($validationRule);

        $userData  = $formProcessor->processFormData(request(), $formData);
        $agent     = auth()->guard('agent')->user();

        if ($agent->ts) {
            $response = verifyG2fa($agent, request('authenticator_code'));

            if (!$response) {
                $toast[] = ['error', 'Wrong verification code'];
                return back()->withToasts($toast);
            }
        }

        if ($withdraw->amount > $agent->balance) {
            $toast[] = ['error', 'Your requested amount exceeds your current balance'];
            return back()->withToasts($toast);
        }

        $withdraw->status               = ManageStatus::PAYMENT_PENDING;
        $withdraw->withdraw_information = $userData;
        $withdraw->save();

        $agent->balance -=  $withdraw->amount;
        $agent->save();

        $transaction               = new Transaction();
        $transaction->agent_id     = $withdraw->agent_id;
        $transaction->amount       = $withdraw->amount;
        $transaction->post_balance = $agent->balance;
        $transaction->charge       = $withdraw->charge;
        $transaction->trx_type     = '-';
        $transaction->details      = showAmount($withdraw->final_amount) . ' ' . $withdraw->currency . ' Withdraw Via ' . $withdraw->method->name;
        $transaction->trx          = $withdraw->trx;
        $transaction->remark       = 'withdraw';
        $transaction->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->agent_id  = $agent->id;
        $adminNotification->title     = 'New withdraw request from '.$agent->username;
        $adminNotification->click_url = urlPath('agent.login');
        $adminNotification->save();

        notify($agent, 'WITHDRAW_REQUEST', [
            'method_name'     => $withdraw->method->name,
            'method_currency' => $withdraw->currency,
            'method_amount'   => showAmount($withdraw->final_amount),
            'amount'          => showAmount($withdraw->amount),
            'charge'          => showAmount($withdraw->charge),
            'rate'            => showAmount($withdraw->rate),
            'trx'             => $withdraw->trx,
            'post_balance'    => showAmount($agent->balance),
        ]);

        $toast[] = ['success', 'Withdraw request sent success'];
        return to_route('agent.withdraw.history')->withToasts($toast);
    }

    function history() {
        $pageTitle = 'Withdraw History';
        $withdraws = Withdrawal::where('agent_id', auth()->guard('agent')->id())->searchable(['trx'])->index()->with('method')->latest()->paginate(getPaginate());

        return view($this->activeTheme . 'agent.withdraw.index', compact('pageTitle', 'withdraws'));
    }
}
