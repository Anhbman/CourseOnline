<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TeacherController;

Route::group(['prefix' => 'teacher'], function () {
    Route::get('/tongquan',[TeacherController::class,'tongQuan']);
});
