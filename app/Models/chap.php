<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class chap extends Model
{   
    // use HasFactory;
    protected $table = 'chap';
    protected $primaryKey = 'Chap_ID';
    public $timestamps = false;
}
