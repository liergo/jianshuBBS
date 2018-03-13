<?php

namespace App\Admin\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{

    // 首页
    public function index()
    {
        $posts = Post::withoutGlobalScope('available')
            ->where('status', 0)
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        return view('admin.posts.index', compact('posts'));
    }


    public function status(Request $request, Post $post)
    {
        $this->validate($request, [
            'status' => 'required|in:-1,1',
        ]);

        $post->status = $request->input('status');
        $post->save();
        return [
            'error' => 0,
            'msg' => ''
        ];
    }
}