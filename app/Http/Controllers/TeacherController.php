<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\course;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    //
    public function tongQuan() {
        $courseTotal = User::find(6)->teacherCourse->count();
        $studentTotal = DB::select('SELECT COUNT(ce.User_ID) as total
                    FROM courseenrollment ce, course c
                    WHERE c.Author_ID = 20
                    AND ce.Course_ID = c.Course_ID
                    GROUP BY c.Author_ID');

        $revune = DB::select(
            'SELECT SUM(p.Payment_price) as total
                    FROM courseenrollment ce, course c, paymenthistory p
                    WHERE c.Author_ID = 6
                    AND ce.Course_ID = c.Course_ID
                    AND ce.Payment_ID = p.Payment_ID
                    GROUP BY c.Author_ID'
                            );
        $payTotal = DB::select(
                'SELECT COUNT(ce.Payment_ID) as total
                FROM courseenrollment ce, course c
                WHERE c.Author_ID = 6
                AND ce.Course_ID = c.Course_ID
                GROUP BY c.Author_ID
                '
        );

        return response()->json(
            ['courseTotal' => $courseTotal,
             'studentTotal' =>   $studentTotal[0]->total,
             'revune' => $revune[0]->total,
             'payTotal' => $payTotal[0]->total
                ],
            200);
    }

    public function newStudent () {
        $newStudent = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        $revune = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);;

        $value = DB::select('SELECT EXTRACT(MONTH FROM Payment_date) month, COUNT(User_ID) as total
                    FROM courseenrollment ce, course c
                    WHERE c.Author_ID = 6
                    AND ce.Course_ID = c.Course_ID
                    GROUP BY c.Author_ID, EXTRACT(MONTH FROM Payment_date)');

        $value2 = DB::select('
            SELECT EXTRACT(MONTH FROM Payment_date) month, SUM(p.Payment_price) as total
            FROM courseenrollment ce, course c, paymenthistory p
            WHERE c.Author_ID = 6
            AND ce.Course_ID = c.Course_ID
            AND ce.Payment_ID = p.Payment_ID
            GROUP BY c.Author_ID, EXTRACT(MONTH FROM Payment_date)
        ');

        foreach ($value as $item) {
            $newStudent[$item->month] = $item->total;
        }

        foreach ($value2 as $item) {
            $revune[$item->month] = $item->total;
        }

        return response()->json([
          'newstudent' =>  $newStudent,
            'revune' => $revune
        ],200);
    }

    public function topStudents () {
        $value = DB::select('SELECT ce.User_ID , u.User_name username,  COUNT(p.Payment_ID) order, SUM(p.Payment_price) price
                FROM courseenrollment ce, course c, paymenthistory p, user u
                WHERE c.Author_ID = 6
                AND ce.Course_ID = c.Course_ID
                AND ce.Payment_ID = p.Payment_ID
                AND ce.User_ID = u.User_ID
                GROUP BY User_ID
                ORDER BY COUNT(p.Payment_ID) DESC');

        return response()->json([
            $value[0]
        ],200);

    }

    public function newOrders () {
        $value = DB::select('SELECT ce.User_ID as id, u.User_name as user, Payment_date as date, (p.Payment_price) price
            FROM courseenrollment ce, course c, paymenthistory p, user u
            WHERE c.Author_ID = 6
            AND ce.Course_ID = c.Course_ID
            AND ce.Payment_ID = p.Payment_ID
            AND ce.User_ID = u.User_ID
            GROUP BY c.Author_ID
            ORDER BY Payment_date ASC');

        return response()->json([
            $value[0]
        ],200);
    }

    public function listStudent () {
        $value = DB::select('SELECT ce.User_ID id, u.User_name name, u.User_phonenumber phone, COUNT(ce.Course_ID) total_order, SUM(p.Payment_price) as total_order
                FROM courseenrollment ce, course c, user u, paymenthistory p
                WHERE c.Author_ID = 6
                AND ce.Course_ID = c.Course_ID
                AND ce.User_ID = u.User_ID
                AND ce.Payment_ID = p.Payment_ID
                GROUP BY c.Author_ID, u.User_ID');

        return response()->json([
            $value[0]
        ],200);
    }
}
