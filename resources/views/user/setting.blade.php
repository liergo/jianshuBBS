@extends('layouts.main')
@section('content')
    <div class="col-sm-8 blog-main">
        <form class="form-horizontal" action="{{url("/user/me/setting")}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input class="form-control" name="name" type="text" value="{{$user->name}}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">头像</label>
                <div class="col-sm-2">
                    <input class=" file-loading preview_input" type="file" value="头像" style="width:72px" name="avatar">
                    <img class="preview_img" src="{{asset($user->avatar)}}" alt="" class="img-rounded"
                         style="border-radius:500px;" width="300px" height="300px">
                </div>
            </div>
            @include('layouts.error')
            <button type="submit" class="btn btn-default">修改</button>
        </form>
        <br>
    </div>

@endsection