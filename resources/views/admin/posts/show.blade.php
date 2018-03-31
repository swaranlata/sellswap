@extends('layouts.admin')

@section('content')

<section class="content-header">
  <h1>
  Posts Management
   
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Posts</a></li>
    <li class="active">View Post</li>
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
          <h3 class="box-title">View Post</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
          <?php
          /*echo '<pre>';
          print_r($post->postimages);
          die;*/
          
          ?>
         &nbsp; &nbsp;<a href="{{ url('/admin/posts') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
                        <a href="{{ url('/admin/posts/' . $post->id . '/edit') }}" title="Edit Post"><button class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>

                        <form method="POST" action="{{ url('admin/posts' . '/' . $post->id) }}" accept-charset="UTF-8" style="display:inline">
                            {{ method_field('DELETE') }}
                            {{ csrf_field() }}
                            <button type="submit" class="btn btn-danger btn-sm" title="Delete Post" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </form>
                        <br/>
                        <br/>
        <form role="form" method="POST" action="{{ url('/admin/sub-categories/' . $post->id) }}" accept-charset="UTF-8" enctype="multipart/form-data">
              <div class="box-body">
   
                    
<div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Title' }}</label>
    <input  required disabled class="form-control" name="title" type="text" id="title" value="{{ $post->title or ''}}" >
        {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
</div>
    
<div class="form-group {{ $errors->has('description') ? 'has-error' : ''}}">
    <label for="content" class="">{{ 'Description' }}</label>
       <textarea required disabled class="form-control" rows="5" name="description" type="textarea" id="description" >{{ $post->description or ''}}</textarea>
        {!! $errors->first('description', '<p class="help-block">:message</p>') !!}
   
</div>
<div class="form-group {{ $errors->has('category') ? 'has-error' : ''}}">
    <label for="category" class="">{{ 'Category' }}</label>
        <select required disabled name="category" class="form-control" id="category" >
            <option value=""><?php echo $post->mysubcategory->title; ?></option>
            
    
        </select>
        {!! $errors->first('category', '<p class="help-block">:message</p>') !!}
    
</div>
<div class="form-group {{ $errors->has('subcategory') ? 'has-error' : ''}}">
    <label for="category" class="">{{ 'Subcategory' }}</label>
        <select  required disabled name="subcategory" class="form-control" id="subcategory" >
            <option value="12"><?php echo $post->mysubcategory->title; ?></option>
        </select>
        {!! $errors->first('subcategory', '<p class="help-block">:message</p>') !!}
    
</div>
<div class="form-group {{ $errors->has('price') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Price' }}</label>
    <input required disabled class="form-control" name="price" type="number" id="price" value="{{ $post->price or ''}}" >
        {!! $errors->first('price', '<p class="help-block">:message</p>') !!}
</div> 
<div class="form-group {{ $errors->has('location') ? 'has-error' : ''}}">
    <label for="location" class="">{{ 'Location' }}</label>
    <input required disabled class="form-control" name="location" type="text" id="location" value="{{ $post->location or ''}}" >
        {!! $errors->first('location', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('youtube_link') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Youtube Link' }}</label>
    <input required disabled class="form-control" name="youtube_link" type="text" id="price" value="{{ $post->youtube_link or ''}}" >
        {!! $errors->first('youtube_link', '<p class="help-block">:message</p>') !!}
</div>
                  <div class="form-group {{ $errors->has('youtube_link') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Images' }}</label>
                      <br>
                      <?php 
                      if(!empty($post->postimages)){
                         foreach($post->postimages as $kk=>$vv)
                         {
                           ?>
                      <a target="_blank" href="{{URL::asset('public'.$vv->images)}}"><img src="{{URL::asset('/public/'.$vv->images)}}" height="100px"/></a>&nbsp;&nbsp;
                    <?php
                         } 
                      }
                      
                      ?>

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
