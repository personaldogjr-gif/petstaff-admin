<?php

namespace Modules\Pet\Models;

use Illuminate\Database\Eloquent\Model;

class Medication extends Model
{
    protected $table = 'user_pet_medications';

    protected $fillable = [
        'name',
        'date',
        'recurring',
        'dosage',
        'notes',
        'pet_id'
    ];

    public function pet()
    {
        return $this->belongsTo(Pet::class, 'pet_id');
    }
}
