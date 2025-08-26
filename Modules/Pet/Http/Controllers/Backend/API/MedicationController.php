<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MedicationController extends Controller
{
    public function getUserPetMedications(int $pet_id)
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

        $medications = DB::table('user_pet_medications')
            ->where('pet_id', $pet_id)
            ->orderBy('date', 'desc')
            ->get();

        return response()->json([
            'medications' => $medications
        ], 200);
    }

    public function storeUserPetMedication(Request $request, int $pet_id)
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
            'name',
            'date',
            'recurring',
            'dosage',
            'notes'
        ]);
        $data['pet_id'] = $pet_id;

        $inserted_id = DB::table('user_pet_medications')->insertGetId($data);

        return response()->json([
            'inserted_id' => $inserted_id,
            'message' => 'Medicação adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetMedication(Request $request, int $pet_id, int $medication_id)
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

        $medication_exists = DB::table('user_pet_medications')
            ->where('id', $medication_id)
            ->where('pet_id', $pet_id)
            ->exists();

        if (! $medication_exists) {
            return response()->json([
                'message' => 'Medicação not found'
            ], 404);
        }

        $data = $request->only([
            'name',
            'date',
            'recurring',
            'dosage',
            'notes'
        ]);
        $data['updated_at'] = now();

        DB::table('user_pet_medications')
            ->where('id', $medication_id)
            ->update($data);

        return response()->json([
            'message' => 'Medicação atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetMedication(int $pet_id, int $medication_id)
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

        $medication_exists = DB::table('user_pet_medications')
            ->where('id', $medication_id)
            ->where('pet_id', $pet_id)
            ->exists();

        if (! $medication_exists) {
            return response()->json([
                'message' => 'Medicação not found'
            ], 404);
        }

        DB::table('user_pet_medications')
            ->where('id', $medication_id)
            ->delete();

        return response()->json([
            'message' => 'Medicação deletada com sucesso!'
        ], 200);
    }
}
