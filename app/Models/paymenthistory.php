<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class paymenthistory extends Model
{
    // use HasFactory;
    protected $table = 'paymenthistory';
    protected $primaryKey = 'Payment_ID';
    public $timestamps = false;
}
