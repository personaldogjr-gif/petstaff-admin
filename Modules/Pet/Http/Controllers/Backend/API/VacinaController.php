<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class VacinaController extends Controller
{
    public function getUserPetVacinas(int $pet_id)
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

        $vacinas = DB::table('user_pet_vacinas')
            ->where('pet_id', $pet_id)
            ->orderBy('data_aplicacao', 'desc')
            ->get();

        return response()->json([
            'vacinas' => $vacinas
        ], 200);
    }

    public function storeUserPetVacina(Request $request, int $pet_id)
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

        $data = $request->only(['nome', 'data_aplicacao', 'data_reforco', 'cuidador']);

        if ($request->hasFile('foto')) {
            $data['foto'] = $request->file('foto')->store('vacinas', 'public');
        }

        $data['pet_id'] = $pet_id;

        $inserted_id = DB::table('user_pet_vacinas')->insertGetId($data);

        return response()->json([
            'inserted_id' => $inserted_id,
            'message' => 'Vacina adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetVacina(Request $request, int $pet_id, int $vacina_id)
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

        $vacina = DB::table('user_pet_vacinas')
            ->where('id', $vacina_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->first();

        if (! $vacina) {
            return response()->json([
                'message' => 'Vacina not found'
            ], 404);
        }

        $data = $request->only(['nome', 'data_aplicacao', 'data_reforco', 'cuidador']);

        if ($request->hasFile('foto')) {
            if (!empty($vacina->foto) && Storage::disk('public')->exists($vacina->foto)) {
                Storage::disk('public')->delete($vacina->foto);
            }

            $data['foto'] = $request->file('foto')->store('vacinas', 'public');
        }

        $data['updated_at'] = now();

        DB::table('user_pet_vacinas')
            ->where('id', $vacina_id)
            ->update($data);

        return response()->json([
            'message' => 'Vacina atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetVacina(int $pet_id, int $vacina_id)
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

        $vacina = DB::table('user_pet_vacinas')
            ->where('id', $vacina_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->first();

        if (! $vacina) {
            return response()->json([
                'message' => 'Vacina not found'
            ], 404);
        }

        if (!empty($vacina->foto) && Storage::disk('public')->exists($vacina->foto)) {
            Storage::disk('public')->delete($vacina->foto);
        }

        DB::table('user_pet_vacinas')
            ->where('id', $vacina_id)
            ->delete();

        return response()->json([
            'message' => 'Vacina deletada com sucesso!'
        ], 200);
    }
}
