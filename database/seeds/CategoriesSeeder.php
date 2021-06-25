<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class CategoriesSeeder extends Seeder
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
                'title'=>'Bộ xử lý trung tâm',
                'slug'=>'bo-xu-ly-trung-tam',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            array(
                'title'=>'Công tắc cảm ứng',
                'slug'=>'cong-tac-cam-ung',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            array(
                'title'=>'Thiết bị điều khiển',
                'slug'=>'thiet-bi-dieu-khien',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            array(
                'title'=>'Thiết bị an ninh',
                'slug'=>'thiet-bi-an-ninh',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            array(
                'title'=>'Cảm biến thông minh',
                'slug'=>'cam-bien-thong-minh',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            array(
                'title'=>'Ổ cắm thông minh',
                'slug'=>'o-cam-thong-minh',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            
        );

        DB::table('categories')->insert($data);
    }
}

