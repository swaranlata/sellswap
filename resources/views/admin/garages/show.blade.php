@extends('layouts.admin')

@section('content')


<section class="content-header">
  <h1>
  Garage Management
   
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Garage</a></li>
    <li class="active">View Garage</li>
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
          <h3 class="box-title">View Garage</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
         &nbsp; &nbsp;
           <a href="{{ url('/admin/garages') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
            <a href="{{ url('/admin/garages/' . $garage->id . '/edit') }}" title="Edit Page"><button class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>

            <form method="POST" action="{{ url('admin/garages' . '/' . $garage->id) }}" accept-charset="UTF-8" style="display:inline">
                {{ method_field('DELETE') }}
                {{ csrf_field() }}
                <button type="submit" class="btn btn-danger btn-sm" title="Delete Garage" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i> </button>
            </form>
            <br/>
            <br/>
<div class="box-body">       
    <div class="form-group {{ $errors->has('name') ? 'has-error' : ''}}">
    <label for="name" class="">{{ 'Name' }}</label>
   
        <input class="form-control" required disabled name="name" type="text" id="name" value="{{ $garage->name or ''}}" >
        {!! $errors->first('name', '<p class="help-block">:message</p>') !!}
   
</div>
<div class="form-group {{ $errors->has('start_date') ? 'has-error' : ''}}">
    <label for="start_date" class="">{{ 'Start Date' }}</label>
   
        <input class="form-control" required disabled name="start_date" type="date" id="start_date" value="{{ $garage->start_date or ''}}" >
        {!! $errors->first('start_date', '<p class="help-block">:message</p>') !!}
  
</div>
<div class="form-group {{ $errors->has('end_date') ? 'has-error' : ''}}">
    <label for="end_date" class="">{{ 'End Date' }}</label>
      <input class="form-control" required disabled name="end_date" type="date" id="end_date" value="{{ $garage->end_date or ''}}" >
        {!! $errors->first('end_date', '<p class="help-block">:message</p>') !!}

</div>
    <div class="form-group {{ $errors->has('discount') ? 'has-error' : ''}}">
    <label for="discount" class="">{{ 'Discount' }}</label>
     <input class="form-control"  required disabled name="discount" type="text" id="discount" value="{{ $garage->discount or ''}}" >
        {!! $errors->first('discount', '<p class="help-block">:message</p>') !!}
    </div>
    <div class="form-group {{ $errors->has('location') ? 'has-error' : ''}}">
    <label for="location" class="">{{ 'Location' }}</label>
     <input class="form-control"  required disabled name="location" type="text" id="location" value="{{ $garage->location or ''}}" >
        {!! $errors->first('discount', '<p class="help-block">:message</p>') !!}
    </div>
    <input class="form-control"   name="lat" type="hidden" id="lat" value="{{ $garage->lat or ''}}" >
    <input class="form-control"   name="long" type="hidden" id="long" value="{{ $garage->long or ''}}" >
</div>




          
        
          
          
      </div>
      <!-- /.box -->  
    </div>
    <!--/.col (left) -->

  </div>
  <!-- /.row -->
</section>


@endsection
