<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Charge;
use Carbon\Carbon;

class ChargeController extends Controller
{
    function index(){
        $pageTitle = 'All Charges';
        $charges = Charge::first();
        return view('admin.charge.charge',compact('pageTitle','charges'));
    }

    function chargeViewStore(){
        $charges = Charge::first();

        // Cash Out Minimum validation
        $cashOutMin             = request('cash_out_min');
        $cashOutFixCharge       = request('cash_out_charge_fixed');
        $cashOutPercentCharge   = request('cash_out_charge_percentage');
        $cashOutMinCharge       = ( ($cashOutPercentCharge * $cashOutMin) / 100) + $cashOutFixCharge;

        if ($cashOutMin < $cashOutMinCharge){
            $toast[] = ['error', 'The total Cash Out charge exceeds the minimum amount'];
            return back()->withToasts($toast);
        }

        // Cash In Minimum Charge
        $cashInMin          = request('cash_in_min');
        $cashInFix          = request('cash_in_charge_fixed');
        $cashInPercent      = request('cash_in_charge_percentage');
        $cashInMinCharge    = (($cashInPercent * $cashInMin) / 100) + $cashInFix;

        if ($cashInMin < $cashInMinCharge){
            $toast[] = ['error', 'The total Cash In charge exceeds the minimum amount'];
            return back()->withToasts($toast);
        }

        // Send Money Minimum Charge
        $sendMoneyMin       = request('send_money_min');
        $sendMoneyFix       = request('send_money_charge_fixed');
        $sendMoneyPercent   = request('send_money_charge_percentage');
        $sendMoneyCharge    = (($sendMoneyPercent * $sendMoneyMin) / 100) + $sendMoneyFix;

        if ($sendMoneyMin < $sendMoneyCharge){
            $toast[] = ['error', 'The total Send Money charge exceeds the minimum amount'];
            return back()->withToasts($toast);
        }


        $charges->cash_out_charge_fixed         = request('cash_out_charge_fixed');
        $charges->cash_in_charge_fixed          = request('cash_in_charge_fixed');
        $charges->cash_out_commission           = request('cash_out_commission');
        $charges->send_money_charge_fixed       = request('send_money_charge_fixed');
        $charges->cash_out_charge_percentage    = request('cash_out_charge_percentage');
        $charges->cash_in_charge_percentage     = request('cash_in_charge_percentage');
        $charges->send_money_charge_percentage  = request('send_money_charge_percentage');
        $charges->cash_in_commission            = request('cash_in_commission');
        $charges->cash_out_max                  = request('cash_out_max');
        $charges->cash_out_min                  = request('cash_out_min');
        $charges->cash_in_min                   = request('cash_in_min');
        $charges->cash_in_max                   = request('cash_in_max');
        $charges->send_money_min                = request('send_money_min');
        $charges->send_money_max                = request('send_money_max');
        $charges->updated_at                    = Carbon::now();
        $charges->save();

        $toast[] = ['success', 'All Charges Set Successfully'];
        return back()->withToasts($toast);
    }
}
