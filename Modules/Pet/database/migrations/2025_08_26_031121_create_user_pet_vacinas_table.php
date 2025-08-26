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
        Schema::create('user_pet_vacinas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pet_id');
            $table->string('nome');
            $table->dateTime('data_aplicacao');
            $table->dateTime('data_reforco')->nullable();
            $table->string('cuidador');
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
        Schema::dropIfExists('user_pet_vacinas');
    }
};
