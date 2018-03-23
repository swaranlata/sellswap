<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Response;
use Hash;
use Auth;
use Route;
class UsersController extends CommonsController
{
    
    public function __construct(Request $request)
    {      
        $actionName=explode('@',Route::currentRouteAction());
        if($actionName[1]=='reset_password' || $actionName[1]=='edit_profile' || $actionName[1]=='logout' || $actionName[1]=='changeNotificationStatus'){
           $securityToken = $request->header('Authorization');
           $this->loginUser=$this->authorisation($securityToken);     
        }
    }
   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        die("Api's are in process...");
    }
    
    public function login(Request $request)
    {
       $data=$request->all();  
       if(empty($data['email'])){           
          return $this->responseData(0,null,'Please enter the email.');           
       }else{
           $validateEmail=$this->validateEmail($data['email']);
           if(empty($validateEmail)){
              return $this->responseData(0,null,'Please enter the valid email.');    
           }          
       } 
       if(empty($data['password'])){           
          return $this->responseData(0,null,'Please enter the password.');           
       }
       $userAuth=Auth::attempt(array('email'=>$data['email'],'password'=>$data['password']));
       if(!empty($userAuth)){
           $user=User::where('email',$data['email'])->select('id','name','email','deviceType','deviceToken','notificationStatus','profileImage','securityToken','location','lat','long')->first();
           $newData['deviceType']=$data['deviceType'];
           $newData['deviceToken']=$data['deviceToken'];
           $user->update($newData);
           $user['userId']=(string) $user->id;
           unset($user->id);
           if(!empty($user)){
              return $this->responseData(1,$user,'No Data Found.');  
           }   
       }else{
         return $this->responseData(0,null,'Invalid email and Password combination.');   
       }       
    }
    
    public function signup(Request $request)
    {   
       $data=$request->all();
       $data['role']="0";
       $data['securityToken']=Hash::make($data['email']);
       $data['profileImage']="";
       if(empty($data['name'])){           
          return $this->responseData(0,null,'Please enter the name.');           
       }
       if(empty($data['email'])){
          return $this->responseData(0,null,'Please enter the email.');  
       }else{
           $validateEmail=$this->validateEmail($data['email']);
           if(empty($validateEmail)){
              return $this->responseData(0,null,'Please enter the valid email.');    
           }          
       } 
       if(!empty($data['facebookId'])){         
           $emailExists=User::Where('email',$data['email'])->select('id','name','email','profileImage','deviceType','deviceToken','notificationStatus','securityToken','location','lat','long')->first();   
           if(!empty($emailExists)){//update the facebook id and return details               
              $data['notificationStatus']=$emailExists->notificationStatus;
              if(!empty($data['profileImage'])){
                   $data['profileImage'] = $data['profileImage'];
              }
              unset($data['password']);
              $emailExists->update($data);
              $emailExists['userId']=(string) $emailExists->id;             
              unset($emailExists->id);              
              return $this->responseData(1,$emailExists,'No Error Found.'); 
           }else{
               $facebookIdExists=User::Where('facebookId',$data['facebookId'])->select('id','name','email','profileImage','deviceType','deviceToken','notificationStatus','securityToken','location','lat','long')->first(); 
               if(!empty($facebookIdExists)){
                  $facebookIdExists->userId=(string)$facebookIdExists->id; 
                  unset($facebookIdExists->id);              
                  unset($facebookIdExists->facebookId);              
                  unset($facebookIdExists->role);              
                  unset($facebookIdExists->password);              
                  return $this->responseData(1,$facebookIdExists,'No Error Found.');   
               }else{
                   if(empty($data['deviceType'])){
                      $data['deviceType']="0"; 
                   }
                   if(empty($data['deviceToken'])){
                      $data['deviceToken']="0"; 
                   }
                   $data['role']="0";
                   $data['location']="0";
                   $data['lat']="0";
                   $data['long']="0";
                   $data['password']=Hash::make($data['password']);
                   $lastinsertId=User::create($data);
                   $data['userId']=(string) $lastinsertId['id'];
                   unset($data['role']);
                   unset($data['facebookId']);
                   unset($data['password']);
                   return $this->responseData(1,$data,'No Error Found.');    
               }               
           }            
       }else{
           if(empty($data['password'])){
             return $this->responseData(0,null,'Please enter the password.');  
           }
           $emailExists=User::Where('email',$data['email'])->first();   
           if(!empty($emailExists)){
             return $this->responseData(0,null,'Email already exists.'); 
           }
           if(!empty($request->file('profileImage'))){
                $file = $request->file('profileImage');
                $extension = $file->getClientOriginalExtension();
                $filename = $file->getFilename().'.'.$extension;
                if($file->move(public_path('/users'),$filename)){
                    $profilePic = $filename;
                }
                $data['profileImage']=$profilePic;
            }else{ 
                $profilePic  = '';
            }
           $password=$data['password'];
            $data['password']=Hash::make($password);
            $data['notificationStatus']="0";
            $data['facebookId']="0";
            $data['role']="0";
            $data['location']="0";
            $data['lat']="0";
            $data['long']="0";
           if(empty($data['deviceType'])){
              $data['deviceType']="0"; 
           }
           if(empty($data['deviceToken'])){
              $data['deviceToken']="0"; 
           }
           $lastinsertId=User::create($data);
           $data['userId']=(string) $lastinsertId['id'];
           unset($data['role']);
           unset($data['facebookId']);
           unset($data['password']);
           return $this->responseData(1,$data,'No Error Found.');
       }

        
    }
    
    public function forgot_password(Request $request){
        $data=$request->all();  
        if(empty($data['email'])){
           return $this->responseData(0,null,'Please enter the email.');    
        }else{
           $validateEmail=$this->validateEmail($data['email']);
           if(empty($validateEmail)){
              return $this->responseData(0,null,'Please enter the valid email.');    
           }  
        }
        $user=User::where('email',$data['email'])->first();
        if(!empty($user)){
            if(!empty($user)){
              return $this->responseData(0,null,'You are logged in from Social Media.We are unable to process your request.');  
            }
            $plainPassword=str_random(8);
            $password=Hash::make($plainPassword);
            $user=$this->loginUser;
            $user->update(array('password'=>$password));  
            return $this->responseData(1,'New password has been sent to your email.','No Error Found.'); 
        }else{
            return $this->responseData(0,null,'Please check your email.This email is not registered with the system.');   
        }    
    }
    
    public function reset_password(Request $request){
        $data=$request->all();
        if(empty($data['old'])){
          return $this->responseData(0,null,'Please enter the old password.');    
        }
        if(empty($data['new'])){
          return $this->responseData(0,null,'Please enter the new password.');    
        }
        if(empty($data['confirm'])){
          return $this->responseData(0,null,'Please enter the confirm password.');    
        }
        if($data['new']!=$data['confirm']){
          return $this->responseData(0,null,'Confirm password does not match.');     
        }
        $HashPassword = Hash::check($data['old'],$this->loginUser->password);
        if(empty($HashPassword)){
          return $this->responseData(0,null,'Old password is not correct.');    
        }
        $password=Hash::make($data['new']);
        $user=$this->loginUser;
        $user->update(array('password'=>$password));
        return $this->responseData(1,'Password has been changed.','No Error Found.');   
    }
    
    public function edit_profile(Request $request){
        $data=$request->all();
        if(empty($data['name'])){
        return $this->responseData(0,null,'Please enter the name.');     
        } 
        if(empty($data['location'])){
        return $this->responseData(0,null,'Please enter the location.');     
        }
        if(empty($data['location'])){
        return $this->responseData(0,null,'Please enter the location.');     
        }
        if(empty($data['lat'])){
        return $this->responseData(0,null,'Please enter the latitude.');     
        }
        if(empty($data['long'])){
        return $this->responseData(0,null,'Please enter the longtitude.');     
        }         
        $user=$this->loginUser;
        if(!empty($request->file('profileImage'))){
            $file = $request->file('profileImage');
            $extension = $file->getClientOriginalExtension();
            $filename = $file->getFilename().'.'.$extension;
            if($file->move(public_path('/users'),$filename)){
                $profilePic = $filename;
            }
            $data['profileImage']='/users/'.$profilePic;            
        }
        $user->update($data);
        return $this->responseData(1,'Profile has been updated.','No Error Found.');  
    }
    
    public function logout(Request $request){
        $user=$this->loginUser;
        $data=array(
        'deviceType'=>'',
        'deviceToken'=>''
        );
        $user->update($data);
        return $this->responseData(1,'User has been logged out successfully.','No Error Found.'); 
    }
    
    public function changeNotificationStatus(Request $request){
        $user=$this->loginUser;
        $status=$this->loginUser->notificationStatus;
        if($status=='0'){
          $finalData['notificationStatus']=1; 
        }else{
          $finalData['notificationStatus']=0;  
        }
        $user->update($finalData);
        return $this->responseData(1,'Notification Status has been changed successfully.','No Error Found.'); 
    }
    
 
}
