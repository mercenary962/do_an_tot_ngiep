<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDatabaseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        // Verify Users Table
        Schema::create('verify_users', function (Blueprint $table) {
            $table->id();
            $table->string('token');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Brands Table
        Schema::create('brands', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->enum('status',['active','inactive'])->default('active');
            $table->timestamps();
        });

        // Banner Table
        Schema::create('banners', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->string('photo')->nullable();
            $table->text('description')->nullable();
            $table->enum('status',['active','inactive'])->default('inactive');
            $table->timestamps();
        });

        //Categories Table
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->string('photo')->nullable();
            $table->enum('status',['active','inactive'])->default('inactive');
            $table->timestamps();
        });

        // Products Tables
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->text('summary');
            $table->longText('description')->nullable();
            $table->text('photo');
            $table->integer('stock')->default(1);
            $table->enum('status',['active','inactive'])->default('inactive');
            $table->integer('price');
            $table->integer('discount')->nullabale();
            $table->unsignedBigInteger('cat_id')->nullable();
            $table->unsignedBigInteger('brand_id')->nullable();
            $table->foreign('brand_id')->references('id')->on('brands')->onDelete('SET NULL');
            $table->foreign('cat_id')->references('id')->on('categories')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Post categories
        Schema::create('post_categories', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->enum('status',['active','inactive'])->default('active');
            $table->timestamps();
        });

        // Posts Table
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->text('summary');
            $table->longText('description')->nullable();
            $table->string('photo')->nullable();
            $table->unsignedBigInteger('post_cat_id')->nullable();
            $table->enum('status',['active','inactive'])->default('active');
            $table->foreign('post_cat_id')->references('id')->on('post_categories')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Messages Table 
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('subject');
            $table->string('email');
            $table->string('photo')->nullable();
            $table->string('phone')->nullable();
            $table->longText('message');
            $table->timestamp('read_at')->nullable();
            $table->timestamps();
        });

        // Shipping Table
        Schema::create('shippings', function (Blueprint $table) {
            $table->id();
            $table->string('type');
            $table->integer('price');
            $table->enum('status',['active','inactive'])->default('active');
            $table->timestamps();
        });

        // Orders Table
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
            $table->text('notes')->nullable();
            $table->timestamps();
        });

        // Carts Table
        Schema::create('carts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('order_id')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->integer('price');
            $table->enum('status',['new','progress','delivered','cancel'])->default('new');
            $table->integer('quantity');
            $table->integer('amount');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('CASCADE');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('CASCADE');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Notifications Table
        Schema::create('notifications', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('type');
            $table->morphs('notifiable');
            $table->text('data');
            $table->timestamp('read_at')->nullable();
            $table->timestamps();
        });

        // Coupon Table
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();
            $table->enum('type',['fixed','percent'])->default('fixed');
            $table->decimal('value',20,2);
            $table->enum('status',['active','inactive'])->default('inactive');
            $table->timestamps();
        });

        // Wishlist Table
        Schema::create('wishlists', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('cart_id')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->integer('price');
            $table->integer('quantity');
            $table->integer('amount');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('CASCADE');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
            $table->foreign('cart_id')->references('id')->on('carts')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Product Reviews
        Schema::create('product_reviews', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('product_id')->nullable();
            $table->tinyInteger('rate')->default(0);
            $table->text('review')->nullable();
            $table->enum('status',['active','inactive'])->default('active');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Post Comments
        Schema::create('post_comments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('post_id')->nullable();
            $table->text('comment');
            $table->enum('status',['active','inactive'])->default('active');
            $table->text('replied_comment')->nullable();
            $table->unsignedBigInteger('parent_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
            $table->foreign('post_id')->references('id')->on('posts')->onDelete('SET NULL');
            $table->timestamps();
        });

        // Payments Method
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id');
            $table->unsignedBigInteger('user_id');
            $table->integer('total_money')->nullable();
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
        Schema::dropIfExists('verify_users');
        Schema::dropIfExists('brands');
        Schema::dropIfExists('banners');
        Schema::dropIfExists('categories');
        Schema::dropIfExists('products');
        Schema::dropIfExists('post_categories');
        Schema::dropIfExists('posts');
        Schema::dropIfExists('messages');
        Schema::dropIfExists('shippings');
        Schema::dropIfExists('carts');
        Schema::dropIfExists('notifications');
        Schema::dropIfExists('coupons');
        Schema::dropIfExists('wishlists');
        Schema::dropIfExists('product_reviews');
        Schema::dropIfExists('post_comments');
        Schema::dropIfExists('payments');
    }
}
