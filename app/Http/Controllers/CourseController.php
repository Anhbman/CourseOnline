<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\course;
use App\Models\lesson;
use App\Models\user;
use App\Models\courseEnrollment;
use App\Models\paymenthistory;
use App\Models\comment;
use App\Models\chap;
use App\Models\coursetag;


class CourseController extends Controller
{   
    public function addCourseTag(Request $request)
    {
        $newCourseTag = new coursetag;
        $newCourseTag->Course_ID = $request->input('Course_ID');
        $newCourseTag->Tag_ID = $request->input('Tag_ID');
        $newCourseTag->save();
        // echo $newCourse; 
        return response()->json(['status'=>'Add Course Successfully'],201);
    }

    public function addCourse(Request $request)
    {
        $newCourse = new course;
        $newCourse->Author_ID = $request->input('Author_ID');
        $newCourse->Course_header = $request->input('Course_header');
        $newCourse->Course_description = $request->input('Course_description');
        $newCourse->Course_price = $request->input('Course_price');
        $newCourse->Course_image = $request->input('Course_image');
        $newCourse->Course_category = $request->input('Course_category');
        // $newCourse->course_rate = 0;
        $newCourse->save();
        echo $newCourse;
        return response()->json(['status'=>'Add Course Successfully'],201);
    }

    public function addLesson(Request $request)
    {
        $newLesson = new lesson;
        $newLesson->Course_ID = $request->input('Course_ID');
        $newLesson->Lesson_header = $request->input('Lesson_header');
        $newLesson->Lesson_description = $request->input('Lesson_description');
        $newLesson->Lesson_uploadedAt = now();
        $newLesson->Lesson_video = $request->input('Lesson_video');
        $newLesson->Lesson_view = 0;
        $newLesson->save();
        return response()->json(['status'=>'Add Lesson Successfully'],201);
    }

    public function addChap(Request $request)
    {
        $newChap = new Chap;
        $newChap->Chap_header = $request->input('Chap_header');
        $newChap->Course_ID = $request->input('Course_ID'); 
        $newChap->save();
        return response()->json(['status'=>'Add Chap Successfully'],201);
    }

    public function getPendingCourses()
    {
        $lists = array();
        $pendingCourses = course::where('Course_approve','=','0')->get();
        // echo $pendingCourses;
        foreach($pendingCourses as $course){
            $lessons = lesson::where('Course_ID','=',$course->Course_ID)->get();
            // echo $lessons;
            $list =  array('course' =>$course , 'lesson' => $lessons);
            // $lists.push($list);
            array_push($lists,$list);
        }

        return response()->json($lists,200);
    }

    public function getApprovedCourses()
    {
        $lists = array();
        $approvedCourses = course::where('Course_approve','=','1')->get();
        // echo $approvedCourses;
        foreach($approvedCourses as $course){
            $author = user::where('User_ID','=',$course->Author_ID);
            // echo ($author->get())[0];
            $list =  array('course' =>$course , 'author' => (($author->get())[0]->User_name));
            // $lists.push($list);
            array_push($lists,$list);
        }
        return response()->json($lists,200);
    }

    public function approveCourse(Request $request)
    {
        $approveCourse = $request->input('Course_ID');
        course::where('Course_ID','=', $approveCourse)->update(['Course_approve' => '1']);

        return response()->json(['message' => 'Succesfully'],200);
    }

    public function buyCourse(Request $request)
    {
        $course_ID = $request->input('Course_ID');
        // echo $course_ID;
        $user_ID = $request->input('User_ID');
        $newPayment = new paymenthistory;
        $course_price = course::where('Course_ID','=',$course_ID)->get(['Course_price']);
        // echo $course_price[0]->Course_price;
        $newPayment->Payment_price = $course_price[0]->Course_price;
        $newPayment->save();

        $newEnrollment = new courseEnrollment;
        $newEnrollment->User_ID = $user_ID;
        $newEnrollment->Course_ID = $course_ID;
        $newEnrollment->Payment_ID = $newPayment->Payment_ID;
        $newEnrollment->Payment_date = now();
        $newEnrollment->save();
        return response()->json(['message' => 'Succesfully'],201);
    }
    protected function getCourse($course_ID)
    {
        // echo $course_ID;
        $course = course::where('Course_ID','=',$course_ID)->get();
        return $course;
    }

    public function getBoughtCourses(Request $request)
    {
        $user_ID = $request->input('User_ID');
        $lists = array();
        $listsBoughtCourse = courseEnrollment::where('User_ID','=',$user_ID)->get(['Course_ID']);
        foreach($listsBoughtCourse as $course)
        {
            array_push($lists,self::getCourse($course->Course_ID));
        }
        return response()->json($lists,200);
    }

    public function getInforCourse(Request $request)
    {
        // echo $request;
        $course = self::getCourse($request->input('Course_ID'));
        return response()->json($course,200);
    }

    public function updateCourseRate(Request $request)
    {
        $comment = new Comment;
        $comment->Comment_content = $request->input('Comment_content');
        $comment->Comment_by = $request->input('User_ID');
        $comment->Comment_in = $request->input('Course_ID');
        $comment->User_rate = $request->input('User_rate');
        $comment->Comment_at = now();
        $comment->save();
        $newRate = comment::where('Comment_in','=',$comment->Comment_in)->avg('User_rate');

        $course_rate = course::where('Course_ID','=',$comment->Comment_in)->update(['Course_rate'=>$newRate]);

        return response()->json(['message' => 'Succesfully'],201);
    }

    public function showComment(Request $request)
    {
        $listsComment = array();
        $Course_ID = $request->input('Course_ID');
        $Comments_in_course = comment::where('Comment_in','=',$Course_ID)->get();
        foreach($Comments_in_course as $comment)
        {
            $user = user::where('User_ID','=',$comment->Comment_by)->get(['User_name']);
            // echo $user . "\n";
            $list =  array('comment' =>$comment , 'name' => ($user[0]->User_name));
            array_push($listsComment,$list);
        }
        return response()->json($listsComment,201);
    }
}
