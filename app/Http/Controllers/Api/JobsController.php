<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\User;
use App\Job;
use Illuminate\Http\Request;
use Response;
use DB;
use Route;
use Illuminate\Support\Facades\File;
class JobsController extends CommonsController
{
    
    public function __construct(Request $request){      
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
        if(empty($data['title'])){
            return $this->responseData(0,null,'Please enter the title.');  
        }
        if(empty($data['description'])){
            return $this->responseData(0,null,'Please enter the description.');  
        }
        if(empty($data['category'])){
            return $this->responseData(0,null,'Please enter the category.');  
        }
        if(empty($data['subcategory'])){
            return $this->responseData(0,null,'Please enter the subcategory.');  
        }
        if(empty($data['company_name'])){
            return $this->responseData(0,null,'Please enter the company name.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['job_type'])){
            return $this->responseData(0,null,'Please enter the job_type.');  
        }
        if(empty($data['compensation'])){
            return $this->responseData(0,null,'Please enter the compensation.');  
        }
        if(empty($data['applied_link'])){
            return $this->responseData(0,null,'Please enter the applied link.');  
        }               
        if(empty($data['lat'])){
          $data['lat']="";   
        }
        if(empty($data['long'])){
          $data['long']=""; 
        }        
        $data['user_id']=$this->loginUser->id;
        $job=Job::create($data);      
        if(!empty($job)){
           return $this->responseData(1,(string) $job->id,'No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
    
    public function delete(Request $request){
        $data=$request->all();
        if(empty($data['job_id'])){
          return $this->responseData(0,null,'Please enter the job id.');    
        }
        $job=Job::find($data['job_id']);
        if(empty($job)){
          return $this->responseData(0,null,'No Job found.');    
        }
        Job::destroy($data['job_id']);
        return $this->responseData(1,'Job deleted successfully.','No error found.');
    }
    
    public function edit(Request $request){
        $data=$request->all();
        $data=$request->all();
        if(empty($data['job_id'])){
            return $this->responseData(0,null,'Please enter the job id.');  
        }
        if(empty($data['title'])){
            return $this->responseData(0,null,'Please enter the title.');  
        }
        if(empty($data['description'])){
            return $this->responseData(0,null,'Please enter the description.');  
        }
        if(empty($data['category'])){
            return $this->responseData(0,null,'Please enter the category.');  
        }
        if(empty($data['subcategory'])){
            return $this->responseData(0,null,'Please enter the subcategory.');  
        }
        if(empty($data['company_name'])){
            return $this->responseData(0,null,'Please enter the company name.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['job_type'])){
            return $this->responseData(0,null,'Please enter the job_type.');  
        }
        if(empty($data['compensation'])){
            return $this->responseData(0,null,'Please enter the compensation.');  
        }
        if(empty($data['applied_link'])){
            return $this->responseData(0,null,'Please enter the applied link.');  
        }               
        if(empty($data['lat'])){
          $data['lat']="";   
        }
        if(empty($data['long'])){
          $data['long']=""; 
        }        
        $data['user_id']=$this->loginUser->id;      
        $job=Job::find($data['job_id']);        
        $job->update($data);
        if(!empty($job)){
           return $this->responseData(1,'Job has been updated successfully.','No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
    
    public function all(){
        $job=Job::with('user')->orderBy('id','DESC')->get(); 
        $allJobs=array();
        if(!empty($job)){
            foreach($job as $k=>$v){
              $allJobs[$k]['jobId']=(string)$v->id;  
              $allJobs[$k]['userId']=(string)$v->user_id;  
              $allJobs[$k]['title']=(string)$v->title;  
              $allJobs[$k]['description']=(string) $v->description;  
              $allJobs[$k]['location']=(string) $v->location;  
              $allJobs[$k]['latitude']=(string) $v->lat;  
              $allJobs[$k]['longitude']=(string) $v->long;  
              $allJobs[$k]['category']=(string) $v->category;  
              $allJobs[$k]['subcategory']=(string) $v->subcategory;  
              $allJobs[$k]['company_name']=(string) $v->company_name;  
              $allJobs[$k]['job_type']=(string) $v->job_type;  
              $allJobs[$k]['applied_link']=(string) $v->applied_link;  
              $allJobs[$k]['reviewsCount']="0";               
              $allJobs[$k]['rating']="0";  
              if(!empty($v->user->profileImage)){
                 $profileImage=url('/').'/public'.$v->user->profileImage;    
              }else{
                 $profileImage="";   
              }
              $allJobs[$k]['profileImage']=(string) $profileImage;               
              $allJobs[$k]['username']=$v->user->name;               
              $allJobs[$k]['postedTime']=date('h:i A',strtotime($v->created_at));               
            }
            if(!empty($allJobs)){
              return $this->responseData(1,$allJobs,'No error found.');
            }else{
              return $this->responseData(0,array(),'No data found.');  
            }            
        }else{
          return $this->responseData(0,array(),'No data found.');  
        }      
    } 
    
    public function myPosts(){
        $post=Post::with('user')->where('user_id',$this->loginUser->id)->orderBy('id','DESC')->get(); 
        $allPost=array();
        if(!empty($post)){
            foreach($post as $k=>$v){
              $allPost[$k]['postId']=(string)$v->id;  
              $allPost[$k]['userId']=(string)$v->user_id;  
              $allPost[$k]['title']=(string)$v->title;  
              $allPost[$k]['description']=(string) $v->description;  
              $allPost[$k]['price']=(string) $v->price;  
              $allPost[$k]['location']=(string) $v->location;  
              $allPost[$k]['latitude']=(string) $v->lat;  
              $allPost[$k]['longitude']=(string) $v->long;  
              $allPost[$k]['is_featured']=(string) $v->is_featured;  
              $allPost[$k]['featured_date']=(string) $v->is_featured;  
              $allPost[$k]['youtube_link']=(string) $v->youtube_link;               
              $allPost[$k]['images']=array();               
              $allPost[$k]['is_favorite']="0";               
              $allPost[$k]['reviewsCount']="0";               
              $allPost[$k]['rating']="0";  
              if(!empty($v->user->profileImage)){
                 $profileImage=url('/').'/public'.$v->user->profileImage;    
              }else{
                 $profileImage="";   
              }
              $allPost[$k]['profileImage']=(string) $profileImage;               
              $allPost[$k]['username']=$v->user->name;               
              $allPost[$k]['postedTime']=date('h:i A',strtotime($v->created_at));               
            }
            if(!empty($allPost)){
              return $this->responseData(1,$allPost,'No error found.');
            }else{
              return $this->responseData(0,array(),'No data found.');  
            }            
        }else{
          return $this->responseData(0,array(),'No data found.');  
        }      
    }    
   
 
}
