<?php

namespace App\Admin\Controllers;

use App\Jobs\SendMessage;
use App\Models\Notice;
use Illuminate\Http\Request;

class NoticeController extends Controller
{
    public function index()
    {
        $notices = Notice::all();
        return view('admin.notices.index', compact('notices'));
    }

    public function create()
    {
        return view('admin.notices.create');
    }

    public function store(Request $request)
    {

        $this->validate($request, [
            'title' => 'required|string',
            'content' => 'required|string'
        ]);

        $notice = Notice::create($request->only(['title', 'content']));


        dispatch(new SendMessage($notice));
        
        return redirect('/admin/notices');
    }

}