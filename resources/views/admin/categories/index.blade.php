@extends('layouts.admin')

@section('content')
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Categories Management
       <!-- <small>advanced tables</small>-->
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Category</a></li>
      <!--  <li class="active">Data tables</li>-->
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">All Categories</h3>
                <a style="float:right;" href="{{ url('/admin/categories/create') }}" class="btn btn-success btn-sm" title="Add New Category">
                            <i class="fa fa-plus" aria-hidden="true"></i> Add New
                        </a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Sr.No</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                    @foreach($categories as $item)
                        <tr>
                            <td>{{ $loop->iteration or $item->id }}</td>
                            <td>{{ $item->title }}</td>
                            <td><a href="{{URL::asset('public/category/'.$item->image)}}" target="_blank"><img src="{{URL::asset('public/category/'.$item->image)}}" width="200px" /></a></td>
                            <td>
                                <a href="{{ url('/admin/categories/' . $item->id) }}" title="View Category"><button class="btn btn-info btn-sm"><i class="fa fa-eye" aria-hidden="true"></i> </button></a>
                                <a href="{{ url('/admin/categories/' . $item->id . '/edit') }}" title="Edit Category"><button class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button></a>

                                <form method="POST" action="{{ url('/admin/categories' . '/' . $item->id) }}" accept-charset="UTF-8" style="display:inline">
                                    {{ method_field('DELETE') }}
                                    {{ csrf_field() }}
                                    <button type="submit" class="btn btn-danger btn-sm" title="Delete Category" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                </form>
                              </td>
                        </tr>
                 @endforeach
              
                </tbody>
                <tfoot>
                <tr>
                  <th>Sr.No</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->







@endsection
