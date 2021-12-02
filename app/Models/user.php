<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;


class User extends Authenticatable
{
    // use HasFactory;
    protected $table = 'user';
    protected $primaryKey = 'User_ID';
    public $timestamps = false;
    // protected $fillable = [
    //     'User_ID', 'User_cccount', 'User_password','User_name',
    // ];
    
    public function getAuthPassword()
    {
        return $this->User_password;
    }

    public function username()
    {
        return 'User_cccount';
    }
}
