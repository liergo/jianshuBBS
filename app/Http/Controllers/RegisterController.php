<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    // 注册页面
    public function index()
    {
        return view('register.index');
    }

    // 注册行为
    public function register(Request $request)
    {
        // 验证
        $this->validate($request, [
            'name' => 'required|min:2|unique:users,name',
            'email' => 'required|unique:users,email|email',
            'password' => 'required|min:5|confirmed',
        ], [
            'required' => ':attribute 为必填项',
            'email' => ':attribute 邮箱格式错误',
            'min' => ':attribute 长度不符合要求',
            'confirmed' => ':attribute 两次密码输入不一样',
            'unique' => ':attribute 以存在',
        ], [
            'name' => '姓名',
            'email' => '邮箱',
            'password' => '密码',
        ]);

        // 逻辑
        $name = $request->input('name');
        $email = $request->input('email');
        $password = bcrypt($request->input('password'));

        $user = User::create(compact('name', 'email', 'password'));

        // 渲染
        return redirect('/login');

    }
}
