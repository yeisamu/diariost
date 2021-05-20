<?php 
if($permisos){
	$acces=$permisos->row();
	$add=$acces->crear;
	$edit=$acces->editar;
	$leer=$acces->leer;
	$grupoUsr=$acces->id_group;
	$grupoName=$acces->group_name;
	if($grupoName=='Central de Radio'){
		$visibleField=',visible:false';
	}else{
		$visibleField='';
	}
}
if(isset($gfijo)){
 if($gfijo){
   $valg=$gfijo;
 }else{
   $valg="";	
 }
 
}else{
   $valg="";	
 }
?>

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
	 <link rel="stylesheet" href="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/css/jasny-bootstrap.min.css">
	<!-- BEGIN SHORTCUT AND TOUCH ICONS -->
	<link rel="shortcut icon" href="<?php echo base_url() ?>img/icons/favicon.ico">
	<link rel="apple-touch-icon" href="<?php echo base_url() ?>img/icons/apple-touch-icon.png">
	<!-- END SHORTCUT AND TOUCH ICONS -->
</head>
<body style="overflow:auto">
<input type="hidden" value="<?php echo base_url() ?>" id="base_url">
	<div class="content" style="padding:0 5px 0 5px">
	    	<div class="page-header full-content header-tabs stickyx fixed bg-indigo" style="width: 100%;left: 40px">
			<div class="row">
				<div class="col-xs-10">
					<h1 style="font-size: 25px;">Gesti&oacute;n Vehiculos & propietarios<small></small></h1>
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
            <div class="panel-title"><h4>Vehiculos</h4></div>
          </div><!--.panel-heading-->
          <div class="panel-body">
            <div class="table-responsive">
              <table class="display" id="moviltable">
                <thead>
                  <tr>
                    <th>Movil</th>
                    <th>Placa</th>
                    <th>Documento</th>
                    <th>Pripietario</th>
                    <th>Direcci&oacute;n</th>
                    <th>Tel&eacute;fono</th>
                    <th>Email</th>
                    <th>Admin</th>
                    <th>Tel. Admin</th>
					<th>Observaci&oacute;nes</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
			<?php if($add=='si'){ ?>
			<div style="position:fixed;bottom:30px;right:30px;z-index:100;">
                <a class="btn btn-floating btn-red show-on-hover ">
                    <i class="ion-android-arrow-up"></i>
                    <ul class="to-top">
                        <li  >
                        <i class="ion-android-person-add btn btn-floating btn-red abre_edit" 
                            style="margin-left: -7px !important;" data-toggle="modal"  
                            data-target="#edit_doc" data-vars="<?php echo base_url() ?>sart.php/sistemasart/editarprop?tipo=nuevo&menu=vehi">
                        </i>
                        </li>
                        <li  >
                        <i class="fa fa-taxi btn btn-floating btn-red abre_mod_global " data-capa='taxi_modal'
                            style="margin-left: -1px !important;padding: 10px;" data-toggle="modal"  
                            data-target="#modaltaxi" data-vars="<?php echo base_url() ?>sart.php/sistemasart/taximodal?tipo=nuevo&app_ID=<?php echo $app_ID; ?>">
                        </i>
                        </li>
                    </ul>
                </a>
			</div>
			<?php } ?>
          </div><!--.panel-body-->
        </div><!--.panel-->
      </div><!--.col-md-12-->
      <div class="col-md-12 capahijos">

      </div><!--.col-md-12-->
    </div><!--.row-->
  </div><!--.content-->
  <button class="btn btn-default toastr-notify hide grabaok" data-toastr-title="" data-toastr-type="success"
			data-toastr-notification="Solicitud grabada con Exito!!!!!" data-toastr-close-others="true"></button>
    <button class="btn btn-default toastr-notify grabaerror" data-toastr-close-others="true" data-toastr-type="error"
    data-toastr-notification="" data-toastr-position="toast-top-right"></button>
  <div class="modal fade full-scream" id="modaltaxi" style="overflow-y: hidden;" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content " id="taxi_modal" style="overflow:hidden"></div>
		</div>
  </div><!--.modal-->
  <div class="modal scale fade" id="modal_medio" tabindex="-1" role="dialog" aria-hidden="true">
       	<div class="modal-dialog modal-lg">
       		<div class="modal-content global_medio" id="global_medio">
       		</div><!--.modal-content-->
       	</div><!--.modal-dialog-->
  </div><!--.modal medio-->
  <div class="modal fade full-height from-left" id="edit_doc" tabindex="-1" role="dialog" aria-hidden="true">
	 <div class="modal-dialog">
      <div class="modal-content " id="edit_modal">
      </div>
     </div>
	</div><!--.modal-->
  <div class="modal scale fade" id="modal_lg" tabindex="-1" role="dialog" aria-hidden="true">
       	<div class="modal-dialog modal-lg">
       		<div class="modal-content global_lg" id="global_lg">
       		</div><!--.modal-content-->
       	</div><!--.modal-dialog-->
  </div><!--.modal large-->
  <div class="modal scale fade" id="modal_sm" tabindex="-1" role="dialog" aria-hidden="true">
       	<div class="modal-dialog modal-sm">
       		<div class="modal-content global_lg" id="global_sm">
       		</div><!--.modal-content-->
       	</div><!--.modal-dialog-->
  </div><!--.modal large-->
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
	<script src="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/js/jasny-bootstrap.min.js"></script>


     <script>
	$(document).ready(function () {
		<?php if(strpos($grupoName,'Secretaría') !== false){ ?>
          setInterval(function(){
			consultanotif();
		  }, 30000);
		  <?php } ?>
		Pleasure.init();
		Layout.init();
		$(document).ready(function () {
		 sart.tablamovil=$('#moviltable').DataTable({
			"bProcessing": true,
			"bServerSide": true,
			"sAjaxSource": '<?php echo base_url() ?>sart.php/sistemasart/datamovil',
			"columnDefs": [
				{  "width": "6%",targets: [0]},
				{  "width": "7%",targets: [1]},
				{  "width": "10%",targets: [2]<?php echo $visibleField;?>},
				{  "width": "10%",targets: [3], visible:true },
				{  "width": "10%", targets: [4], visible: true},
				{  "width": "10%",targets: [5], visible: true},
				{  "width": "7%",targets: [6]},
				{  "width": "10%",targets: [7]},
				{  "width": "10%",targets: [8]},
				{  "width": "20%",targets: [9]},
			], 
			"order": [[0, 'asc']],
			"createdRow": function ( row, data, index ) {
				row.setAttribute( 'data-iditem',data[0] );
				row.setAttribute( 'data-capa','taxi_modal');
				row.setAttribute( 'data-toggle','modal');
				row.setAttribute( 'data-target','#modaltaxi' );
				row.setAttribute( 'data-vars','<?php echo base_url() ?>sart.php/sistemasart/taximodal?tipo=edit&id_movil='+data[0]+'&app_ID=<?php echo $app_ID; ?>' );
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
		 $('#moviltable').on('click', '.editaC', function(e) {
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
			//console.log(control);
			$('#modal_medio').modal('show');
			queue_load_all('.global_medio','?id='+control,'gestionformato');
			return false;
		 }).on('click', '.abresimit', function(e){
			e.preventDefault();
			var control=$(this).parent().parent().data('iditem');
			//console.log(control);
			$('#modaltaxi').modal('show');
			queue_load_all('#taxi_modal','?id='+control,'ges_simit');
			return false;
		 }).on('click', '.abreGesTc', function(e){
			e.preventDefault();
			var control=$(this).parent().parent().data('iditem');
			//console.log(control);
			$('#modaltaxi').modal('show');
			queue_load_all('#taxi_modal','?id='+control,'gesTarjeta');
			return false;
		 });
	  });
	});
	</script>
</body>
</html>