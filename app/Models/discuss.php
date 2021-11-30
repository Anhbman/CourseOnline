<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class discuss extends Model
{
    // use HasFactory;
    protected $table = 'discuss';
    protected $primaryKey = 'Discuss_ID';
    public $timestamps = false;
}
