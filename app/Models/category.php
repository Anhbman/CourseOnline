<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    // use HasFactory;
    protected $fillable = ['Category_ID','Category_name'];
    protected $table = 'category';
    protected $primaryKey = 'Category_ID';
    public $timestamps = false;
}   
