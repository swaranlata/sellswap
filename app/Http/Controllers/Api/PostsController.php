<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\User;
use App\Post;
use App\Images;
use Illuminate\Http\Request;
use Response;
use DB;
use Route;
use Illuminate\Support\Facades\File;
class PostsController extends CommonsController
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
        if(empty($data['price'])){
            return $this->responseData(0,null,'Please enter the price.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['youtube_link'])){
            return $this->responseData(0,null,'Please enter the youtube link.');  
        }        
        if(empty($data['lat'])){
          $data['lat']="0";   
        }
        if(empty($data['long'])){
          $data['long']="0"; 
        }
        $data['user_id']=$this->loginUser->id;
        $post=Post::create($data);
        if(!empty($request->file('profileImage'))){  
             foreach($request->file('profileImage') as $v){
                $extension = $v->getClientOriginalExtension();
                $filename = $v->getFilename().'.'.$extension;
                if($v->move(public_path('/posts'),$filename)){
                    $ImagesData['moduleId']=$post->id;
                    $ImagesData['images']=$filename;
                    $ImagesData['type']="post";
                    Images::create($ImagesData);                    
                    $profilePic = $filename;
                }
             }            
        }
        if(!empty($post)){
           return $this->responseData(1,'Post has been created successfully.','No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
    
    public function delete(Request $request){
        $data=$request->all();
        $post=Post::find($data['post_id']);
        if(empty($post)){
          return $this->responseData(0,null,'No Post found.');    
        }
        Post::destroy($data['post_id']);
        $images=DB::table('images')->where('moduleId',$data['post_id'])->where('type','post')->delete();
        return $this->responseData(1,'Post deleted successfully.','No error found.');
    }
    
    public function edit(Request $request){
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
        if(empty($data['price'])){
            return $this->responseData(0,null,'Please enter the price.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['youtube_link'])){
            return $this->responseData(0,null,'Please enter the youtube link.');  
        }        
        $post=Post::find($data['post_id']);
        $post->update($data);
        if(!empty($request->file('profileImage'))){  
             foreach($request->file('profileImage') as $v){
                $extension = $v->getClientOriginalExtension();
                $filename = $v->getFilename().'.'.$extension;
                if($v->move(public_path('/posts'),$filename)){
                    $ImagesData['moduleId']=$post->id;
                    $ImagesData['images']=$filename;
                    $ImagesData['type']="post";
                    Images::create($ImagesData);                    
                    $profilePic = $filename;
                }
             }            
        }
        if(!empty($post)){
           return $this->responseData(1,'Post has been updated successfully.','No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
 
}
