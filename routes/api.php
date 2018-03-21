<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/    
Route::group(['namespace' => 'Api'],function () {
     Route::post('/users/login', 'UsersController@login');
     Route::post('/users/signup', 'UsersController@signup');
     Route::post('/users/forgot_password', 'UsersController@forgot_password');
     Route::post('/users/reset_password', 'UsersController@reset_password');   
     Route::post('/users/edit_profile', 'UsersController@edit_profile');   
     Route::post('/users/changeNotificationStatus', 'UsersController@changeNotificationStatus');   
     Route::post('/users/logout', 'UsersController@logout');   
});

