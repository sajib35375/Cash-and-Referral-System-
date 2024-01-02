<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AgentPasswordReset extends Model
{
    public $timestamps = false;

    protected $hidden = [
        'code'
    ];
}
