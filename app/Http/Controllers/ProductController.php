<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Hash;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products=Product::getAllProduct();
        // return $products;
        return view('backend.product.index')->with('products',$products);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $brand=Brand::get();
        $category=Category::get();
        // return $category;
        return view('backend.product.create')->with('categories',$category)->with('brands',$brand);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request->all();
        $this->validate($request,[
            'title'=>'string|required',
            'summary'=>'string|required',
            'description'=>'string|nullable',
            'photo'=>'string|required',
            'stock'=>"required|numeric",
            'cat_id'=>'required|exists:categories,id',
            'brand_id'=>'nullable|exists:brands,id',
            // 'child_cat_id'=>'nullable|exists:categories,id',
            // 'is_featured'=>'sometimes|in:1',
            'status'=>'required|in:active,inactive',
            'price'=>'required|numeric',
            'discount'=>'nullable|numeric'
        ]);

        $data=$request->all();
        $slug=Str::slug($request->title);
        $count=Product::where('slug',$slug)->count();
        if($count>0){
            $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
        }
        $data['slug']=$slug;
        // $data['is_featured']=$request->input('is_featured',0);
    
        $status=Product::create($data);
        if($status){
            request()->session()->flash('success','Thêm sản phẩm thành công');
        }
        else{
            request()->session()->flash('error','Vui lòng thử lại!!');
        }
        return redirect()->route('product.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $brand=Brand::get();
        $product=Product::findOrFail($id);
        $category=Category::get();
        $items=Product::where('id',$id)->get();
        // return $items;
        return view('backend.product.edit')->with('product',$product)
                    ->with('brands',$brand)
                    ->with('categories',$category)->with('items',$items);
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
        $product=Product::findOrFail($id);
        $this->validate($request,[
            'title'=>'string|required',
            'summary'=>'string|required',
            'description'=>'string|nullable',
            'photo'=>'string|required',
            'stock'=>"required|numeric",
            'cat_id'=>'required|exists:categories,id',
            // 'child_cat_id'=>'nullable|exists:categories,id',
            // 'is_featured'=>'sometimes|in:1',
            'brand_id'=>'nullable|exists:brands,id',
            'status'=>'required|in:active,inactive',
            'price'=>'required|numeric',
            'discount'=>'nullable|numeric'
        ]);

        $data=$request->all();
        // $data['is_featured']=$request->input('is_featured',0);
        $status=$product->fill($data)->save();
        if($status){
            request()->session()->flash('success','Cập nhật sản phẩm thành công');
        }
        else{
            request()->session()->flash('error','Vui lòng thử lại!!');
        }
        return redirect()->route('product.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product=Product::findOrFail($id);
        $status=$product->delete();
        
        if($status){
            request()->session()->flash('success','Xóa sản phẩm thành công');
        }
        else{
            request()->session()->flash('error','Lỗi trong khi xóa sản phẩm');
        }
        return redirect()->route('product.index');
    }
}
