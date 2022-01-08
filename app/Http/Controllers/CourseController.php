<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Support\Jsonable;
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

    public function getBoughtCourses(Request $request)
    {
        $user_ID = $request->input('User_ID');
        $lists = array();
        $listsBoughtCourse = courseEnrollment::where('User_ID','=',$user_ID)->get(['Course_ID']);
        foreach($listsBoughtCourse as $course)
        {   
            array_push($lists,self::getShortInforCourse($course->Course_ID));
        }
        return response()->json($lists,200);
    }

    protected function getShortInforCourse($courseID)
    {
        $course = course::where('Course_ID','=',$courseID)->get(['Course_ID','Course_image','Course_header','Course_price','Course_rate','Author_ID']);
        $authorName = user::where('User_ID','=',$course[0]->Author_ID)->pluck('User_name');
        $course[0]->{'name'} = $authorName[0];
        return $course[0];
    }

    protected function getFullInforCourse($courseID)
    {   
        $list = array();
        $course = course::where('Course_ID','=',$courseID)->get();
        $list->{'Course'} = $course[0];
        $authorName = user::where('User_ID','=',$course[0]->Author_ID)->pluck('User_name');
        $list->{'Name'} = $authorName[0];
        $listChaps = chap::where('Course_ID','=',$courseID);
        foreach($listChaps as $chap)
        {   
            $list->{'chap'} = $chap;
            $lesson = lesson::where('Chap_ID','=',$chap->Chap_ID)->pluck;
            
        }
        $course[0]->{'name'} = $authorName[0];

        // $authorName = user::where('User_ID','=',$course[0]->Author_ID)->pluck('User_name');
        // $course[0]->{'name'} = $authorName[0];
    }



    public function getCourseDetail(Request $request)
    {
        // echo $request;
        $course = course::where('Course_ID','=',$course_ID)->get();
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

    public function getListCoursesByCategory(Request $request)
    {
        $listCourses = course::where('Course_category','=',$request->route('categoryID'))->paginate(3);
        $total =  $listCourses->lastPage();
        $current = $listCourses->currentPage();
        // $currentList =  json_encode($listCourses->items());
        $currentList = $listCourses->items();
        foreach($currentList as $course)
        {   
            // echo $course;
            $name = user::where('User_ID','=',$course->Author_ID)->pluck('User_name');
            // $course['name'] = $name;
            $course->{'name'} = $name[0];
            // echo $name;
        }
        return response()->json(['current' => $current ,'total' => $total ,'listCourse' => $currentList],200);
    }
}
