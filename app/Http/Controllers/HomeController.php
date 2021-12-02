<?php

namespace App\Http\Controllers;
use App\Models\user;
use App\Models\course;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function showUser() 
    {
        $user = user::all();
        return response()->json([
            'users' => $user,
        ]);
    }

    public function showCourseTop()
    {

    }

    public function showCourseTime()
    {

    }

    public function showTeacher()
    {
        
    }
    public function showCourse() {
        $course = course::all();
        return response()->json([
            'courses' => $course,
        ]);
    }
}
