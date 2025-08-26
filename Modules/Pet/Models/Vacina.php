<?php

namespace Modules\Pet\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Vacina extends Model
{
    protected $table = 'user_pet_vacinas';
    
    protected $fillable = [
        'nome',
        'data_aplicacao',
        'data_reforco',
        'cuidador',
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