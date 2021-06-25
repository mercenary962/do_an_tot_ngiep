<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ShippingSeeder extends Seeder
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
                'type'=>'VNPost – EMS (Bưu điện Việt Nam)',
                'price'=>'62000',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),

            ),
            array(
                'type'=>'Viettel Post',
                'price'=>'54000',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),

            ),
            array(
                'type'=>'Giaohangnhanh – GHN',
                'price'=>'45000',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),

            ),
            array(
                'type'=>'Giaohangtietkiem – GHTK',
                'price'=>'39000',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),

            ),
            array(
                'type'=>'J&T Express',
                'price'=>'40000',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),

            ),
        );
        DB::table('shippings')->insert($data);
    }
}
