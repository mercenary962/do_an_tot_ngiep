<?php

namespace App\Http\Controllers\Statistic;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;


class OrderReportController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->data['main_manu']    = 'Reports';
        $this->data['sub_manu']     = 'Orders';
    }

    public function index( Request $request )
    {
    	$this->data['start_date'] 	= $request->get('start_date', date('Y-m-d'));
    	$this->data['end_date'] 	= $request->get('end_date', date('Y-m-d'));

        $this->data['orders'] = Order::select( 'orders.quantity', 'products.price', 'orders.status','orders.total_amount', 'products.title',  'orders.order_number', 'orders.created_at')
								    	->join('products', 'orders.product_id', '=', 'products.id')
                                        ->where('orders.status','delivered')
								    	->whereBetween('orders.created_at', [ $this->data['start_date'], $this->data['end_date'] ])
								    	->get();

    	return view('backend.statistics.order', $this->data);
    }
}
