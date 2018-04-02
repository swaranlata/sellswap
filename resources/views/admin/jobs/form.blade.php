<div class="form-group {{ $errors->has('category') ? 'has-error' : ''}}">
    <label for="category" class="col-md-4 control-label">{{ 'Category' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="category" type="number" id="category" value="{{ $job->category or ''}}" >
        {!! $errors->first('category', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('subcategory') ? 'has-error' : ''}}">
    <label for="subcategory" class="col-md-4 control-label">{{ 'Subcategory' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="subcategory" type="number" id="subcategory" value="{{ $job->subcategory or ''}}" >
        {!! $errors->first('subcategory', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
    <label for="title" class="col-md-4 control-label">{{ 'Title' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="title" type="text" id="title" value="{{ $job->title or ''}}" >
        {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('company_name') ? 'has-error' : ''}}">
    <label for="company_name" class="col-md-4 control-label">{{ 'Company Name' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="company_name" type="text" id="company_name" value="{{ $job->company_name or ''}}" >
        {!! $errors->first('company_name', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('job_type') ? 'has-error' : ''}}">
    <label for="job_type" class="col-md-4 control-label">{{ 'Job Type' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="job_type" type="text" id="job_type" value="{{ $job->job_type or ''}}" >
        {!! $errors->first('job_type', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('compensation') ? 'has-error' : ''}}">
    <label for="compensation" class="col-md-4 control-label">{{ 'Compensation' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="compensation" type="text" id="compensation" value="{{ $job->compensation or ''}}" >
        {!! $errors->first('compensation', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('location') ? 'has-error' : ''}}">
    <label for="location" class="col-md-4 control-label">{{ 'Location' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="location" type="text" id="location" value="{{ $job->location or ''}}" >
        {!! $errors->first('location', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('lat') ? 'has-error' : ''}}">
    <label for="lat" class="col-md-4 control-label">{{ 'Lat' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="lat" type="text" id="lat" value="{{ $job->lat or ''}}" >
        {!! $errors->first('lat', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('long') ? 'has-error' : ''}}">
    <label for="long" class="col-md-4 control-label">{{ 'Long' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="long" type="text" id="long" value="{{ $job->long or ''}}" >
        {!! $errors->first('long', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('description') ? 'has-error' : ''}}">
    <label for="description" class="col-md-4 control-label">{{ 'Description' }}</label>
    <div class="col-md-6">
        <textarea class="form-control" rows="5" name="description" type="textarea" id="description" >{{ $job->description or ''}}</textarea>
        {!! $errors->first('description', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('applied_link') ? 'has-error' : ''}}">
    <label for="applied_link" class="col-md-4 control-label">{{ 'Applied Link' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="applied_link" type="text" id="applied_link" value="{{ $job->applied_link or ''}}" >
        {!! $errors->first('applied_link', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('user_id') ? 'has-error' : ''}}">
    <label for="user_id" class="col-md-4 control-label">{{ 'User Id' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="user_id" type="number" id="user_id" value="{{ $job->user_id or ''}}" >
        {!! $errors->first('user_id', '<p class="help-block">:message</p>') !!}
    </div>
</div>

<div class="form-group">
    <div class="col-md-offset-4 col-md-4">
        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
    </div>
</div>
