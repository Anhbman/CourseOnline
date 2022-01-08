<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class course extends Model
{
    // use HasFactory;
    // protected $fillable = ['Course_ID','Author_ID','Course_header','Course_description','Course_price','Course_image',
    //         'Course_rate'];
    protected $table = 'course';
    protected $primaryKey = 'Course_ID';
    // public $timestamps = false;
    const CREATED_AT = 'Course_created';
    const UPDATED_AT = 'Course_updated';

    public function courseEnrollment () {
        return $this->hasMany('App\Models\courseEnrollment','Course_ID','Course_ID');
    }
}
