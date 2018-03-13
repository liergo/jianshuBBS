<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\PostTopic;
use App\Models\Topic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TopicController extends Controller
{
    //
    public function show(Topic $topic)
    {
        // 传递带文章数的专题
        $topic = Topic::withCount('postTopics')->find($topic->id);

        // 专题文章列表，按照创建时间排序，前10个
        $posts = $topic->posts()->orderBy('created_at', 'desc')->take(10)->get();

        // 属于我的文章但是未投稿
        $myPosts = Post::authorBy(Auth::id())->topicNotBy($topic->id)->get();

        return view('topic/show', compact('topic', 'posts', 'myPosts'));
    }

    public function submit(Request $request, Topic $topic)
    {
        $this->validate($request, [
            'post_ids' => 'required|array',
        ]);

        $post_ids = $request->input('post_ids');
        $topic_id = $topic->id;

        foreach ($post_ids as $post_id) {
            PostTopic::firstOrCreate(compact('topic_id', 'post_id'));
        }
        return back();

    }
}
