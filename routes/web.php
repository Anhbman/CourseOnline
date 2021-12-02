<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;

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

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/', [AuthController::class, 'check']);
Route::get('/user', [HomeController::class, 'showUser']);
Route::get('course',[HomeController::class,'showCourse']);
// Route::post('/reg', [AuthController::class, 'register']);
Route::get('/hello',function() {
    return view('hello');
});
