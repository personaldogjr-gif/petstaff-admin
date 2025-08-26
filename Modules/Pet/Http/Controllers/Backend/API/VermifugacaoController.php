<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Modules\Pet\Models\Pet;
use Modules\Pet\Models\Vermifugacao;

class VermifugacaoController extends Controller
{
    public function getUserPetVermifugacoes(int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vermifugacoes = Vermifugacao::where('pet_id', $pet_id)
            ->orderBy('data_vermifugacao', 'desc')
            ->get();

        return response()->json([
            'vermifugacoes' => $vermifugacoes
        ], 200);
    }

    public function storeUserPetVermifugacao(Request $request, int $pet_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vermifugacao = new Vermifugacao($request->only(['data_vermifugacao', 'vermifugo', 'dose', 'peso', 'repetir_em']));

        if ($request->hasFile('foto')) {
            $vermifugacao->foto = $request->file('foto')->store('vermifugacoes', 'public');
        }

        $vermifugacao->pet_id = $pet_id;
        $vermifugacao->save();

        return response()->json([
            'inserted_id' => $vermifugacao->id,
            'message' => 'Vermifugação adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetVermifugacao(Request $request, int $pet_id, int $vermifugacao_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vermifugacao = Vermifugacao::where('id', $vermifugacao_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $vermifugacao) {
            return response()->json([
                'message' => 'Vermifugação not found'
            ], 404);
        }

        $vermifugacao->fill($request->only(['data_vermifugacao', 'vermifugo', 'dose', 'peso', 'repetir_em']));

        if ($request->hasFile('foto')) {
            if (!empty($vermifugacao->foto) && Storage::disk('public')->exists($vermifugacao->foto)) {
                Storage::disk('public')->delete($vermifugacao->foto);
            }
            $vermifugacao->foto = $request->file('foto')->store('vermifugacoes', 'public');
        }

        $vermifugacao->save();

        return response()->json([
            'message' => 'Vermifugação atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetVermifugacao(int $pet_id, int $vermifugacao_id)
    {
        $pet = Pet::where('id', $pet_id)
            ->where('user_id', auth()->id())
            ->first();

        if (! $pet) {
            return response()->json([
                'message' => 'Pet not found'
            ], 404);
        }

        $vermifugacao = Vermifugacao::where('id', $vermifugacao_id)
            ->where('pet_id', $pet_id)
            ->first();

        if (! $vermifugacao) {
            return response()->json([
                'message' => 'Vermifugação not found'
            ], 404);
        }

        if (!empty($vermifugacao->foto) && Storage::disk('public')->exists($vermifugacao->foto)) {
            Storage::disk('public')->delete($vermifugacao->foto);
        }

        $vermifugacao->delete();

        return response()->json([
            'message' => 'Vermifugação deletada com sucesso!'
        ], 200);
    }
}
