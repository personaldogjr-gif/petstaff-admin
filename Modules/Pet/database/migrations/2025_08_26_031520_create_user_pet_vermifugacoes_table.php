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
        Schema::create('user_pet_vermifugacoes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pet_id');
            $table->dateTime('data_vermifugacao');
            $table->string('vermifugo');
            $table->string('dose');
            $table->string('peso');
            $table->dateTime('repetir_em');
            $table->string('foto');
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
        Schema::dropIfExists('user_pet_vermifugacoes');
    }
};
