<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\User;
use App\Post;
use App\Garage;
use Illuminate\Http\Request;
use Auth;
class DashboardController extends Controller
{
   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $garage=Garage::get();
        $users=User::get();
        $posts=Post::get();
        return view('admin.dashboard.index',compact('garage','users','posts'));
    }
    
    public function logout(Request $request)
    {
        Auth::logout();
        redirect('/login');
    }

    
}
