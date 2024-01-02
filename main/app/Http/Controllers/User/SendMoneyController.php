<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\AdminNotification;
use App\Models\Charge;
use App\Models\SendMoney;
use App\Models\Transaction;
use App\Models\User;
use Carbon\Carbon;

class SendMoneyController extends Controller
{
    function sendMoney() {
        $pageTitle     = 'Send Money';
        $chargeSetting = Charge::first();

        return view($this->activeTheme. 'user.sendMoney.sendMoney',compact('pageTitle', 'chargeSetting'));
    }

    function getUserData() {
        $mobileUsername = request('mobile_username');
        $userData       = User::where(function($q) use ($mobileUsername) {
                            $q->where('mobile', $mobileUsername)->orWhere('username', $mobileUsername);
                        })->where('id', '!=', auth()->id())->active()->first();

        if (!$userData) {
            return response()->json(['error' => 'User not found']);
        } else {
            return response()->json([
                'success' => 'User found successfully',
                'userId'  => $userData->id
            ]);
        }
    }

    function getUserDataStore() {
        $chargeSetting    = Charge::first();

        $this->validate(request(),[
            'user_id' => 'required|int|gt:0',
            'amount'      => "required|gt:0|between:$chargeSetting->send_money_min,$chargeSetting->send_money_max"
        ]);

        $receiver    = User::findOrFail(request('user_id'));
        $sender      = auth()->user();
        $amount      = request('amount');
        $charge      = $chargeSetting->send_money_charge_fixed + ( ($amount * $chargeSetting->send_money_charge_percentage) / 100);
        $finalAmount = $amount + $charge;

        if ($amount > $sender->balance) {
            $toast[] = ['error', 'You do not have sufficient balance to make send money'];
            return back()->withToasts($toast);
        }

        $sender->balance          -= $finalAmount;
        $sender->save();

        $receiver->balance         += $amount;
        $receiver->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $sender->id;
        $transaction->amount       = $amount;
        $transaction->charge       = $charge;
        $transaction->post_balance = $sender->balance;
        $transaction->trx_type     = '-';
        $transaction->details      = 'Send money to '. $receiver->mobile;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'send_money';
        $transaction->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $receiver->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $receiver->balance;
        $transaction->trx_type     = '+';
        $transaction->details      = 'Received money from '. $sender->mobile;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'send_money';
        $transaction->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = $sender->id;
        $adminNotification->title     = $sender->username.' send money to '.$receiver->username;
        $adminNotification->click_url = urlPath('admin.cash.send.index');
        $adminNotification->save();

        $sendMoney                     = new SendMoney();
        $sendMoney->receiver_id        = $receiver->id;
        $sendMoney->sender_id          = $sender->id;
        $sendMoney->receiver_amount    = $amount;
        $sendMoney->sender_amount      = $finalAmount;
        $sendMoney->charge             = $charge;
        $sendMoney->created_at         = Carbon::now();
        $sendMoney->save();

        $toast[] = ['success', 'User To User Send Money Successfully'];
        return back()->withToasts($toast);
    }
    function sendMoneyLog() {
        $pageTitle = 'Send Money';
        $sendMoney = SendMoney::with('receiver','sender')->paginate(getPaginate());

        return view($this->activeTheme.'user.sendMoney.sendMoneyLog',compact('pageTitle','sendMoney'));
    }
}
