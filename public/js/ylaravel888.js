$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

var editor = new wangEditor('content');
// 上传图片（举例）
if (editor.config) {
    editor.config.uploadImgUrl = '/posts/image/upload';

    // 设置headers (举例)
    editor.config.uploadHeaders = {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    };
    editor.create();
}


//  头像上传模块
$(".preview_input").change(function(event) {
    var file = event.currentTarget.files[0];
    var url = window.URL.createObjectURL(file);
    $(event.target).next(".preview_img").attr("src", url);

});




//  关注模块
$(".like-button").click(function(event) {
    target = $(event.target);
    var current_like = target.attr("like-value");
    var user_id = target.attr("like-user");
    var _token = target.attr("_token");
    // 已经关注了
    if (current_like == 1) {
        // 取消关注
        $.ajax({
            url: "/user/" + user_id + "/unfan",
            method: "POST",
            data: { "_token": _token },
            dataType: "json",
            success: function success(data) {
                if (data.error != 0) {
                    alert(data.msg);
                    return;
                }

                target.attr("like-value", 0);
                target.text("关注");
            }
        });
    } else {
        // 取消关注
        $.ajax({
            url: "/user/" + user_id + "/fan",
            method: "POST",
            data: { "_token": _token },
            dataType: "json",
            success: function success(data) {
                if (data.error != 0) {
                    alert(data.msg);
                    return;
                }

                target.attr("like-value", 1);
                target.text("取消关注");
            }
        });
    }
});

// 赞模块

$.(".btn-lg").click(function(event) {
    target = $(event.target);
    var url = target.attr("zan_url");
    $.$.ajax({
        url: url,
        type: 'POST',
        dataType: 'json',
        success: function success(data) {
            if (data.error != 0) {
                alert(data.msg);
                return;
            }
            target.parent().parent().remove();
        }
    })
});