<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Shipping;
use App\Models\Payment;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\DB;
use App\Notifications\StatusNotification;
use App\User;
use Illuminate\Support\Str;
use Helper;
class PaymentController extends Controller
{
    public function payment(Request $request){
        session(['cost_id' => $request->id]);
        session(['url_prev' => url()->previous()]);
        $vnp_TmnCode = env('VNP_TMN_CODE'); //Mã website tại VNPAY 
        $vnp_HashSecret = env('VNP_HASH_SECRET'); //Chuỗi bí mật
        $vnp_Url = env('VNP_URL');
        $vnp_Returnurl = route('payment.success');
        $vnp_TxnRef = date("YmdHis"); //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = "Thanh toán hóa đơn phí dich vụ";
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $request->input('amount') * 100;
        $vnp_FirstName = $request->input('first_name');
        $vnp_LastName = $request->input('last_name') * 100;
        $vnp_Email = $request->input('email');
        $vnp_PhoneNumber = $request->input('phone');
        $vnp_Address = $request->input('address');
        $vnp_Locale = 'vn';
        $vnp_IpAddr = request()->ip();

        $inputData = array(
            "vnp_Version" => "2.0.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_FirstName" => $vnp_FirstName,
            "vnp_LastName" => $vnp_LastName,
            "vnp_Email" => $vnp_Email,
            "vnp_PhoneNumber" => $vnp_PhoneNumber,
            "vnp_Address" => $vnp_Address,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . $key . "=" . $value;
            } else {
                $hashdata .= $key . "=" . $value;
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
           // $vnpSecureHash = md5($vnp_HashSecret . $hashdata);
            $vnpSecureHash = hash('sha256', $vnp_HashSecret . $hashdata);
            $vnp_Url .= 'vnp_SecureHashType=SHA256&vnp_SecureHash=' . $vnpSecureHash;
        }
        return redirect($vnp_Url);
    }

   
    public function success(Request $request){
     
        if($request->vnp_ResponseCode == "00") {
 
            $vnpayData = $request->all();
    
            $order = new Order();
            // dd($order);
             $order_data=$request->all();
 
        // $order_data['first_name']='Hennry';
        // $order_data['last_name']='Jones';
        // $order_data['address']='Dong Xuan';
        // $order_data['notes']='very good';
        // $order_data['phone']='098765543';
        // $order_data['email']='daotheanh962@gmail.com';
        // $order_data['city']='Ha Noi';
        // $order_data['order_number']='SMD-'.strtoupper(Str::random(10));
        // $order_data['product_id']=Cart::where('user_id', auth()->user()->id)->pluck('product_id')->first();
        // $order_data['user_id']=$request->user()->id;
        // $order_data['shipping_id']=$request->shipping;
        // $shipping=Shipping::where('id',$order_data['shipping_id'])->pluck('price');
        // // return session('coupon')['value'];
        // $order_data['sub_total']=Helper::totalCartPrice();
        // $order_data['quantity']=Helper::cartCount();
        // if(session('coupon')){
        //     $order_data['coupon']=session('coupon')['value'];
        // }
        // if($request->shipping){
        //     if(session('coupon')){
        //         $order_data['total_amount']=Helper::totalCartPrice()+$shipping[0]-session('coupon')['value'];
        //     }
        //     else{
        //         $order_data['total_amount']=Helper::totalCartPrice()+$shipping[0];
        //     }
        // }
        // else{
        //     if(session('coupon')){
        //         $order_data['total_amount']=Helper::totalCartPrice()-session('coupon')['value'];
        //     }
        //     else{
        //         $order_data['total_amount']=Helper::totalCartPrice();
        //     }
        // }
        // // return $order_data['total_amount'];
        // $order_data['status']="new";
 
        // $order_data['payment_method']='vnpay';
        // $order_data['payment_status']='paid';

        // $order->fill($order_data);
        // $status=$order->save();
        // if($order)
        // $users=User::where('role','admin')->first();
        // $details=[
        //     'title'=>'Một đơn hàng mới đã được tạo',
        //     'actionURL'=>route('order.show',$order->id),
        //     'fas'=>'fa-file-alt'
        // ];
        // Notification::send($users, new StatusNotification($details));
        // if(request('payment_method')=='vnpay'){
        //     return redirect()->route('cart.order')->with(['id'=>$order->id]);
        // }
        // else{
        //     session()->forget('cart');
        //     session()->forget('coupon');
        // }
        // Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);
 
        // request()->session()->flash('success','Đặt hàng thành công');
        dd($order->toArray());
            foreach($order as $item){
                $dataPayment = [
                    'order_id' => $item->id,
                    'vnp_transaction_code' => $vnpayData['vnp_TxnRef'],
                    'user_id' => $item->user_id,
                    'money' => $item->total_amount,
                    'notes' => $vnpayData['vnp_OrderInfo'],
                    'vpn_response_code' => $vnpayData['vnp_ResponseCode'],
                    'code_vnpay' => $vnpayData['vnp_TransactionNo'],
                    'code_bank' => $vnpayData['vnp_BankCode'],
                    'time' => date('Y-m-h H:i', strtotime($vnpayData['vnp_PayDate'])),
                ];
            // $payment->fill($dataPayment);
            // $payment->save();
                DB::table('payments')->insert($dataPayment);
            }
            request()->session()->flash('success' ,'Đã thanh toán phí dịch vụ');
            return view('frontend/pages/vnpay/vnpay_return', compact('vnpayData'));
        }
        // session()->forget('url_prev');
        request()->session()->flash('errors' ,'Lỗi trong quá trình thanh toán phí dịch vụ');
        return redirect('home');

    }
        // $order = new Order();
        
}
