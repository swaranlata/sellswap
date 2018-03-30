@extends('layouts.admin')

@section('content')

<section class="content-header">
  <h1>
  Garages Management
   
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Garages</a></li>
    <li class="active">Add Garage</li>
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
          <h3 class="box-title">Quick Edit Garage</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        @if ($errors->any())
              <ul class="alert alert-danger">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            @endif
            <form method="POST" action="{{ url('/admin/garages/' . $garage->id) }}" accept-charset="UTF-8" class="" enctype="multipart/form-data">
                {{ method_field('PATCH') }}
                {{ csrf_field() }}

                @include ('admin.garages.form', ['submitButtonText' => 'Update'])

          </form>
      </div>
      <!-- /.box -->  
    </div>
    <!--/.col (left) -->

  </div>
  <!-- /.row -->
</section>  

@endsection
