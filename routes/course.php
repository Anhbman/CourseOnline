<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CourseController;

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

Route::group(['prefix' => 'manage/teacher'], function () {
    Route::post('/addCourse', [CourseController::class, 'addCourse']);
    Route::post('/addLesson', [CourseController::class, 'addLesson']);
    Route::post('/addChap', [CourseController::class, 'addChap']);
    Route::post('/addCourseTag', [CourseController::class, 'addCourseTag']);
    Route::post('/getListUploadedCourses', [CourseController::class, 'getListUploadedCourses']);
});

Route::group(['prefix' => 'manage/admin'], function () {
    Route::post('/approveCourse', [CourseController::class, 'approveCourse']);
    Route::get('/getPendingCourses', [CourseController::class, 'getPendingCourses']);
    // Route::get('/getApprovedCourses', [CourseController::class, 'getApprovedCourses']);
});


// Route::post('/buyCourse', [CourseController::class],'buyCourse');
Route::get('/getApprovedCourses', [CourseController::class, 'getApprovedCourses']);
Route::get('/getListCoursesByCategory/{categoryID}',[CourseController::class, 'getListCoursesByCategory']);
Route::get('/getListCoursesByTag/{tagID}',[CourseController::class, 'getListCoursesByTag']);
Route::get('/getCourseDetail/{courseID}',[CourseController::class, 'getCourseDetail']);
Route::group(['prefix' => 'user'], function () {
    Route::post('/buyCourse',[CourseController::class, 'buyCourse']);
    Route::post('/getBoughtCourses',[CourseController::class, 'getBoughtCourses']);
    Route::get('/getInforCourse',[CourseController::class, 'getInforCourse']);
    Route::post('/updateCourseRate',[CourseController::class, 'updateCourseRate']);
    Route::post('/showComment',[CourseController::class, 'showComment']);
});

