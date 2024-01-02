<?php

namespace App\Http\Controllers\Agent;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Models\CashOut;
use Illuminate\Http\Request;

class CashOutController extends Controller
{
    function cashOutLog() {
        $pageTitle = 'cash Out';
        $cashOut   = CashOut::with('user')->where('agent_id',auth()->guard('agent')->id())->paginate(getPaginate());
        return view($this->activeTheme. 'agent.cash.cashOutLog',compact('pageTitle','cashOut'));
    }

    function cashOutPaid($id) {
        $cashStatus         = CashOut::find($id);
        $cashStatus->status = ManageStatus::YES;
        $cashStatus->save();

        $toast[] = ['success', 'Cash Out Paid Successfully'];
        return back()->withToasts($toast);
    }
}
