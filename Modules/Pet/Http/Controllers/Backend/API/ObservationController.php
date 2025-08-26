<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Modules\Pet\Models\Pet;
use Modules\Pet\Models\Observation;

class ObservationController extends Controller
{
    public function getUserPetObservations(int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $observations = Observation::where('pet_id', $pet_id)
            ->orderBy('data_observacao', 'desc')
            ->get();

        return response()->json([
            'observations' => $observations
        ], 200);
    }

    public function storeUserPetObservation(Request $request, int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $observation = new Observation($request->only(['titulo', 'descricao', 'data_observacao', 'categoria', 'veterinario', 'clinica']));

        if ($request->hasFile('foto')) {
            $observation->foto = $request->file('foto')->store('observations', 'public');
        }

        $observation->pet_id = $pet_id;
        $observation->save();

        return response()->json([
            'inserted_id' => $observation->id,
            'message' => 'Observação adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetObservation(Request $request, int $pet_id, int $observation_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $observation = Observation::where('id', $observation_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $observation) {
            return response()->json([
                'message' => 'Observação not found'
            ], 404);
        }

        $observation->fill($request->only(['titulo', 'descricao', 'data_observacao', 'categoria', 'veterinario', 'clinica']));

        if ($request->hasFile('foto')) {
            $observation->deleteFoto();
            $observation->foto = $request->file('foto')->store('observations', 'public');
        }

        $observation->save();

        return response()->json([
            'message' => 'Observação atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetObservation(int $pet_id, int $observation_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $observation = Observation::where('id', $observation_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $observation) {
            return response()->json([
                'message' => 'Observação not found'
            ], 404);
        }

        $observation->deleteFoto();
        $observation->delete();

        return response()->json([
            'message' => 'Observação deletada com sucesso!'
        ], 200);
    }
}
