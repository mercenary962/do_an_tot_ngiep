<?php

use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            'description'=>"Trong cuộc sống hiện đại ngày nay, Thiết Bị Điện Thông Minh đang ngày càng trở nên thông dụng. Và ngày càng được sử dụng rộng rãi.

            Các thiết bị này giúp cho cuộc sống của chúng ta thêm tiện nghi và thông minh hơn.
            
            Không còn cái cảnh đi ra vào nhà vệ sinh, lên xuống cầu thang vào ban đêm. Phải dùng tay bật công tắc nữa. Các thiết bị như bóng đèn cảm ứng, đui đèn cảm ứng, cảm biến chuyển động,.. Đã thay chúng ta làm những việc đó, giúp tránh những rủi ro và tiết kiệm năng lượng.
            Hay với các thiết bị điều khiển từ xa qua 3G,Wifi thì dù đi bất cứ đâu. Ta cũng có thể kiểm soát theo dõi được các thiết bị điện ở nhà. Muốn tắt hay mở thì bây giờ chỉ cần cầm điện thoại ra là có thể on, off.
            Các thiết bị hẹn giờ tự động lại tự động giúp con người chúng ta bơm nước, tưới cây, tắt đèn bảng hiệu quảng cáo theo thời gian chúng ta mong muốn.
            Trong thời buổi công nghệ càng ngày càng phát triển như hiện nay. Thì việc sử dụng thiết bị điện thông minh là tất yếu.
            
            Công ty Thiết Bị Điện tử Thông Minh là đơn vị chuyên cung cấp các thiết bị thông minh phù hợp với mọi đối tượng người dùng
            
            Các sản phảm và dịch vụ chung tôi cung cấp:
            ➡ Thiết bị điện thông minh, nhà thông minh
            
            ➡ Các thiết bị hẹn giờ tự động
            
            ➡ Cửa tự động, cổng tự động.
            
            ➡ Thiết bị chống trộm thông minh
            
            ➡ Đèn năng lượng mặt trời giá rẻ
            
            Chúng tôi luôn mong muốn cung cấp các sản phẩm và giải pháp tốt nhất nhưng phải có giá thành tốt nhất đến cho bà con.
            
            Với mong muốn từ cái tâm của chúng tôi: Nhà nhà có thiết bị điện thông minh để dùng. Để cuộc sống người dân Việt Nam được nâng lên một tầm mới.
            
            ",
            'summary'=>"Công nghệ 4.0 đang ngày càng phát triển mạnh mẽ với nhiều nghiên cứu ứng dụng hữu ích trong thực tiễn cuộc sống của con người, đặc biệt trong lĩnh vực Smarthome. SMARTDEVICE liên tục mở rộng hệ thống đại lý của mình trên toàn quốc nhằm giúp khách hàng dễ  dàng tiếp cận với công nghệ và trang bị hệ thống thông minh cho ngôi nhà của mình.",
            'photo'=>"image.jpg",
            'logo'=>'logo.jpg',
            'address'=>"Số 123, đường Lĩnh Nam, phường Vĩnh Hưng,Hoàng Mai,Hà Nội",
            'email'=>"daotheanh962@gmail.com",
            'phone'=>"0377592469",
        );
        DB::table('settings')->insert($data);
    }
}
