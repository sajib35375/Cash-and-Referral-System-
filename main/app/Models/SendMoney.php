<?php

namespace App\Models;

use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;

class SendMoney extends Model
{
    use Searchable;

    public function receiver() {
        return $this->belongsTo(User::class, 'receiver_id', 'id');
    }

    public function sender() {
        return $this->belongsTo(User::class, 'sender_id', 'id');
    }
}
