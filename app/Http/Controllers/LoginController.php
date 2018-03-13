<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class LoginController extends Controller
{
    // 登录页面
    public function index()
    {
        if (Auth::check()) {
            return redirect("/posts");
        }
        return view('login.index');
    }

    // 登录行为
    public function login(Request $request)
    {
        // 验证
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:5',
            'is_remember' => 'integer'
        ], [
            'required' => ':attribute 为必填项',
            'email' => ':attribute 邮箱格式错误',
            'min' => ':attribute 长度不符合要求',
        ], [
            'email' => '邮箱',
            'password' => '密码',
        ]);

        // 逻辑
        $user = $request->only('email', 'password');
        $is_remember = boolval($request->input('is_remember'));
        if (Auth::attempt($user, $is_remember)) {
            return redirect('/posts');
        }

        // 渲染
        return Redirect::back()->withErrors("邮箱密码不匹配");

    }

    //登出行为
    public function logout()
    {
        Auth::logout();
        return redirect('/login');
    }



}
