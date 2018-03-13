<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminRole extends Model
{
    //
    protected $table = "admin_roles";

    protected $guarded = [];

    // 当前角色的所有权限
    public function permissions()
    {
        return $this->belongsToMany(AdminPermission::class, 'admin_permissions_role', 'role_id', 'permission_id')
            ->withPivot(['permission_id', 'role_id']);
    }

    // 赋予角色权限
    public function grantPermission($permission)
    {
        return $this->permissions()->save($permission);
    }

    // 取消角色权限
    public function deletePermission($permission)
    {
        return $this->permissions()->detach($permission);
    }

    // 判断角色是否有权限
    public function hasPermission($permission)
    {
        return $this->permissions->contains($permission);
    }
}
