<?php

namespace App\Http\Controllers\Admin;

use App\Constants\ManageStatus;
use App\Http\Controllers\Controller;
use App\Models\Referral;
use App\Models\Setting;

class ReferralController extends Controller
{
    function index() {
        $pageTitle = 'Referral System';
        $setting   = Setting::first();
        $referral  = Referral::all();
        return view('admin.user.refSystem.refSystem', compact('pageTitle','setting','referral'));
    }

    function referralStore() {
        $this->validate(request(),[
            'level'     => 'required|array|min:1',
            'level.*'   => 'required|int|gt:0',
            'type'      => 'required|string|max:40',
            'percent'   => 'required|array|min:1',
            'percent.*' => 'required|numeric|gte:0',
        ]);

            $level       = request('level');
            Referral::query()->delete();

        for ( $i = 0; $i < count($level); $i++ ) {
            $ref          = new Referral();
            $ref->level   = request('level')[$i];
            $ref->type    = request('type');
            $ref->percent = request('percent')[$i];
            $ref->save();
        }

        $toast[] = ['success', 'Ref Data Inserted Successfully'];
        return back()->withToasts($toast);
    }

    function statusDisable(){
        $setting                    = Setting::first();
        $setting->cashin_commission = ManageStatus::YES;
        $setting->save();

        $toast[] = ['success', 'Cash In Enable  Successfully'];
        return back()->withToasts($toast);
    }

    function statusEnable() {
        $setting                    = Setting::first();
        $setting->cashin_commission = ManageStatus::NO;
        $setting->save();

        $toast[] = ['success', 'cash In Disable Successfully'];
        return back()->withToasts($toast);
    }
}
