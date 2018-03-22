<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Post;
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
        return view('admin.dashboard.index');
    }
    
    public function logout(Request $request)
    {
        Auth::logout();
        redirect('/login');
    }

    
}
