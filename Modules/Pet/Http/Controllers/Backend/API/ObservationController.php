<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ObservationController extends Controller
{
    public function getUserPetObservations(int $pet_id)
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

        $observations = DB::table('user_pet_observations')
            ->where('pet_id', $pet_id)
            ->orderBy('data_observacao', 'desc')
            ->get();

        return response()->json([
            'observations' => $observations
        ], 200);
    }

    public function storeUserPetObservation(Request $request, int $pet_id)
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

        $data = $request->only(['titulo', 'descricao', 'data_observacao', 'categoria', 'veterinario', 'clinica']);

        if ($request->hasFile('foto')) {
            $data['foto'] = $request->file('foto')->store('observations', 'public');
        }

        $data['pet_id'] = $pet_id;

        $inserted_id = DB::table('user_pet_observations')->insertGetId($data);

        return response()->json([
            'inserted_id' => $inserted_id,
            'message' => 'Observação adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetObservation(Request $request, int $pet_id, int $observation_id)
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

        $observation = DB::table('user_pet_observations')
            ->where('id', $observation_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->exists();

        if (! $observation) {
            return response()->json([
                'message' => 'Observação not found'
            ], 404);
        }

        $data = $request->only(['titulo', 'descricao', 'data_observacao', 'categoria', 'veterinario', 'clinica']);

        if ($request->hasFile('foto')) {
            if (!empty($observation->foto) && Storage::disk('public')->exists($observation->foto)) {
                Storage::disk('public')->delete($observation->foto);
            }

            $data['foto'] = $request->file('foto')->store('observations', 'public');
        }

        $data['updated_at'] = now();

        DB::table('user_pet_observations')
            ->where('id', $observation_id)
            ->update($data);

        return response()->json([
            'message' => 'Observação atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetObservation(int $pet_id, int $observation_id)
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

        $observation = DB::table('user_pet_observations')
            ->where('id', $observation_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->exists();

        if (! $observation) {
            return response()->json([
                'message' => 'Observação not found'
            ], 404);
        }

        if (!empty($observation->foto) && Storage::disk('public')->exists($observation->foto)) {
            Storage::disk('public')->delete($observation->foto);
        }

        DB::table('user_pet_observations')
            ->where('id', $observation_id)
            ->delete();

        return response()->json([
            'message' => 'Observação deletada com sucesso!'
        ], 200);
    }
}
