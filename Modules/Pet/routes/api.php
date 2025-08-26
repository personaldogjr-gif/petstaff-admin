<?php

use Illuminate\Support\Facades\Route;
use Modules\Pet\Http\Controllers\Backend\PetsController;
use Modules\Pet\Http\Controllers\Backend\PetNoteController;
use Modules\Pet\Http\Controllers\Backend\PettypeController;
use Modules\Pet\Http\Controllers\Backend\API\PetController;
use Modules\Pet\Http\Controllers\Backend\API\VacinaController;
use Modules\Pet\Http\Controllers\Backend\API\VermifugacaoController;
use Modules\Pet\Http\Controllers\Backend\API\MedicationController;
use Modules\Pet\Http\Controllers\Backend\API\SurgeryController;
use Modules\Pet\Http\Controllers\Backend\API\DiseaseController;
use Modules\Pet\Http\Controllers\Backend\API\ObservationController;

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('pet/{id}', [PetsController::class, 'update']);
    Route::Resource('pet', PetsController::class);
    Route::post('save-note', [PetNoteController::class,'store']);
    Route::post('delete-note/{id}', [PetNoteController::class,'destroy']);
    Route::Resource('pettype', PettypeController::class);
    Route::get('pet-list', [PetController::class, 'petList']);
    Route::get('pet-details', [PetController::class, 'PetDetails']);
    Route::get('get-notes', [PetController::class, 'petNoteList']);
    Route::get('owner-pet-list', [PetController::class, 'OwnerPetList']);

    Route::prefix('pet/{pet_id}/vacinas')->group(function () {
        Route::get('/', [VacinaController::class, 'getUserPetVacinas']);
        Route::post('/', [VacinaController::class, 'storeUserPetVacina']);
        Route::put('/{vacina_id}', [VacinaController::class, 'updateUserPetVacina']);
        Route::delete('/{vacina_id}', [VacinaController::class, 'deleteUserPetVacina']);
    });

    Route::prefix('pet/{pet_id}/vermifugacoes')->group(function () {
        Route::get('/', [VermifugacaoController::class, 'getUserPetVermifugacoes']);
        Route::post('/', [VermifugacaoController::class, 'storeUserPetVermifugacao']);
        Route::put('/{vermifugacao_id}', [VermifugacaoController::class, 'updateUserPetVermifugacao']);
        Route::delete('/{vermifugacao_id}', [VermifugacaoController::class, 'deleteUserPetVermifugacao']);
    });

    Route::prefix('pet/{pet_id}/medications')->group(function () {
        Route::get('/', [MedicationController::class, 'getUserPetMedications']);
        Route::post('/', [MedicationController::class, 'storeUserPetMedication']);
        Route::put('/{medication_id}', [MedicationController::class, 'updateUserPetMedication']);
        Route::delete('/{medication_id}', [MedicationController::class, 'deleteUserPetMedication']);
    });

    Route::prefix('pet/{pet_id}/surgeries')->group(function () {
        Route::get('/', [SurgeryController::class, 'getUserPetSurgeries']);
        Route::post('/', [SurgeryController::class, 'storeUserPetSurgery']);
        Route::put('/{surgery_id}', [SurgeryController::class, 'updateUserPetSurgery']);
        Route::delete('/{surgery_id}', [SurgeryController::class, 'deleteUserPetSurgery']);
    });

    Route::prefix('pet/{pet_id}/diseases')->group(function () {
        Route::get('/', [DiseaseController::class, 'getUserPetDiseases']);
        Route::post('/', [DiseaseController::class, 'storeUserPetDisease']);
        Route::put('/{disease_id}', [DiseaseController::class, 'updateUserPetDisease']);
        Route::delete('/{disease_id}', [DiseaseController::class, 'deleteUserPetDisease']);
    });

    Route::prefix('pet/{pet_id}/observations')->group(function () {
        Route::get('/', [ObservationController::class, 'getUserPetObservations']);
        Route::post('/', [ObservationController::class, 'storeUserPetObservation']);
        Route::put('/{observation_id}', [ObservationController::class, 'updateUserPetObservation']);
        Route::delete('/{observation_id}', [ObservationController::class, 'deleteUserPetObservation']);
    });
});

Route::get('pet-types', [PetController::class, 'petTypeList']);
Route::get('breed-list', [PetController::class, 'breedList']);
// Route::get('pet-list', [PetController::class, 'petList']);
