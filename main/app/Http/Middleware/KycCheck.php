<?php

namespace App\Http\Middleware;

use App\Constants\ManageStatus;
use Closure;

class KycCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */

    public function handle($request, Closure $next)
    {
        $user = auth()->user();


        if ($user != null) {
            if ($user->kc == ManageStatus::UNVERIFIED) {
                $toast[] = ['error', 'You have not been KYC verified yet. Please submit the requested information to complete the process.'];
                return back()->withToasts($toast);
            }

            if ($user->kc == ManageStatus::PENDING) {
                $toast[] = ['warning', 'We\'re in the process of reviewing your KYC verification documents. Please be patient for admin approval.'];
                return back()->withToasts($toast);
            }
        }

        $agent = auth()->guard('agent')->user();

        if ($agent != null) {

        if ($agent->kc == ManageStatus::UNVERIFIED) {
            $toast[] = ['error', 'You have not been KYC verified yet. Please submit the requested information to complete the process.'];
            return back()->withToasts($toast);
        }

        if ($agent->kc == ManageStatus::PENDING) {
            $toast[] = ['warning', 'We\'re in the process of reviewing your KYC verification documents. Please be patient for admin approval.'];
            return back()->withToasts($toast);
        }
    }

        return $next($request);
    }
}
