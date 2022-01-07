<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;

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

Route::post('/addCategory', [CategoryController::class, 'addCategory']);
Route::post('/addTag', [CategoryController::class, 'addTag']);
Route::get('/getListCategories',[CategoryController::class, 'getListCategories']);