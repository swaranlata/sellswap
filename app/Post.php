<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'posts';

    /**
    * The database primary key value.
    *
    * @var string
    */
    protected $primaryKey = 'id';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id','title', 'description', 'category', 'subcategory', 'price', 'location', 'lat', 'long', 'youtube_link'];
    
    public function mycategory(){
       return $this->belongsTo('App\Category','category');
    }
    
    public function mysubcategory(){
       return $this->belongsTo('App\SubCategory','subcategory');
    }

    
}
