<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_number')->unique();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('product_id');
            $table->integer('sub_total');
            $table->unsignedBigInteger('shipping_id')->nullable();
            $table->integer('coupon')->nullable();
            $table->integer('total_amount');
            $table->integer('quantity');
            $table->enum('payment_method',['cod','vnpay'])->default('cod');
            $table->enum('payment_status',['paid','unpaid'])->default('unpaid');
            $table->enum('status',['new','process','delivered','cancel'])->default('new');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('CASCADE');
            $table->foreign('shipping_id')->references('id')->on('shippings')->onDelete('SET NULL');
            // $table->string('name');
            // $table->string('email');
            // $table->string('phone');
            // $table->text('address');
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
