<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function register (Request $request)
    {
        //return response()->json(['error']);

        $userid = $request->input('userid');
        $name = $request->input('name');
        $pws = md5($request->input('pws'));

    
        $success = user::insert([
            'User_cccount' => $userid,
            'User_password' => $pws,
            'User_name' => $name,
        ]);

        if ($success) {
            return response()->json([
                'User_cccount' => $userid,
                'User_password' => $pws,
                'User_name' => $name,
            ]);
        } else {
            return response()->json(['error']);
        }
    }

    public function login (Request $request)
    {
        $userid = $request->input('userid');
        $pws = md5($request->input('pws'));
    }
}
