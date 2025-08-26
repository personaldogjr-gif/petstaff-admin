<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class SurgeryController extends Controller
{
    public function getUserPetSurgeries(int $pet_id)
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

        $surgeries = DB::table('user_pet_surgeries')
            ->where('pet_id', $pet_id)
            ->orderBy('data_cirurgia', 'desc')
            ->get();

        return response()->json([
            'surgeries' => $surgeries
        ], 200);
    }

    public function storeUserPetSurgery(Request $request, int $pet_id)
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

        $data = $request->only(['nome', 'data_cirurgia', 'data_recuperacao', 'veterinario', 'clinica', 'tipo_cirurgia', 'observacoes']);

        if ($request->hasFile('foto')) {
            $data['foto'] = $request->file('foto')->store('surgeries', 'public');
        }

        $data['pet_id'] = $pet_id;

        $inserted_id = DB::table('user_pet_surgeries')->insertGetId($data);

        return response()->json([
            'inserted_id' => $inserted_id,
            'message' => 'Cirurgia adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetSurgery(Request $request, int $pet_id, int $surgery_id)
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

        $surgery = DB::table('user_pet_surgeries')
            ->where('id', $surgery_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->exists();

        if (! $surgery) {
            return response()->json([
                'message' => 'Cirurgia not found'
            ], 404);
        }

        $data = $request->only(['nome', 'data_cirurgia', 'data_recuperacao', 'veterinario', 'clinica', 'tipo_cirurgia', 'observacoes']);

        if ($request->hasFile('foto')) {
            if (!empty($surgery->foto) && Storage::disk('public')->exists($surgery->foto)) {
                Storage::disk('public')->delete($surgery->foto);
            }

            $data['foto'] = $request->file('foto')->store('surgeries', 'public');
        }

        $data['updated_at'] = now();

        DB::table('user_pet_surgeries')
            ->where('id', $surgery_id)
            ->update($data);

        return response()->json([
            'message' => 'Cirurgia atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetSurgery(int $pet_id, int $surgery_id)
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

        $surgery = DB::table('user_pet_surgeries')
            ->where('id', $surgery_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->exists();

        if (! $surgery) {
            return response()->json([
                'message' => 'Cirurgia not found'
            ], 404);
        }

        if (!empty($surgery->foto) && Storage::disk('public')->exists($surgery->foto)) {
            Storage::disk('public')->delete($surgery->foto);
        }

        DB::table('user_pet_surgeries')
            ->where('id', $surgery_id)
            ->delete();

        return response()->json([
            'message' => 'Cirurgia deletada com sucesso!'
        ], 200);
    }
}
