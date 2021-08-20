<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            array(
                'name'=>'Admin',
                'email'=>'admin@gmail.com',
                'password'=>Hash::make('123456'),
                'role'=>'admin',
                'status'=>'active',
                'phone'=>'0986747812',
                'address'=>'Thanh Nhan',
                'remember_token' => str_random(10),
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
            ),
            array(
                'name'=>'User',
                'email'=>'user@gmail.com',
                'password'=>Hash::make('123456'),
                'role'=>'user',
                'phone'=>'0986747812',
                'address'=>'Quan 7',
                'status'=>'active',
                'remember_token' => str_random(10),
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
            ),
        );

        DB::table('users')->insert($data);
    }
}
