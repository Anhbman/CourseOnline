<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\teacherInformation;


class AuthController extends Controller
{
    public function username()
    {
        return 'User_account';
    }
    public function register (Request $request)
    {
        $account = $request->input('account');
        $password = Hash::make(($request->input('password')));
        $DoB = $request->input('DoB');
        $phone = $request->input('phone');
        $role = $request->input('role');
        $name = $request->input('name');

        $isExisted = user::where('User_account',$account)->first();

        if ($isExisted) {
            return response()->json(['error'=>'Email is existed'],409);
        }
        else{
            $newUser = new user;
            $newUser->User_account = $account;
            $newUser->User_password = $password;
            $newUser->User_name = $name;
            $newUser->User_DoB = $DoB;
            $newUser->User_phone = $phone;
            $newUser->User_role = $role;
            $newUser->save();
            // $isSuccess = user::create(array(
            //     'User_account' => $account,
            //     'User_password' => $password,
            //     'User_name' => $name,
            //     'User_DoB' => $DoB,
            //     'User_phone' => $phone,
            //     'User_role' => $role
            // ));
            if($role == 1)
            {
                $newTeacherInfor = new teacherInformation;
                $newTeacherInfor->Teacher_ID = $newUser->User_ID;
                $newTeacherInfor->save();
            }
            return response()->json(['status'=>'Register successfully'],201); 
        }
    }

    public function login(Request $request)
    {
        $account = $request->input('account');
        $password = $request->input('password');

        if (Auth::attempt(['User_account' => $account, 'password' => $password])) {
            $user = Auth::user();
            // echo $user;
            return response()->json([
                'User_role' => $user->User_role
            ],200);
        } else {
            return response()->json(['error'],400);
        }
    }

    public function check()
    {
        $user = Auth::user();
        return response()->json([$user]);
    }


}
