<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Fan extends Model
{
    protected $table = "fans";

    // 粉丝用户
    public function fansUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'fan_id');
    }

    public function starsUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'star_id');
    }
}
