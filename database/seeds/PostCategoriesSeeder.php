<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class PostCategoriesSeeder extends Seeder
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
                'title'=>'Khách hàng',
                'slug'=>'khach-hang',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),

            ),
            array(
                'title'=>'Giải pháp nhà công nghệ',
                'slug'=>'giai-phap-nha-cong-nghe',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
            array(
                'title'=>'Công nghệ',
                'slug'=>'cong-nghe',
                'status'=>'active',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            ),
        );

        DB::table('post_categories')->insert($data);
    }
}
