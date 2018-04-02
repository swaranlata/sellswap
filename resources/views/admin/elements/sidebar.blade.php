 <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img  style="height:46px !important" src="{{URL::asset('public/'.@Auth::user()->profileImage)}}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>{{ucfirst(Auth::user()->name)}}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            <br>
            <br>
        </div>
          <br>
            <br>
      </div>
     
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="">
          <a href="{{url('/admin')}}">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            
          </a>
          
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-barcode"></i>
            <span>Categories Management</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('admin/categories')}}"><i class="fa fa-circle-o"></i> Manage Categories</a></li>
            <li><a href="{{url('admin/categories/create')}}"><i class="fa fa-circle-o"></i> Add Category</a></li>
          
          </ul>
        </li>   
        <li class="treeview">
          <a href="#">
            <i class="fa fa-asterisk"></i>
            <span>Subcategories Management</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('admin/sub-categories')}}"><i class="fa fa-circle-o"></i> Manage Subategories</a></li>
            <li><a href="{{url('admin/sub-categories/create')}}"><i class="fa fa-circle-o"></i> Add Subcategory</a></li>
          
          </ul>
        </li> 
          
        <li class="treeview">
          <a href="#">
            <i class="fa fa-clone"></i>
            <span>Posts Management</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('admin/posts')}}"><i class="fa fa-circle-o"></i> Manage Posts</a></li>
            <li><a href="{{url('admin/posts/create')}}"><i class="fa fa-circle-o"></i> Add Post</a></li>
          
          </ul>
        </li>  
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>Pages Management</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('admin/pages')}}"><i class="fa fa-circle-o"></i> Manage Pages</a></li>
            <li><a href="{{url('admin/pages/create')}}"><i class="fa fa-circle-o"></i> Add Pages</a></li>
          
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-home"></i>
            <span>Garages Management</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('admin/garages')}}"><i class="fa fa-circle-o"></i> Manage Garages</a></li>
            <li><a href="{{url('admin/garages/create')}}"><i class="fa fa-circle-o"></i> Add Garage</a></li>
          
          </ul>
        </li>      
        <li class="header">LABELS</li>
        <li><a  href="{{ route('logout') }}" class="dropdown-item" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i class="fa fa-mail-forward"></i> <span>Logout</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->