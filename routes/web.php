<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();
Route::get('/', function () {
    return view('welcome');
});
Route::group(['prefix' => 'admin','middleware'=>'auth'],function () {
     Route::resource('/', 'Admin\DashboardController');
     Route::resource('posts', 'Admin\PostsController');
     Route::resource('categories', 'Admin\CategoriesController');
     Route::resource('sub-categories', 'Admin\SubCategoriesController');
     Route::get('/home', 'HomeController@index')->name('home');
});





