<?php

namespace App\Http\Controllers\Agent;

use App\Http\Controllers\Controller;
use App\Models\AdminNotification;
use App\Models\CashIn;
use App\Models\Charge;
use App\Models\Commission;
use App\Models\Transaction;
use App\Models\User;
use Carbon\Carbon;

class CashInController extends Controller
{
    function CashIn() {
        $pageTitle      = 'Cash In';
        $chargeSetting  = Charge::first();

        return view($this->activeTheme. 'agent.cash.cashIn', compact('pageTitle','chargeSetting'));
    }

    function cashInData() {
        $mobileUsername = request('mobile_username');
        $userData       = User::where('mobile', $mobileUsername)->orWhere('username',$mobileUsername)->active()->first();

        if(!$userData) {
            return response()->json(['error'=>'Incorrect Mobile Or Username']);
        } else {
            return response()->json([
                'success' => 'Successfully found User',
                'userId'  => $userData->id
            ]);
        }
    }

    function cashInBalanceStore() {
        $chargeSetting = Charge::first();

        $this->validate(request(),[
            'user_id' => 'required|int|gt:0',
            'amount'  => "required|gt:0|between:$chargeSetting->cash_in_min,$chargeSetting->cash_in_max"
        ]);

        $userId               = request('user_id');
        $user                 = User::findOrFail($userId);
        $agent                = auth()->guard('agent')->user();
        $amount               = request('amount');
        $charge               = $chargeSetting->cash_in_charge_fixed + ( ($amount * $chargeSetting->cash_in_charge_percentage) / 100);
        $commissionAmount     = ($chargeSetting->cash_in_commission * $amount) / 100;

        if ($amount > $agent->balance) {
            $toast[] = ['error', 'You do not have sufficient balance to make Cash In from agent'];
            return back()->withToasts($toast);
        }

        $agent->balance  -= $amount;
        $agent->save();

        $user->balance    = ($user->balance + $amount) - $charge;
        $user->save();

        $cashIn               = new CashIn();
        $cashIn->user_id      = $user->id;
        $cashIn->agent_id     = $agent->id;
        $cashIn->user_amount  = $amount - $charge;
        $cashIn->agent_amount = $amount;
        $cashIn->charge       = $charge;
        $cashIn->created_at   = Carbon::now();
        $cashIn->save();


        $transaction               = new Transaction();
        $transaction->agent_id     = $agent->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $agent->balance;
        $transaction->trx_type     = '-';
        $transaction->details      = 'Cash in for '. $user->username;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'cash_in';
        $transaction->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $amount;
        $transaction->charge       = $charge;
        $transaction->post_balance = $user->balance;
        $transaction->trx_type     = '+';
        $transaction->details      = 'Cash in from '. $agent->username;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'cash_in';
        $transaction->save();

        $transaction               = new Transaction();
        $transaction->agent_id     = $agent->id;
        $transaction->amount       = $commissionAmount;
        $transaction->trx_type     = '+';
        $transaction->details      = 'Commission for cash in';
        $transaction->trx          = getTrx();
        $transaction->remark       = 'cash_in_commission';
        $transaction->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = $user->id;
        $adminNotification->agent_id  = $agent->id;
        $adminNotification->title     = $user->username.' cash In from '.$agent->username;
        $adminNotification->click_url = urlPath('admin.cash.in.index');
        $adminNotification->save();

        $commission             = new Commission();
        $commission->agent_id   = $agent->id;
        $commission->commission = $commissionAmount;
        $commission->type       = 'Cash In';
        $commission->created_at = Carbon::now();
        $commission->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->agent_id  = $agent->id;
        $adminNotification->title     = 'Cash In Commission';
        $adminNotification->click_url = urlPath('admin.cash.commission.index');
        $adminNotification->save();

        if (bs('cashin_commission')){
         levelCommission($user, $amount, 'cashin');
        }

        $toast[] = ['success', 'User Cash In Successfully Done'];
        return back()->withToasts($toast);
    }

    function cashInLog() {
        $pageTitle = 'Cash In Log';
        $cashIns = CashIn::with('user','agent')->paginate(getPaginate());

        return view($this->activeTheme.'agent.cash.cashInLog',compact('pageTitle','cashIns'));
    }

}
