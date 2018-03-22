<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Category;
use Illuminate\Http\Request;
use Response;
use Route;
class CategoriesController extends CommonsController
{
    
    public function __construct(Request $request)
    {      
        $actionName=explode('@',Route::currentRouteAction());
        if($actionName[1]=='index'){
           $securityToken = $request->header('Authorization');
           $this->loginUser=$this->authorisation($securityToken);   
        }
    }
   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
       $allCategory=Category::get(); 
       $categories=array();
       if(!empty($allCategory)){
           foreach($allCategory as $k=>$v){
              $categories[$k]['id']=(string) $v['id'];
              $categories[$k]['name']=$v['title'];
              $categories[$k]['image']=base64_encode(public_path().'/category/'.$v['image']);
           }
           return $this->responseData(1,$categories,'No Error Found.'); 
       }else{
          return $this->responseData(0,array(),'No Category Found.'); 
       }
    }
    
    
    
 
}
