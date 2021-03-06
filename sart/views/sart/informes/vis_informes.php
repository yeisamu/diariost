<?php 
if(isset($grupov)){
 if($grupov){
   $valg=$grupov;
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

	<!-- BEGIN SHORTCUT AND TOUCH ICONS -->
	<link rel="shortcut icon" href="<?php echo base_url() ?>img/icons/favicon.ico">
	<link rel="apple-touch-icon" href="<?php echo base_url() ?>img/icons/apple-touch-icon.png">
	<!-- END SHORTCUT AND TOUCH ICONS -->
	<style type="text/css">
     .nav-tabs.tabs-active-text-indigo > li.active a, .nav-tabs.tabs-active-text-indigo > li.active a:hover, .nav-tabs.tabs-active-text-indigo > li.active a:active, .nav-tabs.tabs-active-text-indigo > li.active a:focus {
    		color: #3e50b4;
   			background-color: rgba(223, 219, 219, 0.54);
		}
	</style>
</head>
<body style="overflow:hidden">
<input type="hidden" value="<?php echo base_url() ?>" id="base_url">
<input type="hidden"  id="app_ID" value='<?php echo $app_ID ?>'>
	<div class="content" style="">
	    	<div class="page-header full-content header-tabs stickyx fixed bg-indigo" style="width: 100%;left: 40px">
			<div class="row">
				<div class="col-xs-10">
					<h1 style="font-size: 25px;">Informes<small></small></h1>
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
					<div class="panel-title"><h4>Gesti&oacute;n de informes</h4></div>
				</div><!--.panel-heading-->
				<div class="panel-body" style="position:relative">
				  <div class="form-content">
				 	<div class="form-group">
				 	   <div class="col-xs-12" style="border-bottom: 1px solid #f0f0f0;">
				 		 <h4 class="gray">Seleccione un filtro para aplicar al reporte</h4>
				 	  </div>
				 	</div>
				 	
				 	<div class="form-group">
				 		<!-- <label class="control-label col-md-3">Status</label> -->
				 		<div class="col-md-12">
				 			<div class="checkboxer checkboxer-indigo">
				 			 <div class="row">
				 			   <div class="col-md-2">
				 				<input type="checkbox" class="infocheck" value="fechalim" id="fechalim">
				 				<label for="fechalim">Fecha</label>
				 			   </div>
				 			   <div class="col-md-4">
				 				<div class="fecha_rep hide">
				 				 <div class="form-group">
                                  <label for="clase" class="col-sm-3 " style="padding-top: 7px;">Inicio</label>
				 					<div class="col-sm-4 divfecha input-group" >
				 					 <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
				 					 <div class="inputer inputer-indigo " style="margin-top:0px;">
				 					   <div class="input-wrapper">
				 					   <input type="text" readonly style="width: 200px" name="fechaini" id="fechaini" class="form-control bootstrap-daterangepicker-basicx" value="" />
				 					  </div>
				 					</div>   
				 					</div>
				 				</div>
				 			  </div>
				 			  </div>
				 			  <div class="col-md-4">
				 				<div class="fecha_rep hide">
				 				 <div class="form-group">
                                  <label for="clase" class="col-sm-3 " style="padding-top: 7px;">Fin</label>
				 					<div class="col-sm-4 divfechafin input-group" >
				 					 <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
				 					 <div class="inputer inputer-indigo " style="margin-top:0px;">
				 					   <div class="input-wrapper">
				 					   <input type="text" readonly style="width: 200px" name="fechafin" id="fechafin" class="form-control bootstrap-daterangepicker-basicx" value="" />
				 					  </div>
				 					</div>   
				 					</div>
				 				</div>
				 			  </div>
				 			  </div>
				 			 </div>
				 			</div><!--.checkbox-->
				 			<div class="checkboxer checkboxer-indigo ">
				 			  <div class="row">
				 			   <div class="col-md-2">
				 				<input type="checkbox" class="infocheck" value="movil" id="movil">
				 				<label for="movil">Movil</label>
				 			   </div>
				 			   <div class="col-md-4">
				 				<div class="movil_info hide">
				 				  <div class="form-group">
                                    <label for="clase" class="col-sm-3 " style="padding-top: 7px;">Movil</label>
				 					<div class="col-sm-4  input-group" >
				 					 <div class="inputer inputer-indigo " style="margin-top:0px;">
				 					   <div class="input-wrapper">
				 					   <input type="text"  style="width: 200px" name="movilrep" id="movilrep" class="form-control" value="" />
				 					  </div>
				 					 </div>   
				 					</div>
				 				   </div>
				 				</div>
				 			   </div>
				 			 </div>
				 			</div><!--.checkbox-->
				 			<?php if($grupov==''){ ?>
				 			<!--div class="checkboxer checkboxer-indigo ">
				 			  <div class="row">
				 			   <div class="col-md-2">
				 				<input type="checkbox" class="grupoinf" value="empresa" id="empresa">
				 				<label for="empresa">Empresa</label>
				 			   </div>
				 			   <div class="col-md-4">
				 				<div class="grupo_info hide">
				 				  <div class="form-group">
                                    <div class="form-group has-indigo" style="    margin: -10px;padding-left: 11px;">
                                      <div class="col-sm-12">
                                            <select class="selecter" name="grupo" id="grupo" data-style="btn-indigo" data-width="100%">
                                                 <option selected="selected" value="">Empresa</option>
                                             <?php 
                                               foreach ($grupo->result() as $datagrupo) {
                                             ?>
                                                 <option value="<?php echo $datagrupo->grupo ?>" <?php if(trim($grupov)==$datagrupo->grupo) echo'selected="selected"'?> > <?php echo $datagrupo->grupo ?></option>
                                            <?php
                                              }  
                                            ?>
                                           </select>
                                      </div>
                                    </div> 
				 				   </div>
				 				</div>
				 			   </div>
				 			 </div>
				 			</div><.checkbox-->
				 			<?php }else{ ?>
				 				<input type="hidden" name="grupo" id="grupo"  value="<?php echo $grupov?>">
				 			<?php } ?>
				 			<!--div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="cuadre" value="cuadre_caja">
				 				<label for="cuadre">Cuadre de caja</label>
				 			</div>
				 			<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="estado_cuenta" value="estado_cuenta">
				 				<label for="estado_cuenta">Estado de cuenta</label>
				 			</div>
				 			<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="estado_cuentafa" value="estado_cuentafa">
				 				<label for="estado_cuentafa">Estado de cuenta anterior</label>
				 			</div>
				 			<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="infotaller" value="taller" >
				 				<label for="infotaller">Ordenes de taller</label>
				 			</div>
				 			<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="diarios_movil" value="diarios_movil">
				 				<label for="diarios_movil">Diarios x movil</label>
				 			</div-->
							<?php if($panel){
									$permiso=$panel->row();
								  }
								if($permiso->group_name ==	'Central de Radio'){
								?>
							<div class="radioer radioer-indigo">
								<input type="radio" name="informe" class="tiporeport" id="suspendemovil" value="suspendemovil">
								<label for="suspendemovil">Moviles a suspender</label>
						    </div>
				 			<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="docs_vencidos" value="docs_vencidos">
				 				<label for="docs_vencidos">Documentos Vencidos</label>
				 			</div>
							 <?php }else{ ?>
							<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="docs_vencidos" value="docs_vencidos">
				 				<label for="docs_vencidos">Documentos Vencidos</label>
				 			</div>
							<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="simit" value="simit">
				 				<label for="simit">Reporte SIMIT</label>
				 			</div>
							<div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="histovehi" value="histovehi">
				 				<label for="histovehi">Historial vehiculos</label>
				 			</div>
							<div class="radioer radioer-indigo">
								<input type="radio" name="informe" class="tiporeport" id="histocondu" value="histocondu">
								<label for="histocondu">Historial Conductor</label>
						    </div>
							<div class="radioer radioer-indigo">
								<input type="radio" name="informe" class="tiporeport" id="suspendemovil" value="suspendemovil">
								<label for="suspendemovil">Moviles a suspender</label>
						    </div>
							<?php } ?>
							<!--div class="radioer radioer-indigo">
				 				<input type="radio" name="informe" class="tiporeport" id="desvinculados" value="desvinculados">
				 				<label for="desvinculados">Moviles Desvinculados</label>
				 			</div-->
				 		</div>
				 	</div><!--.form-group-->

				 		
		          </div><!--form content-->	
				</div><!--.panel-body-->
				<div class="modal-footer">
				      <button type="button" class="btn btn-flat btn-info btn-ripple hide grabando"><i class="fa fa-refresh fa-spin"></i> Generando...</button>
				      <button type="button" class="btn btn-flat btn-indigo btn-ripple genera_informe">Generar</button>

				</div>
			</div><!--.panel-->
		 </div><!--.col-md-12-->
		</div><!--.row-->
	</div><!--.content-->
	<button class="btn btn-default toastr-notify msgerror hide" data-toastr-close-others="true" data-toastr-type="error"
	data-toastr-notification="" data-toastr-position="toast-top-right"></button>
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
     <script>
		$(document).ready(function () {
			Pleasure.init();
			Layout.init();
	        var win_height = window.innerHeight;
	        var resta =win_height-300;
	        $('.panel-body').height(resta+'px');
		    $('.panel-body').perfectScrollbar({
	            wheelPropagation: false,
	            minScrollbarLength: 100,
	            useBothWheelAxes: false,
	            useKeyboard: true,
	            suppressScrollX: true
	        }); 
	        var data= $('.divfecha input').datepicker({
	            format: "mm/dd/yyyy",
	             language: "es",
	             autoclose: true
	         }).on('changeDate', function(ev) {
	            $(this).datepicker('hide');
	          }).data('datepicker');

	         var data2= $('.divfechafin input').datepicker({
	             format: "mm/dd/yyyy",
	              language: "es",
	              autoclose: true
	          }).on('changeDate', function(ev) {
	             $(this).datepicker('hide');
	           }).data('datepicker');
		  });  

	     $(window).resize(function() {
	      var win_height = window.innerHeight;
          var resta =win_height-300;
	      $('.panel-body').height(resta+'px');
	      $('.panel-body').perfectScrollbar('update');
	   });
	</script>
</body>
</html>
