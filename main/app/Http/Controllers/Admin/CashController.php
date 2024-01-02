<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CashIn;
use App\Models\CashOut;
use App\Models\Commission;
use App\Models\SendMoney;

class CashController extends Controller
{
    function cashOutIndex() {
        $pageTitle = 'Cash Out';
        $cashOut = CashOut::searchable(['user:username', 'agent:username'])->dateFilter()->with('user', 'agent')->latest()->paginate(getPaginate());

        return view('admin.cash.cashOut', compact('pageTitle', 'cashOut'));
    }

    function cashInIndex() {
        $pageTitle = 'Cash In';
        $cashIn = CashIn::searchable(['user:username', 'agent:username'])->dateFilter()->with('user','agent')->latest()->paginate(getPaginate());

        return view('admin.cash.cashIn',compact('pageTitle', 'cashIn'));
    }

    function sendMoneyIndex() {
        $pageTitle = 'Send Money';
        $sendMoney = SendMoney::searchable(['receiver:username', 'sender:username'])->dateFilter()->with('receiver', 'sender')->latest()->paginate(getPaginate());

        return view('admin.cash.sendMoney',compact('pageTitle','sendMoney'));
    }

    function commissionIndex() {
        $pageTitle = 'Commission';
        $commission = Commission::searchable(['agent:username'])->dateFilter()->with('agent')->latest()->paginate(getPaginate());

        return view('admin.cash.commission', compact('pageTitle','commission'));
    }

}
