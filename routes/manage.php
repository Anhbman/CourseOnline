<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TeacherController;

Route::group(['prefix' => 'teacher'], function () {
    Route::get('/tongQuan',[TeacherController::class,'tongQuan']);
    Route::get('/chartData', [TeacherController::class, 'newStudent']);
    Route::get('/topStudents', [TeacherController::class, 'topStudents']);
    Route::get('/newOrders', [TeacherController::class, 'newOrders']);
    Route::get('/listStudent', [TeacherController::class, 'listStudent']);
    Route::get('/listCoures', [TeacherController::class, 'listCoures']);
    Route::get('/listHistory', [TeacherController::class, 'listHistory']);
});
