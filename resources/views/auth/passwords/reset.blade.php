@extends('layouts.app')
@section('content')
<div class="login-box">
  <div class="login-logo">
    <a href="{{url('/')}}"><b>Sell</b>SWAP</a>
  </div>
  <div class="login-box-body">
    <p class="login-box-msg">Reset Password</p>
     <form method="POST" action="{{ route('password.request') }}">
                        @csrf
         <input type="hidden" name="token" value="{{ $token }}">
      <div class="form-group has-feedback">
           <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ $email or old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
         <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
     
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat"> {{ __('Login') }}</button>
        </div>
        <!-- /.col -->
      </div>
    </form>  

    <br>
   

  </div>
  <!-- /.login-box-body -->
</div>
@endsection
