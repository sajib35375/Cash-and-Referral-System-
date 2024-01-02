<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\AdminNotification;
use App\Models\Agent;
use App\Models\CashOut;
use App\Models\Charge;
use App\Models\Commission;
use App\Models\Transaction;
use Carbon\Carbon;

class CashOutController extends Controller
{
    function CashOut() {
        $pageTitle  = 'User Cash Out';
        $charge     = Charge::first();
        return view($this->activeTheme . 'user.cash.cashout',compact('pageTitle','charge'));
    }

    function CashOutData() {
        $mobileUsername = request('mobile_username');
        $agentData      = Agent::where('mobile',$mobileUsername)->orWhere('username',$mobileUsername)->first(); // active use kora jai na

        if (!$agentData) {
            return response()->json(['error' => 'Agent not found']);
        }
        if ($agentData) {
            return response()->json([
                'success' => 'Agent found Successfully',
                'agentId' => $agentData->id
            ]);
        }
    }
    function CashOutStore() {
        $chargeSetting = Charge::first();

        $this->validate(request(),[
            'agent_id'  => 'required|int|gt:0',
            'amount'    => "required|gt:0|between:$chargeSetting->cash_out_min,$chargeSetting->cash_out_max"
        ]);

        $user           = auth()->user();
        $agentId        = request('agent_id');
        $agent          = Agent::findOrFail($agentId);
        $amount         = request('amount');

        $charge               = $chargeSetting->cash_out_charge_fixed + ( ($amount * $chargeSetting->cash_out_charge_percentage) / 100);
        $commissionCharge     = ($chargeSetting->cash_out_commission * $amount) / 100;


        $agent->balance += $amount;
        $agent->save();

        $transaction               = new Transaction();
        $transaction->agent_id     = $agent->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $agent->balance;
        $transaction->trx_type     = '+';
        $transaction->details      = 'Cash out for '. $user->username .' from '.$agent->username;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'cash_out';
        $transaction->save();

        if ($user->balance < ($amount + $charge)) {
            $toast[] = ['error', 'You do not have sufficient balance to make CashOut'];
            return back()->withToasts($toast);
        }

        $user->balance             = ($user->balance - $amount) - $charge;
        $user->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $amount;
        $transaction->charge       = $charge;
        $transaction->post_balance = $user->balance;
        $transaction->trx_type     = '-';
        $transaction->details      = 'Cash out from '. $agent->username;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'cash_in';
        $transaction->save();

        $transaction               = new Transaction();
        $transaction->agent_id     = $agent->id;
        $transaction->amount       = $commissionCharge;
        $transaction->trx_type     = '+';
        $transaction->details      = 'Commission for cash out';
        $transaction->trx          = getTrx();
        $transaction->remark       = 'cash_in_commission';
        $transaction->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = request('user_id');
        $adminNotification->agent_id  = auth()->guard('agent')->id();
        $adminNotification->title     = $user->username.' cash Out from '.$agent->username;
        $adminNotification->click_url = urlPath('admin.cash.out.index');
        $adminNotification->save();

        $cashOut                       = new CashOut();
        $cashOut->user_id              = $user->id;
        $cashOut->agent_id             = $agent->id;
        $cashOut->user_amount          = $amount + $charge;
        $cashOut->agent_amount         = $amount;
        $cashOut->charge               = $charge;
        $cashOut->created_at           = Carbon::now();
        $cashOut->save();

        $commission                    = new Commission();
        $commission->agent_id          = $agent->id;
        $commission->commission        = $commissionCharge;
        $commission->type              = 'CashOut';
        $commission->created_at        = Carbon::now();
        $commission->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->agent_id  = $agent->id;
        $adminNotification->title     = 'Cash Out Commission';
        $adminNotification->click_url = urlPath('admin.cash.commission.index');
        $adminNotification->save();

        $toast[] = ['success', 'User Cash Out Successfully Done'];
        return back()->withToasts($toast);
    }

    function cashOutLog() {
        $pageTitle = 'Cash out log';
        $cashOutLog = CashOut::with('agent')->paginate(getPaginate());
        return view($this->activeTheme.'user.cash.cashOutLog',compact('pageTitle','cashOutLog'));
    }
}
