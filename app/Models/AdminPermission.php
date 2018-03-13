<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminPermission extends Model
{
//    protected $table = "admin_permissions";
    protected $guarded = [];

    // 权限属于能够角色
    public function roles()
    {
        return $this->belongsToMany(AdminRole::class, 'admin_permissions_role', 'permission_id', 'role_id')
            ->withPivot(['permission_id', 'role_id']);
    }
}
