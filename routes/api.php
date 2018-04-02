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
    /*Category Apis*/
     Route::get('/categories/index','CategoriesController@index');   
     Route::get('/subcategories/index','CategoriesController@getAllSubcategories'); 
    /*Create Posts*/
     Route::post('/posts/add', 'PostsController@add');   
     Route::delete('/posts/delete', 'PostsController@delete');   
     Route::post('/posts/edit', 'PostsController@edit');   
     Route::post('/posts/uploadImage', 'PostsController@uploadImage');   
     Route::delete('/posts/deleteImage', 'PostsController@deleteImage');   
     Route::get('/posts/all', 'PostsController@all');   
     Route::get('/posts/myPosts', 'PostsController@myPosts');   
    /* Garage */
     Route::post('/garages/add','GaragesController@add');   
     Route::delete('/garages/delete','GaragesController@delete');   
     Route::post('/garages/edit','GaragesController@edit');   
     Route::get('/garages/all','GaragesController@all');   
     Route::get('/garages/myGarages','GaragesController@myGarages');   
    /* Pages */
    Route::get('/pages/privacy','PagesController@privacy'); 
    Route::get('/pages/terms','PagesController@terms'); 
});

