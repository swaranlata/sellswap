<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\CommonsController;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use Route;
use App\Chat;
use App\Conversation;
class ChatController extends CommonsController
{
    public function __construct(Request $request)
    {      
        $securityToken = $request->header('Authorization');
        $this->loginUser=$this->authorisation($securityToken);   
    }
   
    public function sendMessage(Request $request){
        $data=$request->all(); 
        if(empty($data['to_user_id'])){
           return $this->responseData(0,null,'Please enter the receiver id.');      
        }
        if(empty($data['from_user_id'])){
           return $this->responseData(0,null,'Please enter the sender id.');   
        }
        if(empty($data['messages'])){
          return $this->responseData(0,null,'Please enter the message.');     
        }
        if(empty($data['post_id'])){
          return $this->responseData(0,null,'Please enter the post id.');  
        }
        $conversation=Conversation::where('to_user_id',$data['to_user_id'])
        ->where('from_user_id',$data['from_user_id'])
        ->orWhere('to_user_id',$data['from_user_id'])        
        ->where('from_user_id',$data['to_user_id'])
        ->where('post_id',$data['post_id'])
        ->first();
        if(!empty($conversation)){
            $conId=$conversation->id;  
        }else{
            $finalArray=array(
            'to_user_id'=>$data['to_user_id'],
            'from_user_id'=>$data['from_user_id'],
            'post_id'=>$data['post_id']                
            );
            $conversation=Conversation::create($finalArray);
            $conId=$conversation->id;   
        }
        $data['conversation_id']=(string)$conId;
        $data['status']='0';
        $chat=Chat::create($data);
        if(!empty($chat)){
          $data['chat_id']=(string)$chat->id;
          return $this->responseData(1,$data,'No Error Found.');     
        }else{
          return $this->responseData(0,null,'Something went wrong.Please try again.');    
        }
     }
    
    public function markAsRead(Request $request){
        $data=$request->all(); 
        if(empty($data['chat_id'])){
           return $this->responseData(0,null,'Please enter the chat id.');      
        }
        $data['status']="1";
        $chat=Chat::find($data['chat_id']);
        $chat->update($data);
        return $this->responseData(1,'Message marked as read successfully.','No Error Found');  
    }
    
    public function deleteChat(Request $request){
        $data=$request->all(); 
        if(empty($data['chat_id'])){
           return $this->responseData(0,null,'Please enter the chat id.');      
        }
        $chat=Chat::find($data['chat_id']);
        if(!empty($chat)){
           $chat=Chat::find($data['chat_id'])->delete();
           return $this->responseData(1,'Message deleted successfully.','No Error Found');   
        }else{
           return $this->responseData(0,null,'No Chat Found');  
        }
        
    }
    
    public function clearAllChat(Request $request){
        $data=$request->all(); 
        if(empty($data['conversation_id'])){
           return $this->responseData(0,null,'Please enter the conversation id.');      
        }
        $chat=Chat::where('conversation_id',$data['conversation_id'])->get();
        if(!empty($chat)){
           $chat=Chat::where('conversation_id',$data['conversation_id'])->delete();
           return $this->responseData(1,'All Chat cleared successfully.','No Error Found');   
        }else{
           return $this->responseData(0,null,'No Chat Found');  
        }
        
    }
    
    
    
 
}
