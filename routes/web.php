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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/index', 'TimedayController@index')->name('index');
Route::resource('home', 'HomeController');

//timeday Routes
Route::group(['middleware'=> 'web'],function(){
  Route::resource('timeday','\App\Http\Controllers\TimedayController');
  Route::post('timeday/{id}/update','\App\Http\Controllers\TimedayController@update');
  Route::get('timeday/{id}/delete','\App\Http\Controllers\TimedayController@destroy');
  Route::get('timeday/{id}/deleteMsg','\App\Http\Controllers\TimedayController@DeleteMsg');
});


