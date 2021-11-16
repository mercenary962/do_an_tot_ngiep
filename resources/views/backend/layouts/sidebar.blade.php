<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{route('admin')}}">
    <img src="{{asset('backend/img/logo.gif')}}" width="50%" height="200%">
    <div class="sidebar-brand-text mx-3">Admin</div>
  </a>

  <!-- Divider -->
  <hr class="sidebar-divider my-0">


  <!-- Divider -->
  <hr class="sidebar-divider">

  <!-- Heading -->
  <div class="sidebar-heading">
      Banner
  </div>

  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
      <i class="fas fa-image"></i>
      <span>Banner</span>
    </a>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Tùy chọn:</h6>
        <a class="collapse-item" href="{{route('banner.index')}}">Banner</a>
        <a class="collapse-item" href="{{route('banner.create')}}">Thêm Banner</a>
      </div>
    </div>
  </li>
  <!-- Divider -->
  <hr class="sidebar-divider">
      <!-- Heading -->
      <div class="sidebar-heading">
          Mua hàng
      </div>

  <!-- Categories -->
  <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#categoryCollapse" aria-expanded="true" aria-controls="categoryCollapse">
        <i class="fas fa-sitemap"></i>
        <span>Danh mục sản phẩm</span>
      </a>
      <div id="categoryCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tùy chọn:</h6>
          <a class="collapse-item" href="{{route('category.index')}}">Danh mục sản phẩm</a>
          <a class="collapse-item" href="{{route('category.create')}}">Thêm Danh mục sản phẩm</a>
        </div>
      </div>
  </li>
  {{-- Products --}}
  <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#productCollapse" aria-expanded="true" aria-controls="productCollapse">
        <i class="fas fa-cubes"></i>
        <span>Sản phẩm</span>
      </a>
      <div id="productCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tùy chọn:</h6>
          <a class="collapse-item" href="{{route('product.index')}}">Sản phẩm</a>
          <a class="collapse-item" href="{{route('product.create')}}">Thêm Sản phẩm</a>
        </div>
      </div>
  </li>

  {{-- Brands --}}
  <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#brandCollapse" aria-expanded="true" aria-controls="brandCollapse">
        <i class="fas fa-table"></i>
        <span>Nhãn hiệu</span>
      </a>
      <div id="brandCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tùy chọn:</h6>
          <a class="collapse-item" href="{{route('brand.index')}}">Nhãn hiệu</a>
          <a class="collapse-item" href="{{route('brand.create')}}">Thêm Nhãn hiệu</a>
        </div>
      </div>
  </li>

  {{-- Shipping --}}
  <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#shippingCollapse" aria-expanded="true" aria-controls="shippingCollapse">
        <i class="fas fa-truck"></i>
        <span>Vận chuyển</span>
      </a>
      <div id="shippingCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tùy chọn:</h6>
          <a class="collapse-item" href="{{route('shipping.index')}}">Vận chuyển</a>
          <a class="collapse-item" href="{{route('shipping.create')}}">Thêm Vận chuyển</a>
        </div>
      </div>
  </li>

  <!--Orders -->
  <li class="nav-item">
      <a class="nav-link" href="{{route('order.index')}}">
          <i class="fas fa-hammer fa-chart-area"></i>
          <span>Đặt hàng</span>
      </a>
  </li>

  <!-- Reviews -->
  <li class="nav-item">
      <a class="nav-link" href="{{route('review.index')}}">
          <i class="fas fa-comments"></i>
          <span>Đánh giá</span></a>
  </li>

  <!--- Statistics -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#statisticCollapse" aria-expanded="true" aria-controls="statisticCollapse">
      <i class="fas fa-chart-bar"></i>
      <span>Thống kê</span></a>
      <div id="statisticCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tùy chọn:</h6>
          <a class="collapse-item" href="{{route('statistics.revenue')}}">Thống kê doanh thu</a>
          <a class="collapse-item" href="{{route('statistics.order')}}">Thống kê đơn hàng</a>
        </div>
      </div>
  </li>
  

  <!-- Divider -->
  <hr class="sidebar-divider">

  <!-- Heading -->
  <div class="sidebar-heading">
    Bài viết
  </div>

  <!-- Posts -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#postCollapse" aria-expanded="true" aria-controls="postCollapse">
      <i class="fas fa-fw fa-folder"></i>
      <span>Bài viết</span>
    </a>
    <div id="postCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Tùy chọn:</h6>
        <a class="collapse-item" href="{{route('post.index')}}">Bài viết</a>
        <a class="collapse-item" href="{{route('post.create')}}">Thêm Bài viết</a>
      </div>
    </div>
  </li>

   <!-- Category -->
   <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#postCategoryCollapse" aria-expanded="true" aria-controls="postCategoryCollapse">
        <i class="fas fa-sitemap fa-folder"></i>
        <span>Danh mục</span>
      </a>
      <div id="postCategoryCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tùy chọn:</h6>
          <a class="collapse-item" href="{{route('post-category.index')}}">Danh mục</a>
          <a class="collapse-item" href="{{route('post-category.create')}}">Thêm Danh mục</a>
        </div>
      </div>
    </li>

    <!-- Comments -->
    <li class="nav-item">
      <a class="nav-link" href="{{route('comment.index')}}">
          <i class="fas fa-comments fa-chart-area"></i>
          <span>Bình luận</span>
      </a>
    </li>


  <!-- Divider -->
  <hr class="sidebar-divider d-none d-md-block">
   <!-- Heading -->
  <div class="sidebar-heading">
      Cài đặt chung
  </div>
  <li class="nav-item">
    <a class="nav-link" href="{{route('coupon.index')}}">
        <i class="fas fa-table"></i>
        <span>Mã giảm giá</span></a>
  </li>
   <!-- Users -->
   <li class="nav-item">
      <a class="nav-link" href="{{route('users.index')}}">
          <i class="fas fa-users"></i>
          <span>Người dùng</span></a>
  </li>

  <!-- Sidebar Toggler (Sidebar) -->
  <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
  </div>

</ul>