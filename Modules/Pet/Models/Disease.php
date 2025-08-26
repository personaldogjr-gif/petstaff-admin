<?php

namespace Modules\Pet\Models;

use Illuminate\Database\Eloquent\Model;

class Disease extends Model
{
    protected $table = 'user_pet_diseases';

    protected $fillable = [
        'nome',
        'data_diagnostico',
        'data_cura',
        'veterinario',
        'clinica',
        'sintomas',
        'tratamento',
        'observacoes',
        'pet_id'
    ];

    public function pet()
    {
        return $this->belongsTo(Pet::class, 'pet_id');
    }
}
