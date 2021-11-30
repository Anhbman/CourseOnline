<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class course extends Model
{
    // use HasFactory;
    protected $table = 'course';
    protected $primaryKey = 'Course_ID';
    public $timestamps = false;
}
