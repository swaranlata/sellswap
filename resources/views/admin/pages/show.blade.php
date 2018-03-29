@extends('layouts.admin')

@section('content')

<section class="content-header">
  <h1>
  Page Management
   
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Page</a></li>
    <li class="active">View Page</li>
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
          <h3 class="box-title">View Page</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
         &nbsp; &nbsp;
           <a href="{{ url('/admin/pages') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
            <a href="{{ url('/admin/pages/' . $page->id . '/edit') }}" title="Edit Page"><button class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>

            <form method="POST" action="{{ url('admin/pages' . '/' . $page->id) }}" accept-charset="UTF-8" style="display:inline">
                {{ method_field('DELETE') }}
                {{ csrf_field() }}
                <button type="submit" class="btn btn-danger btn-sm" title="Delete Page" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i> </button>
            </form>
            <br/>
            <br/>
          <div class="box-body">
    <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
        <label for="title" class="">{{ 'Title' }}</label>
           <input required  disabled class="form-control" name="title" type="text" id="title" value="{{ $page->title or ''}}" >
            {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
    </div>
    <div class="form-group {{ $errors->has('description') ? 'has-error' : ''}}">
        <label for="description" class="">{{ 'Description' }}</label>
          <textarea disabled  required class="form-control" rows="5" name="description" type="textarea" id="description" >{{ $page->description or ''}}</textarea>
            {!! $errors->first('description', '<p class="help-block">:message</p>') !!}
    </div>
    <div class="form-group {{ $errors->has('slug') ? 'has-error' : ''}}">
        <label for="slug" class="">{{ 'Slug' }}</label>
           <input required  disabled  class="form-control" name="slug" type="text" id="slug" value="{{ $page->slug or ''}}" >
            {!! $errors->first('slug', '<p class="help-block">:message</p>') !!}
    </div>
</div>
<div class="box-footer">
     <a href="{{ url('/admin/pages') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
</div>



          
        
          
          
      </div>
      <!-- /.box -->  
    </div>
    <!--/.col (left) -->

  </div>
  <!-- /.row -->
</section>
@endsection
