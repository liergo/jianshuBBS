<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use App\Models\Zan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{

//          文章主页
    public function index()
    {
        $posts = Post::orderBy('created_at', 'desc')->withCount(['comments', 'zans'])->paginate(6);
        return view('post/index', compact('posts'));
    }

//          文章详情
    public function show(Post $post)
    {
        $post->load('comments');
        return view('post/show', compact('post'));
    }

//          创建文章
    public function create()
    {
        return view('post/create');
    }

//         保存文章
    public function store(Request $request)
    {

        // 验证
        $this->validate($request, [
            'title' => 'required|string|min:5|max:100',
            'content' => 'required|string|min:10'
        ], [
            'title.required' => ':attribute 为必填项',
            'content.required' => ':attribute 为必填项',
            'string' => ':attribute 必须为字符串',
            'min' => ':attribute 长度不符合要求',
            'max' => ':attribute 长度不符合要求',

        ], [
            'title' => '标题',
            'content' => '内容',
        ]);

        // 逻辑
        $user_id = Auth::id();
        $params = array_merge($request->only('title', 'content'), compact('user_id'));
        $post = Post::create($params);

        // 渲染
        return redirect("/posts");
    }

//        编辑文章
    public function edit(Post $post)
    {
        return view('post/edit', compact('post'));
    }

//        编辑逻辑
    public function update(Request $request, Post $post)
    {

        // 验证
        $this->validate($request, [
            'title' => 'required|string|min:5|max:100',
            'content' => 'required|string|min:10'
        ], [
            'title.required' => ':attribute 为必填项',
            'content.required' => ':attribute 为必填项',
            'string' => ':attribute 必须为字符串',
            'min' => ':attribute 长度不符合要求',
            'max' => ':attribute 长度不符合要求',
        ], [
            'title' => '标题',
            'content' => '内容',
        ]);

        $this->authorize('update', $post);

        // 逻辑
        $post->title = $request->input('title');
        $post->content = $request->input('content');
        $post->save();

        // 渲染
        return redirect("/posts/{$post->id}");
    }


//       删除文章
    public function delete(Post $post)
    {
        $this->authorize('delete', $post);
        $post->delete();
        return redirect("/posts");
    }


//        上传图片
    public function imageUpload(Request $request)
    {
        $path = $request->file('wangEditorH5File')->storePublicly(md5(time()));
        return asset('storage/' . $path);
    }

    public function comment(Request $request, Post $post)
    {
        // 验证
        $this->validate($request, [
            'content' => 'required',
        ], [
            'required' => ':attribute 为必填项',
        ], [
            'content' => '评论',
        ]);

        // 逻辑
        $comment = new Comment();
        $comment->user_id = Auth::id();
        $comment->content = $request->input('content');
        $post->comments()->save($comment);

        // 渲染

        return back();
    }

//    赞
    public function zan(Post $post)
    {
        $param = [
            'user_id' => Auth::id(),
            'post_id' => $post->id,
        ];

//      firstOrCreate方法的作用是 数据库中如果有符合param的就查找出来 如果没有就创建数  这样就不会重复创建数据
        Zan::firstOrCreate($param);
        return back();

    }

//    取消赞
    public function unzan(Post $post)
    {
        $post->zan(Auth::id())->delete();
        return back();

    }

}
