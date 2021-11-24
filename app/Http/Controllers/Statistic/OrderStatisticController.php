<?php

namespace App\Http\Controllers\Statistic;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $this->data['orders'] = Order::select( 'orders.quantity', 'products.price', 
                                                'orders.status','orders.total_amount', 
                                                'products.title',  'orders.order_number', 
                                                'orders.created_at', DB::raw("orders.status as status_qty"))
                                        // ->select(DB::raw('count(orders.status) as quantity', 'orders.status'))
								    	->join('products', 'orders.product_id', '=', 'products.id')
								    	->orderBy('orders.id', 'ASC')
                                        ->paginate(5);
        $pieChart = DB::select(DB::raw("select status, COUNT(status) as status_qty
                    from orders
                    group by orders.status
                    order by count(orders.status) DESC"));

        $value = [];
        foreach($pieChart as $row) {
            $value['label'][] = $row->status;
            $value['data'][] = (int) $row->status_qty;
        }
        $value['chart_data'] = json_encode($value);
 
    	return view('backend.statistics.order', $this->data, $value)->with('pieChart', $pieChart);
    }
}
