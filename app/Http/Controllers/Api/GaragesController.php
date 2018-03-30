<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Garage;
use Illuminate\Http\Request;
use Response;
use Route;
use Illuminate\Support\Facades\File;
class GaragesController extends CommonsController
{
    
    public function __construct(Request $request)
    {      
        $securityToken = $request->header('Authorization');
        $this->loginUser=$this->authorisation($securityToken);  
    }
   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function add(Request $request){
        $data=$request->all();
        if(empty($data['name'])){
            return $this->responseData(0,null,'Please enter the Garage Name.');  
        }
        if(empty($data['start_date'])){
            return $this->responseData(0,null,'Please enter the start date.');  
        }
        if(empty($data['end_date'])){
            return $this->responseData(0,null,'Please enter the end date.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['discount'])){
            return $this->responseData(0,null,'Please enter the discount.');  
        }
        if(empty($data['lat'])){
          $data['lat']="0";   
        }
        if(empty($data['long'])){
          $data['long']="0"; 
        }
        if(strtotime(str_replace('/','-',$data['start_date']))>strtotime(str_replace('/','-',$data['end_date']))){
            return $this->responseData(0,null,'Please check your selected end date.');     
        }
        $data['start_date']=date('Y-m-d',strtotime(str_replace('/','-',$data['start_date'])));
        $data['end_date']=date('Y-m-d',strtotime(str_replace('/','-',$data['end_date'])));
        $data['user_id']=$this->loginUser->id;
        $garage=Garage::create($data);
        if(!empty($garage)){
           return $this->responseData(1,'Garage has been created successfully.','No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
    
    public function delete(Request $request){
        $data=$request->all();
        if(empty($data['garage_id'])){
          return $this->responseData(0,null,'Please enter the Garage Id.');     
        }
        $garage=Garage::find($data['garage_id']);
        if(empty($garage)){
          return $this->responseData(0,null,'No Garage found.');    
        }
        Garage::destroy($data['garage_id']);
        return $this->responseData(1,'Garage deleted successfully.','No error found.');
    }
    
    public function edit(Request $request){
        $data=$request->all();
        if(empty($data['garage_id'])){
            return $this->responseData(0,null,'Please enter the Garage Id.');  
        }
        if(empty($data['name'])){
            return $this->responseData(0,null,'Please enter the Garage Name.');  
        }
        if(empty($data['start_date'])){
            return $this->responseData(0,null,'Please enter the start date.');  
        }
        if(empty($data['end_date'])){
            return $this->responseData(0,null,'Please enter the end date.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['discount'])){
            return $this->responseData(0,null,'Please enter the discount.');  
        }
        if(empty($data['lat'])){
          $data['lat']="0";   
        }
        if(empty($data['long'])){
          $data['long']="0"; 
        }
        if(strtotime(str_replace('/','-',$data['start_date']))>strtotime(str_replace('/','-',$data['end_date']))){
            return $this->responseData(0,null,'Please check your selected end date.');     
        }
        $data['start_date']=date('Y-m-d',strtotime(str_replace('/','-',$data['start_date'])));
        $data['end_date']=date('Y-m-d',strtotime(str_replace('/','-',$data['end_date'])));    
        $garage=Garage::find($data['garage_id']);
        $garage->update($data);
        if(!empty($garage)){
           return $this->responseData(1,'Garage has been updated successfully.','No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
 
}
