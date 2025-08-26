<?php

namespace Modules\Pet\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Vermifugacao extends Model
{
    protected $table = 'user_pet_vermifugacoes';
    
    protected $fillable = [
        'data_vermifugacao',
        'vermifugo',
        'dose',
        'peso',
        'repetir_em',
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