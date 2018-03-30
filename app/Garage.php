<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Garage extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'garages';

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
    protected $fillable = ['user_id', 'name', 'start_date', 'end_date', 'discount','location','lat','long'];
    
    public function users(){
        return $this->belongsTo('App\User','user_id');
    }

    
}
