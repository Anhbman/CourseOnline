<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class lesson extends Model
{
    // use HasFactory;
    protected $table = 'lesson';
    protected $primaryKey = 'lesson_ID';
    public $timestamps = false;
}
