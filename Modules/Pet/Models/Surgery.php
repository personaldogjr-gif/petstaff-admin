<?php

namespace Modules\Pet\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Surgery extends Model
{
    protected $table = 'user_pet_surgeries';
    
    protected $fillable = [
        'nome',
        'data_cirurgia',
        'data_recuperacao',
        'veterinario',
        'clinica',
        'tipo_cirurgia',
        'observacoes',
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