<?php

namespace App\Admin\Controllers;

use App\Models\AdminPermission;
use App\Models\AdminRole;
use Illuminate\Http\Request;

class RoleController extends Controller
{

    // 角色列表
    public function index()
    {
        $roles = AdminRole::paginate(10);
        return view('admin.roles.index', compact('roles'));
    }

    // 创建角色
    public function create()
    {
        return view('admin.roles.add');
    }

    // 创建角色行为
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2',
            'description' => 'required',
        ]);

        AdminRole::create($request->only(['name', 'description']));

        return redirect('/admin/roles');
    }

    // 角色权限关系页面
    public function permission(AdminRole $role)
    {
        // 获取所有权限
        $permissions = AdminPermission::all();

        // 获取当前角色权限
        $myPermissions = $role->permissions;

        return view("admin.roles.permission", compact('permissions', 'myPermissions', 'role'));
    }

    //  储存角色权限行为
    public function storePermission(Request $request, AdminRole $role)
    {
        $this->validate($request, [
            'permissions' => 'required|array'
        ]);

        $permissions = AdminPermission::findMany($request->input('permissions'));
        $myPermissions = $role->permissions;

        //
        $addPermissions = $permissions->diff($myPermissions);
        foreach ($addPermissions as $permission) {
            $role->grantPermission($permission);
        }

        $deletePermissions = $myPermissions->diff($permissions);
        foreach ($deletePermissions as $permission) {
            $role->deletePermission($permission);
        }

        return back();
    }


}