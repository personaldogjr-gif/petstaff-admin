<?php

namespace Modules\Pet\Http\Controllers\Backend\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class VermifugacaoController extends Controller
{
    public function getUserPetVermifugacoes(int $pet_id)
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

        $vermifugacoes = DB::table('user_pet_vermifugacoes')
            ->where('pet_id', $pet_id)
            ->orderBy('data_vermifugacao', 'desc')
            ->get();

        return response()->json([
            'vermifugacoes' => $vermifugacoes
        ], 200);
    }

    public function storeUserPetVermifugacao(Request $request, int $pet_id)
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

        $data = $request->only(['data_vermifugacao', 'vermifugo', 'dose', 'peso', 'repetir_em']);

        if ($request->hasFile('foto')) {
            $data['foto'] = $request->file('foto')->store('vermifugacoes', 'public');
        }

        $data['pet_id'] = $pet_id;

        $inserted_id = DB::table('user_pet_vermifugacoes')->insertGetId($data);

        return response()->json([
            'inserted_id' => $inserted_id,
            'message' => 'Vermifugação adicionada com sucesso!'
        ], 201);
    }

    public function updateUserPetVermifugacao(Request $request, int $pet_id, int $vermifugacao_id)
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

        $vermifugacao = DB::table('user_pet_vermifugacoes')
            ->where('id', $vermifugacao_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->exists();

        if (! $vermifugacao) {
            return response()->json([
                'message' => 'Vermifugação not found'
            ], 404);
        }

        $data = $request->only(['data_vermifugacao', 'vermifugo', 'dose', 'peso', 'repetir_em']);

        if ($request->hasFile('foto')) {
            if (!empty($vermifugacao->foto) && Storage::disk('public')->exists($vermifugacao->foto)) {
                Storage::disk('public')->delete($vermifugacao->foto);
            }

            $data['foto'] = $request->file('foto')->store('vermifugacoes', 'public');
        }

        $data['updated_at'] = now();

        DB::table('user_pet_vermifugacoes')
            ->where('id', $vermifugacao_id)
            ->update($data);

        return response()->json([
            'message' => 'Vermifugação atualizada com sucesso!'
        ], 200);
    }

    public function deleteUserPetVermifugacao(int $pet_id, int $vermifugacao_id)
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

        $vermifugacao = DB::table('user_pet_vermifugacoes')
            ->where('id', $vermifugacao_id)
            ->where('pet_id', $pet_id)
            ->select(['foto'])
            ->exists();

        if (! $vermifugacao) {
            return response()->json([
                'message' => 'Vermifugação not found'
            ], 404);
        }

        if (!empty($vermifugacao->foto) && Storage::disk('public')->exists($vermifugacao->foto)) {
            Storage::disk('public')->delete($vermifugacao->foto);
        }

        DB::table('user_pet_vermifugacoes')
            ->where('id', $vermifugacao_id)
            ->delete();

        return response()->json([
            'message' => 'Vermifugação deletada com sucesso!'
        ], 200);
    }
}
