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

        $userid = $request->input('userid');
        $name = $request->input('name');
        $pws = Hash::make(($request->input('pws')));

        $success = user::insert([
            'User_account' => $userid,
            'User_password' => $pws,
            'User_name' => $name,
        ]);

        if ($success) {
            return response()->json([
                'User_account' => $userid,
                'User_password' => $pws,
                'User_name' => $name,
            ]);
        } else {
            return response()->json(['error'],400);
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
