<?php

namespace Modules\Pet\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Observation extends Model
{
    protected $table = 'user_pet_observations';
    
    protected $fillable = [
        'titulo',
        'descricao',
        'data_observacao',
        'categoria',
        'veterinario',
        'clinica',
        'foto',
        'pet_id'
    ];
    
    public function pet()
    {
        return $this->belongsTo(Pet::class, 'pet_id');
    }
    
    public function deleteFoto()
    {
        if (!empty($this->foto) && Storage::disk('public')->exists($this->foto)) {
            Storage::disk('public')->delete($this->foto);
        }
    }
}