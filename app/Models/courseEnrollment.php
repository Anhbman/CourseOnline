<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class courseEnrollment extends Model
{
    // use HasFactory;
    protected $table = 'courseenrollment';
    // protected $primaryKey = 'Course_ID';
    public $timestamps = false;
}
