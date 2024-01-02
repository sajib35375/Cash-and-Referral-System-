<?php

namespace App\Http\Controllers\Admin;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Gateway\PaymentController;
use App\Models\Deposit;
use App\Models\Gateway;

class DepositController extends Controller
{
    function index() {
        $pageTitle   = 'All Deposits';
        $depositData = $this->depositData('index', $summery = true);
        $deposits    = $depositData['data'];
        $summery     = $depositData['summery'];
        $done        = $summery['done'];
        $pending     = $summery['pending'];
        $canceled    = $summery['canceled'];

        return view('admin.deposit.index', compact('pageTitle', 'deposits', 'done', 'pending', 'canceled'));
    }

    function pending() {
        $pageTitle = 'Pending Deposits';
        $deposits  = $this->depositData('pending');

        return view('admin.deposit.index', compact('pageTitle', 'deposits'));
    }

    function done() {
        $pageTitle = 'Done Deposits';
        $deposits  = $this->depositData('done');

        return view('admin.deposit.index', compact('pageTitle', 'deposits'));
    }

    function canceled() {
        $pageTitle = 'Canceled Deposits';
        $deposits  = $this->depositData('canceled');

        return view('admin.deposit.index', compact('pageTitle', 'deposits'));
    }

    function approve($id) {
        $deposit = Deposit::where('id', $id)->pending()->firstOrFail();
        PaymentController::userDataUpdate($deposit, true);

        $toast[] = ['success', 'Deposit approval success'];
        return back()->withToasts($toast);
    }

    function cancel() {
        $this->validate(request(), [
            'id' => 'required|int|gt:0',
            'admin_feedback' => 'required|max:255',
        ]);

        $deposit                 = Deposit::where('id', request('id'))->pending()->with('user')->firstOrFail();
        $deposit->status         = ManageStatus::PAYMENT_REJECT;
        $deposit->admin_feedback = request('admin_feedback');
        $deposit->save();

        notify($deposit->user, 'DEPOSIT_REJECT', [
            'method_name'       => $deposit->gatewayCurrency()->name,
            'method_currency'   => $deposit->method_currency,
            'method_amount'     => showAmount($deposit->final_amo),
            'amount'            => showAmount($deposit->amount),
            'charge'            => showAmount($deposit->charge),
            'rate'              => showAmount($deposit->rate),
            'trx'               => $deposit->trx,
            'rejection_message' => request('admin_feedback')
        ]);

        $toast[] = ['success', 'Deposit cancellation success'];
        return back()->withToasts($toast);
    }

    protected function depositData($scope = null, $summery = false) {
        if ($scope) {
            $deposits = Deposit::$scope()->with(['user','agent', 'gateway']);
        }else{
            $deposits = Deposit::with(['user','agent', 'gateway']);
        }

        $deposits = $deposits->searchable(['trx', 'user:username', 'agent:username'])->dateFilter();

        // By Payment Method
        if (request('method')) {
            $method   = Gateway::where('alias', request('method'))->firstOrFail();
            $deposits = $deposits->where('method_code', $method->code);
        }

        if (!$summery) {
            return $deposits->latest()->paginate(getPaginate());
        }else{
            $done     = clone $deposits;
            $pending  = clone $deposits;
            $canceled = clone $deposits;

            $doneSummery     = $done->done()->sum('amount');
            $pendingSummery  = $pending->pending()->sum('amount');
            $canceledSummery = $canceled->canceled()->sum('amount');

            return [
                'data' => $deposits->latest()->paginate(getPaginate()),
                'summery' => [
                    'done'     => $doneSummery,
                    'pending'  => $pendingSummery,
                    'canceled' => $canceledSummery
                ]
            ];
        }
    }
}
