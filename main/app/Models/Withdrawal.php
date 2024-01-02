<?php

namespace App\Models;

use App\Constants\ManageStatus;
use App\Traits\Searchable;
use App\Traits\UniversalStatus;
use Illuminate\Database\Eloquent\Model;

class Withdrawal extends Model
{
    use UniversalStatus, Searchable;

    protected $casts = [
        'withdraw_information' => 'object'
    ];

    protected $hidden = [
        'withdraw_information'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function agent()
    {
        return $this->belongsTo(Agent::class);
    }

    public function method()
    {
        return $this->belongsTo(WithdrawMethod::class, 'method_id');
    }

    // Scope
    public function scopePending($query)
    {
        return $query->where('status', ManageStatus::PAYMENT_PENDING);
    }

    public function scopeCanceled($query)
    {
        return $query->where('status', ManageStatus::PAYMENT_REJECT);
    }

    public function scopeDone($query)
    {
        return $query->where('status', ManageStatus::PAYMENT_SUCCESS);
    }

    public function scopeIndex($query)
    {
        return $query->where('status', '!=', ManageStatus::PAYMENT_INITIATE);
    }

    public function scopeInitiate($query)
    {
        return $query->where('status', ManageStatus::PAYMENT_INITIATE);
    }
}
