<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tag extends Model
{
    // use HasFactory;
    protected $table = 'tag';
    protected $primaryKey = 'Tag_ID';
    public $timestamps = false;
}
