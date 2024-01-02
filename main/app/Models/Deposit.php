<?php

namespace App\Models;

use App\Constants\ManageStatus;
use App\Traits\Searchable;
use App\Traits\UniversalStatus;
use Illuminate\Database\Eloquent\Model;

class Deposit extends Model
{
    use UniversalStatus, Searchable;

    protected $casts = [
        'detail' => 'object'
    ];

    protected $hidden = ['detail'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function agent()
    {
        return $this->belongsTo(Agent::class);
    }

    public function gateway()
    {
        return $this->belongsTo(Gateway::class, 'method_code', 'code');
    }

    // Scope
    public function scopeGatewayCurrency()
    {
        return GatewayCurrency::where('method_code', $this->method_code)->where('currency', $this->method_currency)->first();
    }

    public function scopeBaseCurrency()
    {
        return @$this->gateway->crypto == ManageStatus::ACTIVE ? 'USD' : $this->method_currency;
    }

    public function scopePending($query)
    {
        return $query->where('method_code', '>=' ,1000)->where('status', ManageStatus::PAYMENT_PENDING);
    }

    public function scopeCanceled($query)
    {
        return $query->where('method_code', '>=', 1000)->where('status', ManageStatus::PAYMENT_REJECT);
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
