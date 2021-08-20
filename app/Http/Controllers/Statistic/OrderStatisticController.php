<?php

namespace App\Http\Controllers\Statistic;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderStatisticController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->data['main_manu']    = 'Reports';
        $this->data['sub_manu']     = 'Orders';
    }

    public function index( Request $request )
    {
        $this->data['orders'] = Order::select( 'orders.quantity', 'products.price', 'orders.status','orders.total_amount', 'products.title',  'orders.order_number', 'orders.created_at')
								    	->join('products', 'orders.product_id', '=', 'products.id')
								    	->get();
 
    	return view('backend.statistics.order', $this->data);
    }
}
