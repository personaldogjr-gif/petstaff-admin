<?php

namespace Modules\Blog\Models;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Blog extends BaseModel
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'blogs';
    protected $fillable = ['name', 'tags', 'description', 'status', 'blog_image'];
    protected $casts = [
        'created_by'=> 'integer',
        'updated_by'=> 'integer',
        'deleted_by' => 'integer',
      ];
    /**
     * Create a new factory instance for the model.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    protected static function newFactory()
    {
        return \Modules\Blog\database\factories\BlogFactory::new();
    }

    public function getBlogImageAttribute($value)
    {
        // Se o valor já existe, retornar
        if ($value) {
            return $value;
        }
        
        // Se não existir, retornar imagem padrão
        return default_feature_image();
    }
}
