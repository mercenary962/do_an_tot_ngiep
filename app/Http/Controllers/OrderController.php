<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Shipping;
use App\Models\Product;
use App\User;
use \PDF;
use Illuminate\Support\Facades\Notification;
use Helper;
use Illuminate\Support\Str;
use App\Notifications\StatusNotification;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $product=null;
    public function __construct(Product $product){
        $this->product=$product;
    }

    public function index()
    {
        $orders=Order::orderBy('id','DESC')->paginate(10);
        return view('backend.order.index')->with('orders',$orders);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'first_name'=>'string|required',
            'last_name'=>'string|required',
            'address'=>'string|required',
            'notes'=>'string|nullable',
            'coupon'=>'nullable|numeric',
            'phone'=>'numeric|required',
            'email'=>'string|required'
        ]);
        // return $request->all();
        $product = Product::where('slug', $request->slug)->first();
        
        if(empty(Cart::where('user_id',auth()->user()->id)->where('order_id',null)->first())){
            request()->session()->flash('error','Không có sản phẩm nào trong giỏ hàng !');
            return back();
        }
        
        $order=new Order();
       
        $order_data=$request->all();
        $order_data['order_number']='SMD-'.strtoupper(Str::random(10));
        $order_data['user_id']=$request->user()->id;
        $order_data['product_id']=Cart::where('user_id', auth()->user()->id)->pluck('product_id')->first();
        $order_data['shipping_id']=$request->shipping;
        $shipping=Shipping::where('id',$order_data['shipping_id'])->pluck('price');
        $order_data['sub_total']=Helper::totalCartPrice();
        $order_data['quantity']=Helper::cartCount();
        if(session('coupon')){
            $order_data['coupon']=session('coupon')['value'];
        }
        if($request->shipping){
            if(session('coupon')){
                $order_data['total_amount']=Helper::totalCartPrice()+$shipping[0]-session('coupon')['value'];
            }
            else{
                $order_data['total_amount']=Helper::totalCartPrice()+$shipping[0];
            }
        }
        else{
            if(session('coupon')){
                $order_data['total_amount']=Helper::totalCartPrice()-session('coupon')['value'];
            }
            else{
                $order_data['total_amount']=Helper::totalCartPrice();
            }
        }
        // return $order_data['total_amount'];
        $order_data['status']="new";
        if(request('payment_method')=='vnpay'){
            $total_money = str_replace(',','', Helper::totalCartPrice());
            $order_data['payment_method']='vnpay';
            $order_data['payment_status']='paid';
            return view('frontend/pages/vnpay/index', compact('total_money'), $order_data);
        }
        else{
            $order_data['payment_method']='cod';
            $order_data['payment_status']='Unpaid';
        }
        $order->fill($order_data);
        $order->save();
        if($order)
        // dd($request->all());
        $users=User::where('role','admin')->first();
        $details=[
            'title'=>'Một đơn hàng mới đã được tạo',
            'actionURL'=>route('order.show',$order->id),
            'fas'=>'fa-file-alt'
        ];
        Notification::send($users, new StatusNotification($details));
        if(request('payment_method')=='vnpay'){
            return redirect()->route('payment')->with(['id'=>$order->id]);
        }
        else{
            session()->forget('cart');
            session()->forget('coupon');
        }
        Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);

        // dd($users);        
        request()->session()->flash('success','Đặt hàng thành công');
        return redirect()->route('home');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $order=Order::find($id);
        // return $order;
        return view('backend.order.show')->with('order',$order);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $order=Order::find($id);
        return view('backend.order.edit')->with('order',$order);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $order=Order::find($id);
        $this->validate($request,[
            'status'=>'required|in:new,process,delivered,cancel'
        ]);
        $data=$request->all();
        // return $request->status;
        if($request->status=='process' || $request->status=='delivered'){
            foreach($order->cart as $cart){
                $product=$cart->product;
                // return $product;
                $product->stock -=$cart->quantity;
                $product->save();
            }
        }
        if($request->status=='cancel'){
            foreach($order->cart as $cart){
                $product=$cart->product;
                // return $product;
                $product->stock +=$cart->quantity;
                $product->save();
            }
        }
        $status=$order->fill($data)->save();
        if($status){
            request()->session()->flash('success','Cập nhật đơn hàng thành công');
        }
        else{
            request()->session()->flash('error','Lỗi trong khi cập nhật đơn hàng');
        }
        return redirect()->route('order.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order=Order::find($id);
        if($order){
            $status=$order->delete();
            if($status){
                request()->session()->flash('success','Đơn hàng đã bị xóa');
            }
            else{
                request()->session()->flash('error','Không thể xóa đơn hàng');
            }
            return redirect()->route('order.index');
        }
        else{
            request()->session()->flash('error','Không tìm thấy đơn hàng');
            return redirect()->back();
        }
    }

    public function orderTrack(){
        return view('frontend.pages.order-track');
    }

    public function productTrackOrder(Request $request){
        // return $request->all();
        $order=Order::where('user_id',auth()->user()->id)->where('order_number',$request->order_number)->first();
        if($order){
            if($order->status=="new"){
            request()->session()->flash('success','Đơn hàng đang được xử lý');
            return redirect()->route('home');

            }
            elseif($order->status=="process"){
                request()->session()->flash('success','Đơn hàng đang được vận chuyển');
                return redirect()->route('home');
    
            }
            elseif($order->status=="delivered"){
                request()->session()->flash('success','Đã giao hàng thành công');
                return redirect()->route('home');
    
            }
            else{
                request()->session()->flash('error','Đơn hàng đã bị hủy. Hãy tiến hành mua hàng lại');
                return redirect()->route('home');
    
            }
        }
        else{
            request()->session()->flash('error','Mã đơn hàng không hợp lệ');
            return back();
        }
    }

    // PDF generate
    public function pdf(Request $request){
        $order=Order::getAllOrder($request->id);
        // return $order;
        $file_name=$order->order_number.'-'.$order->first_name.'.pdf';
        // return $file_name;
        $pdf=PDF::loadview('backend.order.pdf',compact('order'));
        return $pdf->download($file_name);
    }
    // Income chart
    public function incomeChart(Request $request){
        $year=\Carbon\Carbon::now()->year;
        // dd($year);
        $items=Order::with(['cart_info'])->whereYear('created_at',$year)->where('status','delivered')->get()
            ->groupBy(function($d){
                return \Carbon\Carbon::parse($d->created_at)->format('m');
            });
            // dd($items);
        $result=[];
        foreach($items as $month=>$item_collections){
            foreach($item_collections as $item){
                $amount=$item->cart_info->sum('amount');
                // dd($amount);
                $m=intval($month);
                // return $m;
                isset($result[$m]) ? $result[$m] += $amount :$result[$m]=$amount;
            }
        }
        $data=[];
        for($i=1; $i <=12; $i++){
            $monthName=date('F', mktime(0,0,0,$i,1));
            $data[$monthName] = (!empty($result[$i]))? number_format((float)($result[$i]), 2, '.', '') : 0.0;
        }
        return $data;
    }




    // VNPAY
    public function createPayment(Request $request){
        session(['cost_id' => $request->id]);
        session(['url_prev' => url()->previous()]);
        $vnp_TmnCode = env('VNP_TMN_CODE'); //Mã website tại VNPAY 
        $vnp_HashSecret = env('VNP_HASH_SECRET'); //Chuỗi bí mật
        $vnp_Url = env('VNP_URL');
        $vnp_Returnurl = route('vnpay.return');
        $vnp_TxnRef = date("YmdHis"); //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = "Thanh toán hóa đơn phí dich vụ";
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $request->input('amount') * 100;
        $vnp_Locale = 'vn';
        $vnp_IpAddr = request()->ip();

        $inputData = array(
            "vnp_Version" => "2.0.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
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

     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function returnPayment(Request $request){
     
        if($request->vnp_ResponseCode == "00") {
 
            $vnpayData = $request->all();

            dd($vnpayData);
    
        //     $cart = Cart::where('user_id',auth()->user()->id)->where('order_id',null)->get()->toArray();
        // // dd($cart);

        // $data = [];

        // $order = Order::with(['cart_info'])->where('order_id', null)->get();
        $order = new Order();
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
}
