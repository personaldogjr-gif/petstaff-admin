<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Modules\Pet\Models\Pet;
use Modules\Pet\Models\Surgery;

class SurgeryController extends Controller
{
    public function getUserPetSurgeries(int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $surgeries = Surgery::where('pet_id', $pet_id)
            ->orderBy('data_cirurgia', 'desc')
            ->get();

        return response()->json([
            'surgeries' => $surgeries
        ], 200);
    }

    public function storeUserPetSurgery(Request $request, int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $surgery = new Surgery($request->only(['nome', 'data_cirurgia', 'data_recuperacao', 'veterinario', 'clinica', 'tipo_cirurgia', 'observacoes']));

        if ($request->hasFile('foto')) {
            $surgery->foto = $request->file('foto')->store('surgeries', 'public');
        }

        $surgery->pet_id = $pet_id;
        $surgery->save();

        return response()->json([
            'inserted_id' => $surgery->id,
            'message' => 'Cirurgia adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetSurgery(Request $request, int $pet_id, int $surgery_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $surgery = Surgery::where('id', $surgery_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $surgery) {
            return response()->json([
                'message' => 'Cirurgia not found'
            ], 404);
        }

        $surgery->fill($request->only(['nome', 'data_cirurgia', 'data_recuperacao', 'veterinario', 'clinica', 'tipo_cirurgia', 'observacoes']));

        if ($request->hasFile('foto')) {
            $surgery->deleteFoto();
            $surgery->foto = $request->file('foto')->store('surgeries', 'public');
        }

        $surgery->save();

        return response()->json([
            'message' => 'Cirurgia atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetSurgery(int $pet_id, int $surgery_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $surgery = Surgery::where('id', $surgery_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $surgery) {
            return response()->json([
                'message' => 'Cirurgia not found'
            ], 404);
        }

        $surgery->deleteFoto();
        $surgery->delete();

        return response()->json([
            'message' => 'Cirurgia deletada com sucesso!'
        ], 200);
    }
}
