<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\User;
use App\Page;
use Illuminate\Http\Request;
use Response;
use Route;
use Illuminate\Support\Facades\File;
class PagesController extends CommonsController
{
    
    public function __construct(Request $request)
    {      
        
    }
   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function privacy(){
        $pages= Page::where('slug','privacy-policy')->select('title','description')->first();
        if(!empty($pages)){
           return $this->responseData(1,$pages,'No Error Found.');  
        }else{
           return $this->responseData(0,null,'No data found.');   
        }     
   } 
    public function terms(){
        $pages= Page::where('slug','terms-and-conditions')->select('title','description')->first();
        if(!empty($pages)){
           return $this->responseData(1,$pages,'No Error Found.');  
        }else{
           return $this->responseData(0,null,'No data found.');   
        }     
   }
    
 
 
}
