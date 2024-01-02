<?php

namespace App\Http\Controllers\Gateway;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Models\AdminNotification;
use App\Models\Agent;
use App\Models\Deposit;
use App\Models\GatewayCurrency;
use App\Models\Transaction;

class PaymentController extends Controller
{
    function deposit() {
        $gatewayCurrency = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->active();
        })->with('method')->orderby('method_code')->get();

        $pageTitle = 'Deposit Methods';

        return view($this->activeTheme . 'agent.deposit.create', compact('gatewayCurrency', 'pageTitle'));

    }

    function depositInsert() {
        $this->validate(request(), [
            'amount'   => 'required|numeric|gt:0',
            'gateway'  => 'required',
            'currency' => 'required',
        ]);

        $agent = auth()->guard('agent')->user();

        $gate  = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->active();
        })->where('method_code', request('gateway'))->where('currency', request('currency'))->first();

        if (!$gate) {
            $toast[] = ['error', 'Invalid gateway'];
            return back()->withToasts($toast);
        }

        if ($gate->min_amount > request('amount') || $gate->max_amount < request('amount')) {
            $toast[] = ['error', 'Please follow deposit limit'];
            return back()->withToasts($toast);
        }

        $charge    = $gate->fixed_charge + (request('amount') * $gate->percent_charge / 100);
        $payable   = request('amount') + $charge;
        $final_amo = $payable * $gate->rate;

        $deposit                  = new Deposit();
        $deposit->agent_id        = $agent ? $agent->id : 0;
        $deposit->method_code     = $gate->method_code;
        $deposit->method_currency = strtoupper($gate->currency);
        $deposit->amount          = request('amount');
        $deposit->charge          = $charge;
        $deposit->rate            = $gate->rate;
        $deposit->final_amo       = $final_amo;
        $deposit->btc_amo         = 0;
        $deposit->btc_wallet      = "";
        $deposit->trx             = getTrx();
        $deposit->save();


        session()->put('Track', $deposit->trx);

        return to_route('agent.deposit.confirm');

    }

    function depositConfirm() {
        $track   = session()->get('Track');
        $deposit = Deposit::where('trx', $track)->initiate()->orderBy('id', 'DESC')->with('gateway')->firstOrFail();


        if ($deposit->method_code >= 1000) {
            return to_route('agent.deposit.manual.confirm');
        }

        $dirName = $deposit->gateway->alias;
        $new = __NAMESPACE__ . '\\' . $dirName . '\\ProcessController';



        $data = $new::process($deposit);
        $data = json_decode($data);

        if (isset($data->error)) {
            $toast[] = ['error', $data->message];
            return to_route(gatewayRedirectUrl())->withToasts($toast);
        }
        if (isset($data->redirect)) {
            return redirect($data->redirect_url);
        }

        // for Stripe V3
        if(@$data->session){
            $deposit->btc_wallet = $data->session->id;
            $deposit->save();
        }

        $pageTitle = 'Deposit Confirm';

        return view($this->activeTheme . $data->view, compact('data', 'pageTitle', 'deposit'));


    }

    static function userDataUpdate($deposit, $isManual = null) {
        if ($deposit->status == ManageStatus::PAYMENT_INITIATE || $deposit->status == ManageStatus::PAYMENT_PENDING) {
            $deposit->status = ManageStatus::PAYMENT_SUCCESS;
            $deposit->save();

            $receiver = null;
            $transaction = new Transaction();
            $adminNotification = new AdminNotification();

            $receiver = Agent::find($deposit->agent_id);
            $transaction->agent_id = $receiver->id;
            $adminNotification->agent_id = $receiver->id;


            $receiver->balance += $deposit->amount;
            $receiver->save();


            $transaction->amount       = $deposit->amount;
            $transaction->post_balance = $receiver->balance;
            $transaction->charge       = $deposit->charge;
            $transaction->trx_type     = '+';
            $transaction->details      = 'Deposit Via ' . $deposit->gatewayCurrency()->name;
            $transaction->trx          = $deposit->trx;
            $transaction->remark       = 'deposit';
            $transaction->save();

            if (!$isManual) {
                $adminNotification->title     = 'Deposit successful via '.$deposit->gatewayCurrency()->name;
                $adminNotification->click_url = urlPath('admin.deposit.done');
                $adminNotification->save();
            }

            notify($receiver, $isManual ? 'DEPOSIT_APPROVE' : 'DEPOSIT_COMPLETE', [
                'method_name'     => $deposit->gatewayCurrency()->name,
                'method_currency' => $deposit->method_currency,
                'method_amount'   => showAmount($deposit->final_amo),
                'amount'          => showAmount($deposit->amount),
                'charge'          => showAmount($deposit->charge),
                'rate'            => showAmount($deposit->rate),
                'trx'             => $deposit->trx,
                'post_balance' => showAmount($receiver->balance)
            ]);
        }
    }

    function manualDepositConfirm() {
        $track   = session()->get('Track');
        $deposit = Deposit::with('gateway')->initiate()->where('trx', $track)->first();

        if (!$deposit) {
            return to_route(gatewayRedirectUrl());
        }

        if ($deposit->method_code > 999) {
            $pageTitle = 'Deposit Confirm';
            $method    = $deposit->gatewayCurrency();
            $gateway   = $method->method;

            return view($this->activeTheme . 'agent.payment.manual', compact('deposit', 'pageTitle', 'method', 'gateway'));

        }

        abort(404);
    }

    function manualDepositUpdate() {
        $track   = session()->get('Track');
        $deposit = Deposit::with('gateway')->initiate()->where('trx', $track)->first();
        if (!$deposit) {
            return to_route(gatewayRedirectUrl());
        }

        $gatewayCurrency = $deposit->gatewayCurrency();
        $gateway         = $gatewayCurrency->method;
        $formData        = $gateway->form->form_data;

        $formProcessor  = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);

        request()->validate($validationRule);
        $userData = $formProcessor->processFormData(request(), $formData);

        $deposit->detail = $userData;
        $deposit->status = ManageStatus::PAYMENT_PENDING;
        $deposit->save();

        $receiver = null;

        $receiver = $deposit->agent;


        $adminNotification            = new AdminNotification();
        $adminNotification->agent_id   = $deposit->agent_id ? $deposit->agent->id : 0;
        $adminNotification->title     = 'Deposit request from '. $receiver->username;
        $adminNotification->click_url = urlPath('admin.deposit.pending');
        $adminNotification->save();



        notify($receiver, 'DEPOSIT_REQUEST', [
            'method_name'     => $deposit->gatewayCurrency()->name,
            'method_currency' => $deposit->method_currency,
            'method_amount'   => showAmount($deposit->final_amo),
            'amount'          => showAmount($deposit->amount),
            'charge'          => showAmount($deposit->charge),
            'rate'            => showAmount($deposit->rate),
            'trx'             => $deposit->trx
        ]);

        $toast[] = ['success', 'You have deposit request has been taken'];

        return to_route('agent.deposit.history')->withToasts($toast);
    }
}
