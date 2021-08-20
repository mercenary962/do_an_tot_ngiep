<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id');
            $table->unsignedBigInteger('user_id');
            $table->float('total_money')->nullable();
            $table->string('notes')->nullable();
            $table->string('vnp_response_code', 255)->nullable();
            $table->string('vnp_transaction_code', 255)->nullable();
            $table->string('code_vnpay', 255)->nullable();
            $table->string('code_bank', 255)->nullable();
            $table->dateTime('time')->nullable();
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('CASCADE');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
