<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>S.A.R.T</title>

	<meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

	<!-- BEGIN CORE CSS -->
	<link rel="stylesheet" href="<?php echo base_url() ?>css/admin1.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>css/elements.css">
	<!-- END CORE CSS -->

	<!-- BEGIN PLUGINS CSS -->
	<link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-table/dist/bootstrap-table.min.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>plugins/scroll/css/perfect-scrollbar.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>css/plugins.css">
	<!-- END PLUGINS CSS -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/chosen/chosen.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/selectize/dist/css/selectize.bootstrap3.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/multiselect/css/multi-select.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/pnikolov-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/minicolors/jquery.minicolors.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/datepicker/css/datepicker.css">
	
	 <link rel="stylesheet" href="<?php echo base_url(); ?>plugins/datatables/media/css/jquery.dataTables.min.css">
	 <link rel="stylesheet" href="<?php echo base_url(); ?>plugins/datatables/themes/bootstrap/dataTables.bootstrap.css">
	 

	<!-- BEGIN SHORTCUT AND TOUCH ICONS -->
	<link rel="shortcut icon" href="<?php echo base_url() ?>img/icons/favicon.ico">
	<link rel="apple-touch-icon" href="<?php echo base_url() ?>img/icons/apple-touch-icon.png">
	<!-- END SHORTCUT AND TOUCH ICONS -->
</head>
<body style="overflow:auto">

   
<input type="hidden" value="<?php echo base_url() ?>" id="base_url">
 <div class="content" style="padding:0 5px 0 5px">
		<div class="page-header full-content header-tabs sticky fixed bg-indigo" style="width: 100%;left: 40px">
			<div class="row">
				<div class="col-xs-10">
					<h1 style="font-size: 25px;">Gesti&oacute;n Tarjetas de Control<small></small></h1>
				</div><!--.col-->
				<div class="col-xs-2 menu" data-grupo="<?php echo $valg ?>" style="cursor:pointer">
					<ol class="breadcrumb">
						<li><a href="#"><i class="ion-android-menu"></i></a></li>
						<li><a href="#">Men&uacute;</a></li>
					</ol>
				</div><!--.col-->
			</div><!--.row-->
		</div><!--.page-header-->
    <div class="row"  style="margin-top: 110px;">
      <div class="col-md-12">
        <div class="panel">
          <div class="panel-heading">
            <div class="panel-title"><h4>Conductores</h4></div>
          </div><!--.panel-heading-->
          <div class="panel-body">
            <div class="table-responsive">
              <table class="display" id="planpadre">
                <thead>
                  <tr>
                    <th>idcond</th>
                    <th>Documento</th>
                    <th>Nombre</th>
                    <th>Tel&eacute;fono</th>
                    <th>Documentos</th>
                    <th>Simit</th>
                    <th>Tarjeta</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div><!--.panel-body-->
        </div><!--.panel-->
      </div><!--.col-md-12-->
      <div class="col-md-12 capahijos">

      </div><!--.col-md-12-->
    </div><!--.row-->
  </div><!--.content-->

		<!-- BEGIN GLOBAL AND THEME VENDORS -->
	<script src="<?php echo base_url() ?>js/global-vendors.js"></script>
	<!-- END GLOBAL AND THEME VENDORS -->

	<!-- BEGIN PLUGINS AREA -->
	<!-- END PLUGINS AREA -->

	<!-- PLUGINS INITIALIZATION AND SETTINGS -->
	<script src="<?php echo base_url() ?>scripts/user-pages.js"></script>
	<!-- END PLUGINS INITIALIZATION AND SETTINGS -->

	<!-- PLEASURE Initializer perfect-scrollbar.css -->
	<script src="<?php echo base_url() ?>js/pleasure.js"></script>
	<!-- ADMIN 1 Layout Functions -->
	<script src="<?php echo base_url() ?>js/layout.js"></script>
	<script src="<?php echo base_url() ?>scripts/forms-select.js"></script>
	<script src="<?php echo base_url() ?>js/funciones.js"></script>
	<script src="<?php echo base_url() ?>plugins/modernizr/modernizr.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/scroll/js/perfect-scrollbar.jquery.js"></script>
	<script src="<?php echo base_url() ?>plugins/scroll/js/perfect-scrollbar.js"></script>
	<script src="<?php echo base_url() ?>plugins/chosen/chosen.jquery.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/selectize/dist/js/standalone/selectize.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/multiselect/js/jquery.multi-select.js"></script>
	<script src="<?php echo base_url() ?>plugins/quicksearch/dist/jquery.quicksearch.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/jquery.inputmask/dist/jquery.inputmask.bundle.js"></script>
	<script src="<?php echo base_url() ?>plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="<?php echo base_url() ?>plugins/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/datatables/themes/bootstrap/dataTables.bootstrap.js"></script>


     <script>
	$(document).ready(function () {
		Pleasure.init();
		Layout.init();
		$(document).ready(function () {
		 $('#planpadre').DataTable({
			"bProcessing": true,
			"bServerSide": true,
			"sAjaxSource": '<?php echo base_url() ?>sart.php/sistemasart/datatramita',
			"columnDefs": [
				{  targets: [0],visible: false},
				{  "width": "10%",targets: [1]},
				{  "width": "20%",targets: [2]},
				{  "width": "5%",targets: [3], visible:true },
				{  "width": "5%", targets: [4], visible: true,orderable:false},
				{  "width": "5%",targets: [5], visible: true,orderable:false},
				{  "width": "5%",targets: [6], orderable:false}
			], 
			"order": [[2, 'asc']],
			"createdRow": function ( row, data, index ) {
				row.setAttribute( 'data-iditem',data[0] );
				row.setAttribute( 'data-div','capahijos');
				row.setAttribute( 'data-status',data[6]);
				row.setAttribute( 'data-vars','' );
				row.setAttribute( 'data-ini','' );
			},
			"aLengthMenu": [
					[5,10,15,25,50,100,-1], 
					[5,10,15,25,50,100,"Todos"]
				], 
			"iDisplayLength": 5,
			 "language": {
				 "search":"Buscar",
				 "lengthMenu": "Mostar _MENU_ registros",
				 "zeroRecords": "Lo sentimos, no encontramos lo que estas buscando",
				 //"info": "Mostrando página _PAGE_ de _PAGES_",
				 "infoEmpty": "Registros no encontrados",
				 "sLoadingRecords": "Por favor espera - Cargando...",
				 "infoFiltered": "(Filtrado en _MAX_ registros totales)",
				 "scrollY":        "250px",
				 "scrollCollapse": true,
				 "sProcessing":     "Procesando...",
				 "paginate": {
					 "first":      "Primero",
					 "last":       "Ultimo",
					 "next":       "Sig",
					 "previous":   "Atras"
				 },
			  }
			});
		 $('#planpadre').on('click', '.muestrahijo', function(e) {
		   var div=$(this).data('div');
		   var iditem=$(this).data('iditem');
		   var status=$(this).data('data-status');
		   var control=$(this).data('vars');
		   var ini=$(this).data('ini');
		   $(this).addClass('table-success').siblings().removeClass('table-success');
		   $('#modal_medio').modal('show');
		   queue_load_all('global_medio',ini,'abreinicio');
		 }).on('click', '.abredocs', function(e){
			e.preventDefault();
			var control=$(this).parent().parent().data('iditem');
			console.log(control);
			//queue_load_all('capahijos','',control);
			return false;
		 }).on('click', '.finalizapadre', function(e){
			e.preventDefault();
			var id=$(this).data('id');
			var tipo=$(this).data('tipo');
			var mod=$(this).data('mod');
			var url=$('#base_url').val();
			$(this).html('<i class="fa fa-check-square"></i>');
			$.ajax({
			   url: url+'operacion/grabarfinpadre',
			   type: 'POST',
			   data: {},
			   dataType: 'json',
			   cache: false,
			   contentType: false,
			   processData: false
			}).done(function(data){
				if(data.validacion == 'ok'){ 
				  swal("Exito!!", data.msn, "success");
				  queue_load_all('principal','','tramitaplan'); 
				}else{
					swal("Atencion!!", data.msn, "error");
				}
			});
			return false;
		 });
	  });
	});
	</script>

</body>
</html>