<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'chats';

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
    protected $fillable = ['conversation_id', 'from_user_id','to_user_id','post_id','messages','status'];

    
}
