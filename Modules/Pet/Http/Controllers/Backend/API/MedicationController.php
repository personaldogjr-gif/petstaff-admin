<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Pet\Models\Pet;
use Modules\Pet\Models\Medication;

class MedicationController extends Controller
{
    public function getUserPetMedications(int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $medications = Medication::where('pet_id', $pet_id)
            ->orderBy('date', 'desc')
            ->get();

        return response()->json([
            'medications' => $medications
        ], 200);
    }

    public function storeUserPetMedication(Request $request, int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $medication = new Medication($request->only([
            'name',
            'date',
            'recurring',
            'dosage',
            'notes'
        ]));
        $medication->pet_id = $pet_id;
        $medication->save();

        return response()->json([
            'inserted_id' => $medication->id,
            'message' => 'Medicação adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetMedication(Request $request, int $pet_id, int $medication_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $medication = Medication::where('id', $medication_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $medication) {
            return response()->json([
                'message' => 'Medicação not found'
            ], 404);
        }

        $medication->fill($request->only([
            'name',
            'date',
            'recurring',
            'dosage',
            'notes'
        ]));
        $medication->save();

        return response()->json([
            'message' => 'Medicação atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetMedication(int $pet_id, int $medication_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $medication = Medication::where('id', $medication_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $medication) {
            return response()->json([
                'message' => 'Medicação not found'
            ], 404);
        }

        $medication->delete();

        return response()->json([
            'message' => 'Medicação deletada com sucesso!'
        ], 200);
    }
}
