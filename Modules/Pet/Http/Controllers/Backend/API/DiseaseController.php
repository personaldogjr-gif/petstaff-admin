<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DiseaseController extends Controller
{
    public function getUserPetDiseases(int $pet_id)
    {
        $pet_exists = DB::table('pets')
            ->where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->exists();

        if (! $pet_exists) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $diseases = DB::table('user_pet_diseases')
            ->where('pet_id', $pet_id)
            ->orderBy('data_diagnostico', 'desc')
            ->get();

        return response()->json([
            'diseases' => $diseases
        ], 200);
    }

    public function storeUserPetDisease(Request $request, int $pet_id)
    {
        $pet_exists = DB::table('pets')
            ->where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->exists();

        if (! $pet_exists) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $data = $request->only([
            'nome',
            'data_diagnostico',
            'data_cura',
            'veterinario',
            'clinica',
            'sintomas',
            'tratamento',
            'observacoes'
        ]);
        $data['pet_id'] = $pet_id;

        $inserted_id = DB::table('user_pet_diseases')->insertGetId($data);

        return response()->json([
            'inserted_id' => $inserted_id,
            'message' => 'Doença adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetDisease(Request $request, int $pet_id, int $disease_id)
    {
        $pet_exists = DB::table('pets')
            ->where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->exists();

        if (! $pet_exists) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $disease_exists = DB::table('user_pet_diseases')
            ->where('id', $disease_id)
            ->where('pet_id', $pet_id)
            ->exists();

        if (! $disease_exists) {
            return response()->json([
                'message' => 'Doença not found'
            ], 404);
        }

        $data = $request->only([
            'nome',
            'data_diagnostico',
            'data_cura',
            'veterinario',
            'clinica',
            'sintomas',
            'tratamento',
            'observacoes'
        ]);
        $data['updated_at'] = now();

        DB::table('user_pet_diseases')
            ->where('id', $disease_id)
            ->update($data);

        return response()->json([
            'message' => 'Doença atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetDisease(int $pet_id, int $disease_id)
    {
        $pet_exists = DB::table('pets')
            ->where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->exists();

        if (! $pet_exists) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $disease_exists = DB::table('user_pet_diseases')
            ->where('id', $disease_id)
            ->where('pet_id', $pet_id)
            ->exists();

        if (! $disease_exists) {
            return response()->json([
                'message' => 'Doença not found'
            ], 404);
        }

        DB::table('user_pet_diseases')
            ->where('id', $disease_id)
            ->delete();

        return response()->json([
            'message' => 'Doença deletada com sucesso!'
        ], 200);
    }
}
