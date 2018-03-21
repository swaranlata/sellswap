@extends('layouts.admin')

@section('content')

<section class="content-header">
  <h1>
  SubCategory Management
   
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Sub Category</a></li>
    <li class="active">View SubCategory</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <!-- left column -->
    <div class="col-md-9">
      <!-- general form elements -->
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">View Subcategory</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
         &nbsp; &nbsp; <a href="{{ url('/admin/sub-categories') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
                       <a href="{{ url('/admin/sub-categories/' . $subcategory->id . '/edit') }}" title="Edit SubCategory"><button class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>

                        <form method="POST" action="{{ url('admin/sub-categories' . '/' . $subcategory->id) }}" accept-charset="UTF-8" style="display:inline">
                            {{ method_field('DELETE') }}
                            {{ csrf_field() }}
                            <button type="submit" class="btn btn-danger btn-sm" title="Delete SubCategory" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </form>
                        <br/>
                        <br/>
        <form role="form" method="POST" action="{{ url('/admin/sub-categories/' . $subcategory->id) }}" accept-charset="UTF-8" enctype="multipart/form-data">
              <div class="box-body">
    <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
        <label for="exampleInputEmail1" >{{ 'Title' }}</label>
          <input disabled class="form-control" name="title" type="text" id="title" value="{{ $subcategory->title or ''}}" >
            {!! $errors->first('title', '<p class="help-block">:message</p>') !!}

    </div>
    <div class="form-group {{ $errors->has('content') ? 'has-error' : ''}}">
        <label for="content" >{{ 'Content' }}</label>
           <textarea disabled class="form-control" rows="5" name="content" type="textarea" id="content" >{{ $subcategory->content or ''}}</textarea>
            {!! $errors->first('content', '<p class="help-block">:message</p>') !!}

    </div>
    <div class="form-group {{ $errors->has('category') ? 'has-error' : ''}}">
        <label for="category" >{{ 'Category' }}</label>
        <input disabled class="form-control" name="title" type="text" id="title" value="{{ $subcategory->title or ''}}" >
    </div>
    
</div>
   
        </form>
      </div>
      <!-- /.box -->  
    </div>
    <!--/.col (left) -->

  </div>
  <!-- /.row -->
</section>   



@endsection
