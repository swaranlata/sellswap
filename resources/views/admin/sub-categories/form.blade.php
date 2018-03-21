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
            <input class="form-control" name="category" type="number" id="category" value="{{ $subcategory->category or ''}}" >
            {!! $errors->first('category', '<p class="help-block">:message</p>') !!}

    </div>
    <div class="form-group {{ $errors->has('image') ? 'has-error' : ''}}">
        <label for="image" >{{ 'Image' }}</label>
            <input class="form-control" name="image" type="file" id="image" value="{{ $subcategory->image or ''}}" >
            {!! $errors->first('image', '<p class="help-block">:message</p>') !!}

    </div>
</div>
<div class="box-footer">
    <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
     <a href="{{ url('/admin/sub-categories') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
</div>






