<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;


/*
|--------------------------------------------------------------------------
| Home Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::post('/', [AuthController::class, 'register']);

Route::get('/courseTop',[HomeController::class, 'showCourseTop']);
Route::get('/teacher', [HomeController::class, 'showTeacher']);
