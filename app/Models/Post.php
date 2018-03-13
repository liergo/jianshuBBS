<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{

    protected $fillable = ['title', 'content', 'user_id'];  //  fillable是指可以使用create方法批量新增的字段

    protected $guarded;                          //  fillable是指不可以使用create方法批量新增的字段

//  关联用户
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }

//    foreignKey 外键
//    localKey   主键


//  关联评论
    public function comments()
    {
        return $this->hasMany('App\Models\Comment', 'post_id', 'id')->orderBy('created_at', 'desc');
    }

//  把赞和用户关联
    public function zan($user_id)
    {
        return $this->hasOne('App\Models\Zan')->where('user_id', $user_id);
    }

//  文章的所有赞
    public function zans()
    {
        return $this->hasMany('App\Models\Zan');
    }

    public function postTopics()
    {
        return $this->hasMany(\App\Models\PostTopic::class, 'post_id', 'id');
    }

//    属于某个作者的文章
    public function scopeAuthorBy($query, $user_id)
    {
        return $query->where('user_id', $user_id);
    }

//    不属于某个专题的文章
    public function scopeTopicNotBy($query, $topic_id)
    {
        return $query->doesntHave('postTopics', 'and', function ($q) use ($topic_id) {
            $q->where('topic_id', $topic_id);
        });
    }

    //    全局scope的方式
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope("available", function (Builder $builder) {
            $builder->whereIn('status', [0, 1]);
        });

    }

}


