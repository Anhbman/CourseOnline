<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class user extends Model
{
    // use HasFactory;
    protected $fillable = ['User_account','User_password','User_name','User_DoB','User_phone',
            'User_createdAt','User_updatedAt','User_image','User_role'];
    protected $table = 'user';
    protected $primaryKey = 'User_ID';
    public $timestamps = false;
    // protected $dateFormat = 'd-m-Y';


}
