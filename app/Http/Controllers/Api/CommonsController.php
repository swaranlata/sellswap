<?php

namespace App\Http\Controllers\Api;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use App\User;

class CommonsController extends Controller
{
       /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    
    public function authorisation($securityToken=null){
        $user=User::where('securityToken',$securityToken)->first();
        if(empty($user)){
          $finalResponse=array(
            'success'=>0,
            'result'=>null,
            'error'=>'You are not authorise to access the apis.'
           );
            echo json_encode($finalResponse);
            die;
        }else{
          return $user;  
        }       
    }
    
    public function responseData($success,$result,$error)
    {
        $finalResponse=array(
            'success'=>$success,
            'result'=>$result,
            'error'=>$error
        );
        return Response::json($finalResponse);       
    }
    
    function validateEmail($email){
        $regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/'; 
        if (preg_match($regex,$email)) {
          return true;
        } else { 
         return false;
        } 
    }
    
  
    
 
}
