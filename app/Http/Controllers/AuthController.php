<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function username()
    {
        return 'User_account';
    }
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
        $pws = Hash::make(($request->input('pws')));

        $success = user::insert([
            'User_account' => $userid,
            'User_password' => $pws,
            'User_name' => $name,
        ]);

        if (!$success) {
            return response()->json(['error'],400);
        }   else{
            // $user = new user;
            // $user->
            $now = now();
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

    public function login(Request $request)
    {
        $userid = $request->input('userid');
        $pws = $request->input('pws');

        if (Auth::attempt(['User_account' => $userid, 'password' => $pws])) {
            return response()->json([
                'User_account' => $userid,
                'User_password' => $pws,
            ]);
        } else {
            return response()->json(['error']);
        }
    }

    public function check()
    {
        $user = Auth::user();
        return response()->json([$user]);
    }


}
