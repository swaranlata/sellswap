<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sell Swap</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{{ URL::asset('public/css/bootstrap.min.css')}}">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ URL::asset('public/css/font-awesome.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('public/css/ionicons.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('public/css/dataTables.bootstrap.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('public/css/AdminLTE.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('public/css/_all-skins.min.css')}}">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    @include('admin.elements.header')
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
   @include('admin.elements.sidebar')
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('content')
  </div>  
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="{{ URL::asset('public/js/jquery.min.js')}}"></script>
<script src="{{ URL::asset('public/js/bootstrap.min.js')}}"></script>
<script src="{{ URL::asset('public/js/jquery.dataTables.min.js')}}"></script>
<script src="{{ URL::asset('public/js/dataTables.bootstrap.min.js')}}"></script>
<script src="{{ URL::asset('public/js/jquery.slimscroll.min.js')}}"></script>
<script src="{{ URL::asset('public/js/fastclick.js')}}"></script>
<script src="{{ URL::asset('public/js/adminlte.min.js')}}"></script>
<script src="{{ URL::asset('public/js/demo.js')}}"></script>
<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>
