<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FavoritePost extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'favorite_posts';

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
    protected $fillable = ['user_id','post_id','status'];

    
}
