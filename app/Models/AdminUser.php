<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class AdminUser extends Authenticatable
{
//    protected $fillable = ['name', 'password'];
    protected $guarded = [];

    //当我们不需要remember_token 把这个设置为空即可
    protected $rememberTokenName = '';


    // 用户有哪一些角色
    public function roles()
    {
        return $this->belongsToMany(AdminRole::class, 'admin_role_user', 'user_id', 'role_id')
            ->withPivot(['user_id', 'role_id']);
    }

    // 判断是否有某个角色
    public function isInRoles($roles)
    {
        return !!$roles->intersect($this->roles)->count();
    }

    // 给用户分配角色
    public function assignRole($role)
    {
        return $this->roles()->save($role);
    }

    // 取消用户分配的角色
    public function deleteRole($role)
    {
        return $this->roles()->detach($role);
    }

    // 判断用户是否有权限
    public function hasPermission($permission)
    {
        $this->isInRoles($permission->roles);
    }


}
