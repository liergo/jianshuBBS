<?php

namespace App\Admin\Controllers;

use App\Models\Topic;
use Illuminate\Http\Request;

class TopicController extends Controller
{
    public function index()
    {
        $topics = Topic::all();
        return view('admin.topics.index', compact('topics'));
    }


    public function create()
    {
        return view('admin.topics.create');
    }


    public function store(Request $request)
    {

        $this->validate($request, [
            'name' => 'required|string'
        ]);

        Topic::create(['name' => $request->input('name')]);

        return redirect('/admin/topics');
    }


    public function destroy(Topic $topic)
    {
        $topic->delete();

        return [
            'error' => 0,
            'msg' => ''
        ];

    }
}