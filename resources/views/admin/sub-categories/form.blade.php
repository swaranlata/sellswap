<div class="box-body">
    <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
        <label for="exampleInputEmail1" >{{ 'Title' }}</label>
          <input class="form-control" name="title" type="text" id="title" value="{{ $subcategory->title or ''}}" >
            {!! $errors->first('title', '<p class="help-block">:message</p>') !!}

    </div>
    <div class="form-group {{ $errors->has('content') ? 'has-error' : ''}}">
        <label for="content" >{{ 'Content' }}</label>
           <textarea class="form-control" rows="5" name="content" type="textarea" id="content" >{{ $subcategory->content or ''}}</textarea>
            {!! $errors->first('content', '<p class="help-block">:message</p>') !!}

    </div>
    <div class="form-group {{ $errors->has('category') ? 'has-error' : ''}}">
        <label for="category" >{{ 'Category' }}</label>
       
            <select class="form-control"  name="category">
                <option value="">Select</option>
                 <?php if(!empty($categories)){
                        foreach($categories as $k=>$v){
                            $selected='';
                            if($v->id==$subcategory->category){
                              $selected='selected';  
                            }
                            ?>
                            <option {{$selected}} value="{{$v->id}}">{{$v->title}}</option>
                          <?php
                        }
            } ?>                
            </select>
            {!! $errors->first('category', '<p class="help-block">:message</p>') !!}

    </div>
    
</div>
<div class="box-footer">
    <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
     <a href="{{ url('/admin/sub-categories') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
</div>






