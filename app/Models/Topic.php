<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $fillable = ['name'];

    // 属于这个专题的所有文章
    public function posts()
    {
        return $this->belongsToMany(\App\Models\Post::class, 'post_topics', 'topic_id', 'post_id');
    }

//    专题的文章数，用于withcount
    public function postTopics()
    {
        return $this->hasMany(\App\Models\PostTopic::class, 'topic_id');

    }
}
