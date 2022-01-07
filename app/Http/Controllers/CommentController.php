<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\course;
use App\Models\comment;
use App\Models\user;

class CommentController extends Controller
{
    //
    public function showComment(Request $request)
    {
        $Course_ID = $request->input('Course_ID');
        $Comment_in_course = comment::where('Course_ID','=',$Course_ID)->get();
        return response()->json([$Comment_in_course],201);
    }
}
