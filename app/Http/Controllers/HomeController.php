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
        $courseTop = course::all();
        return response()->json([
            $courseTop,
            ]);
    }

    public function showCourseTime()
    {

    }

    public function showTeacher()
    {
        $teacher = user::all()->where('User_role',1);

        return response()->json([
            '$teacher' => $teacher,
        ]);
    }
}
