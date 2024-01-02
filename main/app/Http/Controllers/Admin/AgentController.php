<?php

namespace App\Http\Controllers\Admin;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Models\Agent;
use App\Models\Deposit;
use App\Models\Ref;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AgentController extends Controller
{
    function index(){
        $pageTitle  = 'All Agents';
        $agents     = $this->agentData();

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }

    function active() {
        $pageTitle  = 'Active Agents';
        $agents     = $this->agentData('active');

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }

    function banned() {
        $pageTitle  = 'Banned Agents';
        $agents     = $this->agentData('banned');

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }

    function kycPending() {
        $pageTitle  = 'KYC Pending Agents';
        $agents     = $this->agentData('kycPending');

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }

    function kycUnConfirmed() {
        $pageTitle  = 'KYC Unconfirmed Agents';
        $agents     = $this->agentData('kycUnconfirmed');

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }

    function emailUnConfirmed() {
        $pageTitle = 'Email Unconfirmed Agents';
        $agents     = $this->agentData('emailUnconfirmed');

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }

    function mobileUnConfirmed() {
        $pageTitle = 'Mobile Unconfirmed Agents';
        $agents     = $this->agentData('mobileUnconfirmed');

        return view('admin.agent.index', compact('pageTitle', 'agents'));
    }



    function details($id){
        $agent              = Agent::findOrFail($id);
        $pageTitle         = 'Details - ' .$agent->username;
        $totalDeposit      = Deposit::where('agent_id', $agent->id)->done()->sum('amount');
        $totalWithdrawal   = Withdrawal::where('agent_id', $agent->id)->done()->sum('amount');
        $totalTransactions = Transaction::where('agent_id', $agent->id)->count();
        $countries         = json_decode(file_get_contents(resource_path('views/partials/country.json')));

        return view('admin.agent.detail', compact('pageTitle', 'agent', 'totalDeposit', 'totalWithdrawal', 'totalTransactions', 'countries'));
    }

    function update($id){
        $agent         = Agent::findOrFail($id);
        $countryData  = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $countryArray = (array)$countryData;
        $countries    = implode(',', array_keys($countryArray));
        $countryCode  = request('country');
        $country      = $countryData->$countryCode->country;
        $dialCode     = $countryData->$countryCode->dial_code;

        $this->validate(request(), [
            'firstname' => 'required|string|max:40',
            'lastname'  => 'required|string|max:40',
            'email'     => 'required|email|string|max:40|unique:agents,email,' . $agent->id,
            'mobile'    => 'required|string|max:40|unique:agents,mobile,' . $agent->id,
            'country'   => 'required|in:' . $countries,
        ]);

        $agent->mobile       = $dialCode.request('mobile');
        $agent->country_name = $country;
        $agent->country_code = $countryCode;
        $agent->firstname    = request('firstname');
        $agent->lastname     = request('lastname');
        $agent->email        = request('email');
        $agent->ec           = request('ec') ? ManageStatus::VERIFIED : ManageStatus::UNVERIFIED;
        $agent->sc           = request('sc') ? ManageStatus::VERIFIED : ManageStatus::UNVERIFIED;
        $agent->ts           = request('ts') ? ManageStatus::ACTIVE   : ManageStatus::INACTIVE;
        $agent->address      = [
                                'city'    => request('city'),
                                'state'   => request('state'),
                                'zip'     => request('zip'),
                                'country' => @$country,
                            ];
        if (!request('kc')) {
            $agent->kc = ManageStatus::UNVERIFIED;

            if ($agent->kyc_data) {
                foreach ($agent->kyc_data as $kycData) {
                    if ($kycData->type == 'file') {
                        fileManager()->removeFile(getFilePath('verify').'/'.$kycData->value);
                    }
                }
            }

            $agent->kyc_data = null;
        }else{
            $agent->kc = ManageStatus::VERIFIED;
        }
        $agent->save();

        $toast[] = ['success', 'Agent details updated success'];
        return back()->withToasts($toast);
    }

    function login($id) {
        Auth::guard('agent')->loginUsingId($id);
        return to_route('agent.dashboard');
    }

    function balanceUpdate( $id) {
        $this->validate(request(), [
            'amount' => 'required|numeric|gt:0',
            'act'    => 'required|in:add,sub',
            'remark' => 'required|string|max:255',
        ]);

        $agent   = Agent::findOrFail($id);
        $amount = request('amount');
        $trx    = getTrx();

        $transaction = new Transaction();

        if (request('act') == 'add') {
            $agent->balance        += $amount;
            $transaction->trx_type = '+';
            $transaction->remark   = 'balance_add';
            $notifyTemplate        = 'BAL_ADD';

            $toast[] = ['success', bs('cur_sym') . $amount . ' add success'];

        } else {
            if ($amount > $agent->balance) {
                $toast[] = ['error', $agent->username . ' doesn\'t have sufficient balance.'];
                return back()->withToasts($toast);
            }

            $agent->balance        -= $amount;
            $transaction->trx_type = '-';
            $transaction->remark   = 'balance_subtract';
            $notifyTemplate        = 'BAL_SUB';

            $toast[] = ['success', bs('cur_sym') . $amount . ' subtract success'];
        }

        $agent->save();

        $transaction->agent_id      = $agent->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $agent->balance;
        $transaction->charge       = 0;
        $transaction->trx          =  $trx;
        $transaction->details      = request('remark');
        $transaction->save();

        notify($agent, $notifyTemplate, [
            'trx'          => $trx,
            'amount'       => showAmount($amount),
            'remark'       => request('remark'),
            'post_balance' => showAmount($agent->balance)
        ]);

        return back()->withToasts($toast);
    }

    function status($id) {
        $agent = Agent::findOrFail($id);

        if ($agent->status == ManageStatus::ACTIVE) {
            $this->validate(request(), [
                'ban_reason'=>'required|string|max:255'
            ]);

            $agent->status = ManageStatus::INACTIVE;
            $agent->ban_reason = request('ban_reason');
            $toast[] = ['success','User ban success'];
        }else{
            $agent->status = ManageStatus::ACTIVE;
            $agent->ban_reason = null;
            $toast[] = ['success','User unbanned success'];
        }

        $agent->save();

        return back()->withToasts($toast);
    }

    function kycApprove($id)
    {
        $agent     = Agent::findOrFail($id);
        $agent->kc = ManageStatus::VERIFIED;
        $agent->save();

        notify($agent, 'KYC_APPROVE', []);

        $toast[] = ['success', 'KYC approval success'];
        return back()->withToasts($toast);
    }

    function kycCancel($id) {
        $agent           = Agent::findOrFail($id);

        foreach ($agent->kyc_data as $kycData) {
            if ($kycData->type == 'file') {
                fileManager()->removeFile(getFilePath('verify').'/'.$kycData->value);
            }
        }

        $agent->kc       = ManageStatus::UNVERIFIED;
        $agent->kyc_data = null;
        $agent->save();

        notify($agent, 'KYC_REJECT', []);

        $toast[] = ['success', 'KYC cancellation success'];
        return back()->withToasts($toast);
    }

    function refSystem() {
        $pageTitle = 'Referral System';
        return view('admin.agent.refSystem.refSystem',compact('pageTitle'));
    }

    function refSystemStore() {
        $this->validate(request(),[
            'level'     => 'required|array|min:1',
            'level.*'   => 'required|int|gt:0',
            'type'      => 'required|string|max:40',
            'percent'   => 'required|array|min:1',
            'percent.*' => 'required|numeric|gte:0',
        ]);

        $level  = request('level');
        Ref::query()->delete();

        for ( $i = 0; $i < count($level); $i++ ) {
            $ref                  = new Ref();
            $ref->level           = request('level')[$i];
            $ref->type            = request('type');
            $ref->percent         = request('percent')[$i];
            $ref->save();
        }

        $toast[] = ['success', 'Ref Data Insert Successfully'];
        return back()->withToasts($toast);
    }
    protected function agentData($scope = null){
        if ($scope) {
            $agents = Agent::$scope();
        }else{
            $agents = Agent::query();
        }

        return $agents->searchable(['username', 'email'])->dateFilter()->latest()->paginate(getPaginate());
    }
}
