<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable=['title','summary','slug','description','photo','quote','post_cat_id','status'];


    public function cat_info(){
        return $this->hasOne('App\Models\PostCategory','id','post_cat_id');
    }

    public static function getAllPost(){
        return Post::with(['cat_info'])->orderBy('id','DESC')->paginate(10);
    }
 
    public static function getPostBySlug($slug){
        return Post::where('slug',$slug)->where('status','active')->first();
    }

    public function comments(){
        return $this->hasMany(PostComment::class)->whereNull('parent_id')->where('status','active')->with('user_info')->orderBy('id','DESC');
    }
    public function allComments(){
        return $this->hasMany(PostComment::class)->where('status','active');
    }


    public static function countActivePost(){
        $data=Post::where('status','active')->count();
        if($data){
            return $data;
        }
        return 0;
    }
}
