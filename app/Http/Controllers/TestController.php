<?php

namespace App\Http\Controllers;

use App\Models\AdminPermission;
use App\Models\AdminRole;
use App\Models\AdminUser;
use App\Models\Notice;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TestController extends Controller
{
    //

    public function index()
    {
        $user = User::find(2)->doFun(1);
        dd($user);
    }

    public function test()
    {
//        $comments = Post::find(2)->comments;
//        foreach ($comments as $comment) {
//            var_dump($comment->content);
//        }
        echo "test is running" . "<br>";

//        $permissions = AdminRole::find(2)->permissions;
//        foreach ($permissions as $permission) {
//            var_dump($permission->name);
//        }

//        $permission = AdminPermission::find(2);
//        dump($permission->name);
//
//        $roles = AdminUser::find(2)->roles;
//
//        foreach ($roles as $role) {
//            dump($role->name);
//        }
//
//        $hasPermission = AdminUser::find(2)->hasPermission($permission);
//        dd($hasPermission);

//        $roles = AdminPermission::find(2)->roles;
//        foreach ($roles as $role) {
//            dump($role->name);
//        }

//        $permissionsNum = AdminRole::find(1)->permissions->count();
//
//        dd($permissionsNum);
//
//        echo $permissionsNum;

//
//        $role = AdminRole::find(1);
//        $role = AdminRole::find(2);

//        $role = AdminRole::Where('id',1)->get();
//        echo "1111";
//        dd($role);
//        dd($role);

//        $role = AdminRole::find(1)->intersect(['system']);

//        $collection = collect(['Desk', 'Sofa', 'Chair']);
//
//        dd($collection);

//        $roles = AdminRole::all();


//        $role = AdminRole::all()->intersect($roles)->toArray();
//        $role = AdminRole::find(2)->intersect($roles)->toArray();
//        $role = AdminRole::find(2);
//        $role = AdminRole::where('description','文章管理员')->get()->intersect($roles)->toArray();

//


//        $user = AdminUser::where('id', 2)->get()->isInRoles($role);
//
//        dd($user);


//        $name = "李成";
//        $age = "21";
//        $email = "1150400220@qq.com";
//
//        $arr = compact('name', 'age', 'email');
//
//        dd($arr['name']);

//        $notice = Notice::find(1);
//
//        $user = User::find(1);
//
//        $res = $user->addNotice($notice);
//
//        dd($res);

        $me = Auth::user()->doUnFan(2);
        dd($me);

        $user = User::find(2)->doFan(1);
        dd($user);


    }
}
