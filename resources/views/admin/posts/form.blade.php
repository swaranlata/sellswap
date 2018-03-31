<div class="box-body">
    
<div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Title' }}</label>
    <input  required class="form-control" name="title" type="text" id="title" value="{{ $post->title or ''}}" >
        {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
</div>
    
<div class="form-group {{ $errors->has('description') ? 'has-error' : ''}}">
    <label for="content" class="">{{ 'Description' }}</label>
       <textarea required class="form-control" rows="5" name="description" type="textarea" id="description" >{{ $post->description or ''}}</textarea>
        {!! $errors->first('description', '<p class="help-block">:message</p>') !!}
   
</div>
<div class="form-group {{ $errors->has('category') ? 'has-error' : ''}}">
    <label for="category" class="">{{ 'Category' }}</label>
        <select required name="category" class="form-control" id="category" >
            <option value="">Select Category</option>
            <?php if(!empty($category)){
                    foreach($category as $k=>$v){
                        ?>
            <option value="<?php echo $v->id; ?>"><?php echo $v->title; ?></option>
                        <?php
                    }
                  }?>
    
        </select>
        {!! $errors->first('category', '<p class="help-block">:message</p>') !!}
    
</div>
<div class="form-group {{ $errors->has('subcategory') ? 'has-error' : ''}}">
    <label for="category" class="">{{ 'Subcategory' }}</label>
        <select  required name="subcategory" class="form-control" id="subcategory" >
            <option value="12">Select Subcategory</option>
        </select>
        {!! $errors->first('subcategory', '<p class="help-block">:message</p>') !!}
    
</div>
<div class="form-group {{ $errors->has('price') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Price' }}</label>
    <input required class="form-control" name="price" type="number" id="price" value="{{ $post->price or ''}}" >
        {!! $errors->first('price', '<p class="help-block">:message</p>') !!}
</div> 
<div class="form-group {{ $errors->has('location') ? 'has-error' : ''}}">
    <label for="location" class="">{{ 'Location' }}</label>
    <input required class="form-control" name="location" type="text" id="location" value="{{ $post->location or ''}}" >
        {!! $errors->first('location', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('youtube_link') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Youtube Link' }}</label>
    <input required class="form-control" name="youtube_link" type="text" id="price" value="{{ $post->youtube_link or ''}}" >
        {!! $errors->first('youtube_link', '<p class="help-block">:message</p>') !!}
</div> 
<div class="form-group {{ $errors->has('images') ? 'has-error' : ''}}">
    <label for="title" class="">{{ 'Images' }}</label>
    <input required class="form-control" multiple name="images[]" type="file" id="images" >
    <br>
                      <?php 
                      if(!empty($post->postimages)){
                         foreach($post->postimages as $kk=>$vv)
                         {
                           ?>
                      <a target="_blank" href="{{URL::asset('public'.$vv->images)}}">
                          <i class="fa fa-remove"></i><img src="{{URL::asset('/public/'.$vv->images)}}" height="100px"/></a>&nbsp;&nbsp;
                    <?php
                         } 
                      }
                      
                      ?>
    
    
        
</div> 
    
</div>
<div class="box-footer">

        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">


</div>
