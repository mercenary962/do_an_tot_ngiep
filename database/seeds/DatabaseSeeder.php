<?php


use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
         $this->call(UsersTableSeeder::class);
         $this->call(CouponSeeder::class);
         $this->call(BrandsTableSeeder::class);
         $this->call(CategoriesSeeder::class);
         $this->call(PostCategoriesSeeder::class);
         $this->call(ShippingSeeder::class);


    }
}
