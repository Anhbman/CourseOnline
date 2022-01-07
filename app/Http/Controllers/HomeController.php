<?php

namespace App\Http\Controllers;
use App\Models\user;
use App\Models\course;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function show() 
    {
        $user = user::all();
        return response()->json([
            'users' => $user,
        ]);
    }

    public function getListCourses()
    {
        $listCourses = [];

    }
}
