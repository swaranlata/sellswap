<div class="box-body">       
    <div class="form-group {{ $errors->has('name') ? 'has-error' : ''}}">
    <label for="name" class="">{{ 'Name' }}</label>
   
        <input class="form-control" required name="name" type="text" id="name" value="{{ $garage->name or ''}}" >
        {!! $errors->first('name', '<p class="help-block">:message</p>') !!}
   
</div>
<div class="form-group {{ $errors->has('start_date') ? 'has-error' : ''}}">
    <label for="start_date" class="">{{ 'Start Date' }}</label>
   
        <input class="form-control" required name="start_date" type="date" id="start_date" value="{{ $garage->start_date or ''}}" >
        {!! $errors->first('start_date', '<p class="help-block">:message</p>') !!}
  
</div>
<div class="form-group {{ $errors->has('end_date') ? 'has-error' : ''}}">
    <label for="end_date" class="">{{ 'End Date' }}</label>
      <input class="form-control" required name="end_date" type="date" id="end_date" value="{{ $garage->end_date or ''}}" >
        {!! $errors->first('end_date', '<p class="help-block">:message</p>') !!}

</div>
    <div class="form-group {{ $errors->has('discount') ? 'has-error' : ''}}">
    <label for="discount" class="">{{ 'Discount' }}</label>
     <input class="form-control"  required name="discount" type="text" id="discount" value="{{ $garage->discount or ''}}" >
        {!! $errors->first('discount', '<p class="help-block">:message</p>') !!}
    </div>
    <div class="form-group {{ $errors->has('location') ? 'has-error' : ''}}">
    <label for="location" class="">{{ 'Location' }}</label>
     <input class="form-control"  required name="location" type="text" id="location" value="{{ $garage->location or ''}}" >
        {!! $errors->first('discount', '<p class="help-block">:message</p>') !!}
    </div>
    <input class="form-control"   name="lat" type="hidden" id="lat" value="{{ $garage->lat or ''}}" >
    <input class="form-control"   name="long" type="hidden" id="long" value="{{ $garage->long or ''}}" >
</div>
<div class="box-footer">

        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">

</div>
