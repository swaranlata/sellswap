<div class="box-body">
    <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
        <label for="exampleInputEmail1" >{{ 'Title' }}</label>
          <input class="form-control" required name="title" type="text" id="title" value="{{ $category->title or ''}}" >
            {!! $errors->first('title', '<p class="help-block">:message</p>') !!}

    </div>
    <div class="form-group {{ $errors->has('image') ? 'has-error' : ''}}">
        <label for="image">{{ 'Image' }}</label>
          <input required class="form-control" name="image" type="file" id="image" value="{{ $category->image or ''}}" >
        <?php 
        if(!empty($category->image)){
            ?>
        <a href="{{URL::asset('public/category/'.$category->image)}}" target="_blank"><img src="{{URL::asset('public/category/'.$category->image)}}" width="100px" height="100px"/></a>
        <?php
        }
        
        ?>
            {!! $errors->first('image', '<p class="help-block">:message</p>') !!}
    </div>      
    
</div>
<div class="box-footer">
    <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
     <a href="{{ url('/admin/categories') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
</div>