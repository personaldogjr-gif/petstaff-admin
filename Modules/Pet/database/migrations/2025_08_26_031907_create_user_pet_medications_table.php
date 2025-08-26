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
        Schema::create('user_pet_medications', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pet_id');
            $table->string('name');
            $table->dateTime('date');
            $table->boolean('recurring')->default(false);
            $table->string('dosage');
            $table->text('notes')->nullable();
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
        Schema::dropIfExists('user_pet_medications');
    }
};
