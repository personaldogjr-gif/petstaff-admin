<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Modules\Pet\Models\Pet;
use Modules\Pet\Models\Vacina;

class VacinaController extends Controller
{
    public function getUserPetVacinas(int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vacinas = Vacina::where('pet_id', $pet_id)
            ->orderBy('data_aplicacao', 'desc')
            ->get();

        return response()->json([
            'vacinas' => $vacinas
        ], 200);
    }

    public function storeUserPetVacina(Request $request, int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vacina = new Vacina($request->only(['nome', 'data_aplicacao', 'data_reforco', 'cuidador']));

        if ($request->hasFile('foto')) {
            $vacina->foto = $request->file('foto')->store('vacinas', 'public');
        }

        $vacina->pet_id = $pet_id;
        $vacina->save();

        return response()->json([
            'inserted_id' => $vacina->id,
            'message' => 'Vacina adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetVacina(Request $request, int $pet_id, int $vacina_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vacina = Vacina::where('id', $vacina_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $vacina) {
            return response()->json([
                'message' => 'Vacina not found'
            ], 404);
        }

        $vacina->fill($request->only(['nome', 'data_aplicacao', 'data_reforco', 'cuidador']));

        if ($request->hasFile('foto')) {
            $vacina->deleteFoto();
            $vacina->foto = $request->file('foto')->store('vacinas', 'public');
        }

        $vacina->save();

        return response()->json([
            'message' => 'Vacina atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetVacina(int $pet_id, int $vacina_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vacina = Vacina::where('id', $vacina_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $vacina) {
            return response()->json([
                'message' => 'Vacina not found'
            ], 404);
        }

        $vacina->deleteFoto();
        $vacina->delete();

        return response()->json([
            'message' => 'Vacina deletada com sucesso!'
        ], 200);
    }
}
