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
        if(empty($data['price'])){
            return $this->responseData(0,null,'Please enter the price.');  
        }
        if(empty($data['location'])){
            return $this->responseData(0,null,'Please enter the location.');  
        }
        if(empty($data['youtube_link'])){
           // return $this->responseData(0,null,'Please enter the youtube link.');  
        }        
        if(empty($data['lat'])){
          $data['lat']="0";   
        }
        if(empty($data['long'])){
          $data['long']="0"; 
        }
        if(!empty($data['is_featured'])){
           $data['is_featured']="1"; 
           $data['featured_date']=date('Y-m-d'); 
        }
        $data['user_id']=$this->loginUser->id;
        $post=Post::create($data);      
        if(!empty($post)){
           return $this->responseData(1,(string) $post->id,'No Error Found.');  
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
           // return $this->responseData(0,null,'Please enter the youtube link.');  
        }        
        $post=Post::find($data['post_id']);
        if(!empty($data['is_featured'])){
           $data['is_featured']="1"; 
           $data['featured_date']=date('Y-m-d'); 
        }
        $post->update($data);
        if(!empty($post)){
           return $this->responseData(1,'Post has been updated successfully.','No Error Found.');  
        }else{
           return $this->responseData(0,null,'Something wrong! Please try again.');   
        }     
   }
    
    public function uploadImage(Request $request){
        $data=$request->all();
        if(empty($data['profileImage'])){
            return $this->responseData(0,null,'Please enter the image.');  
        }
        if(empty($data['post_id'])){
            return $this->responseData(0,null,'Please enter the Post Id.');  
        }
        if(!empty($request->file('profileImage'))){  
                $file=$request->file('profileImage');
                $extension = $file->getClientOriginalExtension();
                $filename =  $file->getFilename().'.'.$extension;
                if($file->move(public_path('/posts'),$filename)){
                    $ImagesData['moduleId']=$data['post_id'];
                    $ImagesData['images']='/posts/'.$filename;
                    $ImagesData['type']="post";
                    Images::create($ImagesData); 
                }        
        }
        return $this->responseData(1,'Post Image uploaded successfully.','No Error Found.'); 
    }
    
    public function deleteImage(Request $request){
        $data=$request->all();
        if(empty($data['image_id'])){
           return $this->responseData(0,null,'Please enter the Image.');  
        }
        Images::destroy($data['image_id']);
        return $this->responseData(1,'Post Images deleted successfully','No Error Found.');        
    }
    
    public function all(){
        $post=Post::orderBy('id','DESC')->get(); 
        $allPost=array();
        if(!empty($allPost)){
            foreach($allPost as $k=>$v){
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
            }
            return $this->responseData(1,$allGarage,'No error found.');
        }else{
          return $this->responseData(0,array(),'No data found.');  
        }      
    } 
    
    public function myPosts(){
        $post=Post::where('user_id',$this->loginUser->id)->orderBy('id','DESC')->get(); 
        $allPost=array();
        if(!empty($allPost)){
            foreach($allPost as $k=>$v){
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
            }
            return $this->responseData(1,$allGarage,'No error found.');
        }else{
          return $this->responseData(0,array(),'No data found.');  
        }      
    }
 
}
