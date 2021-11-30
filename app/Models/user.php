<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class user extends Model
{
    // use HasFactory;
    protected $table = 'user';
    protected $primaryKey = 'User_ID';
    public $timestamps = false;
}
