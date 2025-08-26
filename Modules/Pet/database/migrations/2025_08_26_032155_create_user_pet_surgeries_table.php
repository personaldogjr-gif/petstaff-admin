<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_pet_surgeries', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pet_id');
            $table->string('nome');
            $table->dateTime('data_cirurgia');
            $table->dateTime('data_recuperacao')->nullable();
            $table->string('veterinario');
            $table->string('clinica');
            $table->string('tipo_cirurgia');
            $table->text('observacoes')->nullable();
            $table->string('foto')->nullable();
            $table->timestamps();
            $table->foreign('pet_id')->references('id')->on('pets')->onDelete('CASCADE');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_pet_surgeries');
    }
};
