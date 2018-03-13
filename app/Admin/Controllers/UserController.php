<?php

namespace App\Admin\Controllers;

use App\Models\AdminRole;
use App\Models\AdminUser;
use Illuminate\Http\Request;

class UserController extends Controller
{

    // 管理员列表页面
    public function index()
    {
        $users = AdminUser::paginate(10);
        return view('/admin/user/index', compact('users'));
    }

    // 管理员创建页面
    public function create()
    {
        return view('/admin/user/add');
    }

    // 创建操作
    public function store(Request $request)
    {

        $this->validate($request, [
            'name' => 'required|min:2',
            'password' => 'required|min:5',
            'is_remember' => 'integer'
        ], [
            'required' => ':attribute 为必填项',
            'min' => ':attribute 长度不符合要求',
        ], [
            'name' => '用户名',
            'password' => '密码',
        ]);

        $name = $request->input('name');
        $password = bcrypt($request->input('password'));
        AdminUser::create(compact('name', 'password'));

        return redirect("/admin/users");
    }

    // 用户角色页面
    public function role(AdminUser $user)
    {
        $roles = AdminRole::all();
        $myRoles = $user->roles;
        return view('admin.user.role', compact('roles', 'myRoles', 'user'));
    }

    // 储存用户角色
    public function storeRole(Request $request, AdminUser $user)
    {
        $this->validate($request, [
            'roles' => 'required|array',
        ]);

        $roles = AdminRole::findMany($request->input('roles'));
        $myRoles = $user->roles;

        $addRoles = $roles->diff($myRoles);
        foreach ($addRoles as $role) {
            $user->assignRole($role);
        }

        $deleteRoles = $myRoles->diff($roles);
        foreach ($deleteRoles as $role) {
            $user->deleteRole($role);
        }

        return back();
    }
}