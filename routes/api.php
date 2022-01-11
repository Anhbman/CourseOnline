<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\CategoryController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getPendingCourses',[CourseController::class,'getPendingCourses']);
Route::post('/approveCourse',[CourseController::class,'approveCourse']);


//Router teacher manage
Route::group(['prefix' => 'teacher'], function() {
    Route::get('/general',[TeacherController::class,'tongQuan']);
    Route::get('/statistic/newStudent',[TeacherController::class,'newStudent']);
    Route::get('/statistic/topStudents',[TeacherController::class,'topStudents']);
    Route::get('/statistic/newOrders',[TeacherController::class,'newOrders']);
    Route::get('/statistic/listStudent',[TeacherController::class,'listStudent']);
    Route::get('/statistic/listCoures',[TeacherController::class,'listCoures']);
    Route::get('/statistic/listHistory',[TeacherController::class,'listHistory']);


    Route::get('/getListUploadedCourses/{authorID}',[CourseController::class,'getListUploadedCourses']);

    Route::post('/manage/addCourse',[CourseController::class,'addCourse']);
    Route::post('/manage/addChap',[CourseController::class,'addChap']);
    Route::post('/manage/addLesson',[CourseController::class,'addLesson']);

    Route::put('/manage/updateCourse/{courseID}',[CourseController::class,'updateCourse']);
    Route::put('/manage/updateChap/{chapID}',[CourseController::class,'updateChap']);
    Route::put('/manage/updateLesson/{lessonID}',[CourseController::class,'updateLesson']);
});

Route::get('/getListCategories',[CategoryController::class,'getListCategories']);
Route::get('/getCourseDetail/{courseID}',[CourseController::class,'getCourseDetail']);