<?php

namespace App\Admin\Controllers;

use App\Models\AdminPermission;
use Illuminate\Http\Request;

class PermissionController extends Controller
{

    // 首页
    public function index()
    {
        $permissions=AdminPermission::paginate(10);
        return view('admin.permission.index',compact('permissions'));
    }

    public function create()
    {
        return view('admin.permission.add');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2',
            'description' => 'required',
        ]);

        AdminPermission::create($request->only(['name', 'description']));

        return redirect('/admin/permissions');
    }
}