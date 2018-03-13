<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class LoginController extends Controller
{

    // 登录展示页面
    public function index()
    {
        return view('admin.login.index');
    }

    // 登录操作
    public function login(Request $request)
    {

        // 验证
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

        // 逻辑
        $user = $request->only('name', 'password');
        if (Auth::guard("admin")->attempt($user)) {
            return redirect('/admin/home');
        }

        // 渲染
        return Redirect::back()->withErrors("用户名密码不匹配");

    }

    public function logout()
    {
        Auth::guard("admin")->logout();
        return redirect('/admin/login');

    }

}
