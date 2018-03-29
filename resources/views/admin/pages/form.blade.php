<div class="box-body">
    <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
        <label for="title" class="">{{ 'Title' }}</label>
           <input required class="form-control" name="title" type="text" id="title" value="{{ $page->title or ''}}" >
            {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
    </div>
    <div class="form-group {{ $errors->has('description') ? 'has-error' : ''}}">
        <label for="description" class="">{{ 'Description' }}</label>
          <textarea required class="form-control" rows="5" name="description" type="textarea" id="description" >{{ $page->description or ''}}</textarea>
            {!! $errors->first('description', '<p class="help-block">:message</p>') !!}
    </div>
    <div class="form-group {{ $errors->has('slug') ? 'has-error' : ''}}">
        <label for="slug" class="">{{ 'Slug' }}</label>
           <input required class="form-control" name="slug" type="text" id="slug" value="{{ $page->slug or ''}}" >
            {!! $errors->first('slug', '<p class="help-block">:message</p>') !!}
    </div>
</div>
<div class="box-footer">
    <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
     <a href="{{ url('/admin/pages') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
</div>


