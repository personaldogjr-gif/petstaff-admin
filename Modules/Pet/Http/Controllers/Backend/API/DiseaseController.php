<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Pet\Models\Pet;
use Modules\Pet\Models\Disease;

class DiseaseController extends Controller
{
    public function getUserPetDiseases(int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $diseases = Disease::where('pet_id', $pet_id)
            ->orderBy('data_diagnostico', 'desc')
            ->get();

        return response()->json([
            'diseases' => $diseases
        ], 200);
    }

    public function storeUserPetDisease(Request $request, int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $disease = new Disease($request->only([
            'nome',
            'data_diagnostico',
            'data_cura',
            'veterinario',
            'clinica',
            'sintomas',
            'tratamento',
            'observacoes'
        ]));
        $disease->pet_id = $pet_id;
        $disease->save();

        return response()->json([
            'inserted_id' => $disease->id,
            'message' => 'Doença adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetDisease(Request $request, int $pet_id, int $disease_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $disease = Disease::where('id', $disease_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $disease) {
            return response()->json([
                'message' => 'Doença not found'
            ], 404);
        }

        $disease->fill($request->only([
            'nome',
            'data_diagnostico',
            'data_cura',
            'veterinario',
            'clinica',
            'sintomas',
            'tratamento',
            'observacoes'
        ]));
        $disease->save();

        return response()->json([
            'message' => 'Doença atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetDisease(int $pet_id, int $disease_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $disease = Disease::where('id', $disease_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $disease) {
            return response()->json([
                'message' => 'Doença not found'
            ], 404);
        }

        $disease->delete();

        return response()->json([
            'message' => 'Doença deletada com sucesso!'
        ], 200);
    }
}
