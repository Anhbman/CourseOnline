<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register (Request $request)
    {
        //return response()->json(['error']);

        $account = $request->input('account');
        $password = md5($request->input('password'));
        $DoB = $request->input('DoB');
        $phone = $request->input('phone');
        $role = $request->input('role');
        $image = $request->input('image'); 
        $name = $request->input('name');
        $now = now();
        $isExisted = user::where([
            ['User_account','=',$account]
        ])->exists();

        if($isExisted){
            return response()->json(['status'=>false,'description'=>'loi 1']); 
        }
        else{
            // $user = new user;
            // $user->
            $isSuccess = user::create(array(
                'User_account' => $account,
                'User_password' => $password,
                'User_createdAt' => $now->format('Y-m-d H:i:s'),
                'User_updatedAt' => $now->format('Y-m-d H:i:s'),
                'User_DoB' => $DoB,
                'User_phone' => $phone,
                'User_role' => $role,
                'User_name' => $name
            ));
            if($isSuccess){
                return response()->json(['status'=>true],201); 
            }
            else{
                return response()->json(['status'=>false,'description'=>'Error 2'],400);
            }
        }  
    }

    public function login (Request $request)
    {
        $Username = $request->input('Username');
        $pws = md5($request->input('Password'));
        $isExisted = user::where([
            ['User_account','=',$Username],
            ['User_password','=',$pws]
        ])->exists();
        echo $isExisted ;
        return response()->json(['status'=>$isExisted]);
    }

    public function insertCategory(Request $request)
    {
        $CategoryName = $request->input('CategoryName');
    }


}
