<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Support\Jsonable;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\User;
use App\Models\CourseEnrollment;
use App\Models\PaymentHistory;
use App\Models\Comment;
use App\Models\Chap;
use App\Models\CourseTag;

class CourseController extends Controller
{
    //
    public function addCourseTag(Request $request)
    {
        $newCourseTag = new CourseTag;
        $newCourseTag->Course_ID = $request->input('Course_ID');
        $newCourseTag->Tag_ID = $request->input('Tag_ID');
        $newCourseTag->save();
        // echo $newCourse;
        return response()->json(['status'=>'Add Course Successfully'],201);
    }

    public function addCourse(Request $request)
    {
        $newCourse = new Course;
        $newCourse->Author_ID = $request->input('Author_ID');
        $newCourse->Course_header = $request->input('Course_header');
        $newCourse->Course_description = $request->input('Course_description');
        $newCourse->Course_price = $request->input('Course_price');
        $newCourse->Course_image = $request->input('Course_image');
        $newCourse->Course_category = $request->input('Course_category');
        // $newCourse->course_rate = 0;
        $newCourse->save();
        echo $newCourse;
        return response()->json(['status'=>'Add Course Successfully','courseID' => $newCourse->Course_ID],201);
    }

    public function addLesson(Request $request)
    {
        $newLesson = new Lesson;
        $newLesson->Chap_ID = $request->input('Chap_ID');
        $newLesson->Lesson_header = $request->input('Lesson_header');
        $newLesson->Lesson_description = $request->input('Lesson_description');
        // $newLesson->Lesson_uploadedAt = now();
        $newLesson->Lesson_video = $request->input('Lesson_video');
        $newLesson->Lesson_isFree = $request->input('Lesson_isFree');
        $newLesson->Lesson_view = 0;
        $newLesson->save();
        return response()->json(['status'=>'Add Lesson Successfully'],201);
    }

    public function addChap(Request $request)
    {
        $newChap = new Chap;
        $newChap->Course_ID = $request->input('Course_ID');
        $newChap->Chap_ID = $request->input('Chap_description');
        $newChap->save();
        return response()->json(['status'=>'Add Chap Successfully','chapID' => $newChap->Chap_ID],201);
    }



    public function getPendingCourses()
    {
        $lists = array();
        $pendingCourses = Course::where('Course_approve','=','0')->get();
//        foreach($pendingCourses as $course){
//            $name = User::where('User_ID','=',$course->Author_ID)->pluck('User_name');
//            $course->{'teacherName'} = $name[0];
//        }
        return response()->json($pendingCourses,200);
    }

    public function getApprovedCourses()
    {
        $lists = array();
        $approvedCourses = Course::where('Course_approve','=','1')->get();
        foreach($approvedCourses as $course){
            $author = User::where('User_ID','=',$course->Author_ID);
            $list =  array('course' =>$course , 'teacherName' => (($author->get())[0]->User_name));
            array_push($lists,$list);
        }
        return response()->json($lists,200);
    }

    public function approveCourse(Request $request)
    {
        $approveCourse = $request->input('Course_ID');
        Course::where('Course_ID','=', $approveCourse)->update(['Course_approve' => '1']);

        return response()->json(['message' => 'Succesfully'],200);
    }

    public function buyCourse(Request $request)
    {
        $course_ID = $request->input('Course_ID');
        // echo $course_ID;
        $user_ID = $request->input('User_ID');
        $newPayment = new PaymentHistory;
        $course_price = course::where('Course_ID','=',$course_ID)->get(['Course_price']);
        $newPayment->Payment_price = $course_price[0]->Course_price;
        $newPayment->save();

        $newEnrollment = new CourseEnrollment;
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
        $listsBoughtCourse = CourseEnrollment::where('User_ID','=',$user_ID)->get(['Course_ID']);
        foreach($listsBoughtCourse as $course)
        {
            array_push($lists,self::getShortInforCourse($course->Course_ID));
        }
        return response()->json($lists,200);
    }

    protected function getShortInforCourse($courseID)
    {
        $course = Course::where('Course_ID','=',$courseID)->get(['Course_ID','Course_image','Course_header','Course_price','Course_rate','Author_ID']);
        $authorName = User::where('User_ID','=',$course[0]->Author_ID)->pluck('User_name');
        $course[0]->{'teacherName'} = $authorName[0];
        return $course[0];
    }

    protected function getFullInforCourse($courseID)
    {
        $lists = array();
        $course = Course::where('Course_ID','=',$courseID)->get();
        $authorName = User::where('User_ID','=',$course[0]->Author_ID)->pluck('User_name');
        $course[0]->{'teacherName'} = $authorName[0];
        array_push($lists,$course[0]);
        $totalStudent = CourseEnrollment::where('Course_ID' , '=',$courseID)->count();
        $lists[0]->{'totalStudent'} = $totalStudent;
        $courseTags = CourseTag::where('Course_ID','=',$courseID)->pluck('Tag_ID');
        // array_insert($lists,$lists[0]->Course_category,$courseTags);
        // $lists[0]->Course_category->{'Tag'} = $courseTags;
        // $lists[1]->{'tag'} = $courseTag;
        array_push($lists,$courseTags);
        $listChaps = Chap::where('Course_ID','=',$courseID)->get(['Chap_ID','Chap_description']);
        $listLessons = array();
        foreach($listChaps as $chap)
        {
            // echo $chap;
            // echo $chap->Chap_ID;
            $lesson = Lesson::where('Chap_ID','=',$chap->Chap_ID)->get(['Lesson_header','Lesson_description','Lesson_video','Lesson_view']);
            $list = array('chap' =>$chap,'lesson' => $lesson);

            array_push($listLessons,$list);
        }
        array_push($lists,$listLessons);
        return $lists;
    }




    public function getCourseDetail(Request $request)
    {
        // echo $request;

        $course = self::getFullInforCourse($request->route('courseID'));
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
        $newRate = Comment::where('Comment_in','=',$comment->Comment_in)->avg('User_rate');

        $course_rate = Course::where('Course_ID','=',$comment->Comment_in)->update(['Course_rate'=>$newRate]);

        return response()->json(['message' => 'Succesfully'],201);
    }

    public function showComment(Request $request)
    {
        $listsComment = array();
        $Course_ID = $request->input('Course_ID');
        $Comments_in_course = Comment::where('Comment_in','=',$Course_ID)->get();
        foreach($Comments_in_course as $comment)
        {
            $user = User::where('User_ID','=',$comment->Comment_by)->get(['User_name']);
            $list =  array('comment' =>$comment , 'name' => ($user[0]->User_name));
            array_push($listsComment,$list);
        }
        return response()->json($listsComment,201);
    }

    public function getListCoursesByCategory(Request $request)
    {
        $listCourses = Course::where('Course_category','=',$request->route('categoryID'))->paginate(3);
        $total =  $listCourses->lastPage();
        $current = $listCourses->currentPage();
        $currentList = $listCourses->items();
        foreach($currentList as $course)
        {
            $name = User::where('User_ID','=',$course->Author_ID)->pluck('User_name');
            $course->{'name'} = $name[0];
        }
        return response()->json(['current' => $current ,'total' => $total ,'listCourse' => $currentList],200);
    }

    public function getListCoursesByTag(Request $request)
    {
        $currentList = array();
        $lists = CourseTag::where('Tag_ID','=',$request->route('tagID'))->pluck('Course_ID');
        // echo count($lists);
        foreach($lists as $course_id)
        {
            $listCourses = Course::where('Course_ID','=',$course_id)->paginate(1);
            $total =  $listCourses->lastPage();
            $current = $listCourses->currentPage();
            $currentList = $listCourses->items();
            foreach($currentList as $course)
            {
                $name = User::where('User_ID','=',$course->Author_ID)->pluck('User_name');
                $course->{'name'} = $name[0];
            }
        }
        return response()->json(['current' => $current ,'total' => $total ,'listCourse' => $currentList],200);
    }

    public function getListUploadedCourses(Request $request)
    {

        $authorID = $request->route('authorID');
        // echo 'tac gia' . $authorID;
        $listCourses = Course::where('Author_ID','=',$authorID)->get(['Course_ID','Course_header','Course_rate','Course_image']);
        ;
        foreach($listCourses as $course)
        {
            // echo 'id la '. $course->Course
            $total = CourseEnrollment::where('Course_ID', '=',$course->Course_ID)->count();
            $course->{'totalStudents'} = $total;
        }
        return response()->json(['listCourses' => $listCourses],200);
    }

    public function updateCourse(Request $request, $courseID)
    {
        // $courseID = $request->route('courseID');
        $course = Course::where('Course_ID','=',$courseID)->update([
            'Course_header' =>$request->input('Course_header'),
            'Course_description' => $request->input('Course_description'),
            'Course_price' => $request->input('Course_price'),
            'Course_image' => $request->input('Course_image')
        ]);
        return response()->json(['message' => 'Update Course Succesfully'],200);
    }

    public function updateChap(Request $request, $chapID)
    {
        // $courseID = $request->route('courseID');
        $course = Chap::where('Chap_ID','=',$chapID)->update([
            'Chap_description' => $request->input('Chap_description')
        ]);
        return response()->json(['message' => 'Update Chap Succesfully'],200);
    }

    public function updateLesson(Request $request, $lessonID)
    {
        // $courseID = $request->route('courseID');
        $course = Lesson::where('Chap_ID','=',$lessonID)->update([
            'Lesson_header' => $request->input('Lesson_header'),
            'Lesson_description' => $request->input('Lesson_description'),
            'Lesson_video' => $request->input('Lesson_video'),
            'Lesson_isFree' => $request->input('Lesson_isFree')
        ]);
        return response()->json(['message' => 'Update Lesson Succesfully'],200);
    }

    public function topCourse() {

        $value = Course::all();

        for ($i = 0; $i < count($value); ++$i) {
            $value[$i]->count = CourseEnrollment::where('Course_ID', $value[$i]->Course_ID)->count();
            $tmp = User::select('User_name')
                ->where('User_ID', $value[$i]->Author_ID)
                ->first();
            $value[$i]->teacher = $tmp->User_name;
        }

        $value = json_decode(json_encode($value), true);;
        usort($value, function ($a, $b) {
            if ($a['count'] == $b['count']) {
                return -1;
            }
            return  ($a['count'] > $b['count']) ? -1 : 1;
        });

        return response()->json($value,200);
    }

    public function newCourse () {
        $value = Course::orderBy('Course_createdAt', 'DESC')->get();

        for ($i = 0; $i < count($value); ++$i) {
            $value[$i]->count = CourseEnrollment::where('Course_ID', $value[$i]->Course_ID)->count();
            $tmp = User::select('User_name')
                ->where('User_ID', $value[$i]->Author_ID)
                ->first();
            $value[$i]->teacher = $tmp->User_name;
        }

        return response()->json($value,200);
    }

}
