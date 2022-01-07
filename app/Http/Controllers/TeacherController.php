<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\course;

class TeacherController extends Controller
{
    //
    public function tongQuan() {
        $courseTotal = User::find(6)->teacherCourse->count();
        $studentTotal = course::where('Author_ID', 6)
            ->with('courseenrollment')->get();

        echo $studentTotal;
    }
}
