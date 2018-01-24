<?php 
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
</head>
<body style="overflow:hidden">

   
<input type="hidden" value="<?php echo base_url() ?>" id="base_url">
<input type="hidden"  id="search2">
<input type="hidden"  id="campo">
<input type="hidden"  id="filtrog" value='<?php echo $valg ?>'>
<input type="hidden" id="order" value="id_movil">
<input type="hidden" id="corder" value="id_movil">   
<input type="hidden" id="orderby" value="asc">
<input type="hidden" id="idapp" value="<?php echo $app_ID; ?>">
	<div class="content" style="padding:0 5px 0 5px">
	    	<div class="page-header full-content header-tabs sticky fixed bg-indigo" style="width: 100%;left: 40px">
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

			<table class="table col-md-12 table-borderedx margin_0 bck_table border_r_0 border_l_0 restar_divx" style="">
			    <thead>
			        <tr>
			            <td class="col-xs-6 border_r_0 border_b_0" style="border-left:none !important;">
			                <div class="nav_header">
			                    <i class="fa fa-list-alt"></i> Total  
			                    <span id="cant_doc" class="gray">(0) </span>
			                </div>
			            </td>
			            <td class="col-xs-6 border_l_0 border_b_0" style="padding:0px 20px 0px 0px">
			                 <div class="input-group">
			                 	<span class="input-group-addon"><i class="ion-search"></i></span>
			                 	<div class="inputer  inputer-indigo">
			                 		<div class="input-wrapper">
			                 			<input type="text" class="form-control" id="buscadoc" placeholder="Buscar">
			                 		    <span class="ion-android-close resetea form-control-feedback cursor hide">
			                 		    </span>
			                 		</div>
			                 	</div>
			                 </div>
			            </td>
			        </tr>
			    </thead>
			</table>
			<div class="element_hide restar_div">
			    <table class="table table-condensed col-md-12x margin_0 bck_table" style="font-size: 13px;">
			            <tr>
			               <th  width="4%" style="border-bottom: 1px solid #ddd;">
			               	<div class="col-md-12 orderby" data-div="#busqueda_list" 
                                 data-vars="?order=id_movil&tipo=list&app_ID=<?php echo $app_ID; ?>" data-control="listar_tabla"  data-value="id_movil" style="display: inline-table;cursor:pointer;">
								<span class="hidden-md hidden-sm" ><i class="fa fa-sort hidden-md hidden-sm"></i> Movil</span>
								<span class="visible-md visible-sm" >M</span>
							</div>
			               </th>
			               <th  width="6%" style="padding-left: 5px;border: 1px solid #ddd;">
			               	 <div class="col-md-12 popovertipodoc " data-toggle="popover" data-trigger="focus" data-popover-content="#a4"
			               	      data-placement="right" style="display: inline-table;cursor:pointer;">
								<span class="hidden-md hidden-sm" >Placa</span>
								<span class="visible-md visible-sm" >P</span>
							 </div>
			               </th>
			              <!--  <th  width="6%" style="padding-left: 5px;border: 1px solid #ddd;">
			               	<?php 

			               	  //if($valg==''){
			               	?>
							  <div class="col-md-12 popovermedio " data-toggle="popover" data-trigger="focus" data-popover-content="#a2"
			               	      data-placement="right" style="display: inline-table;cursor:pointer;">
								<span class="hidden-md hidden-sm" >Grupo</span>
								<span class="visible-md visible-sm" >G</span>
								<i class="fa fa-angle-down hidden-md hidden-sm" style="font-size: 15px;font-weight: 900;"></i>
							 </div>
							<?php 
							  //}else{
							?>  	
								<span class="hidden-md hidden-sm" >Grupo</span>
								<span class="visible-md visible-sm" >G</span>
							<?php 
							 // }

							?>
			               </th> -->
			               <th  width="8%" style="padding-left: 5px;border: 1px solid #ddd;">
			               	<span class="hidden-md hidden-sm" >Documento</span>
			               	<span class="visible-md visible-sm" >D</span>

			               </th>
			               <th  width="20%" style="padding-left: 5px;border: 1px solid #ddd;">
			               	 <div class="col-md-12 orderby" data-div="#busqueda_list" 
                                 data-vars="?order=nombre&tipo=list&app_ID=<?php echo $app_ID; ?>" data-control="listar_tabla"  data-value="nombre" style="display: inline-table;cursor:pointer;">
								<span class="" ><i class="fa fa-sort hidden-md  hidden-sm"></i> Propietario</span>
							 </div>
			               	</th>
			               <th  width="18%" style="padding-left: 5px;border: 1px solid #ddd;">
			               	  <div class="col-md-12 popoverorigen " data-toggle="popover" data-trigger="focus" data-popover-content="#a3"
			               	      data-placement="left" style="display: inline-table;cursor:pointer;">
								<span class="" >Direcci&oacute;n</span><!-- &nbsp;&nbsp;
								<i class="fa fa-angle-down " style="font-size: 15px;font-weight: 900;"></i> -->
							 </div>
			               </th>
			               <th  width="8%" style="padding-left: 5px;border: 1px solid #ddd;">
			               		<span class="hidden-md hidden-sm" >Tel&eacute;fono</span>
			               		<span class="visible-md visible-sm" >T</span>
			               	
			               </th>
			               <th  width="8%" style="padding-left: 5px;border: 1px solid #ddd;">Email</th>
			               <th  width="8%" style="padding-left: 5px;border: 1px solid #ddd;">Contrato</th>
			               <th  width="8%" style="padding-left: 5px;border: 1px solid #ddd;">
			               	<div class="col-md-12 orderby " data-div="#busqueda_list" 
                                 data-vars="?order=pago_hasta&tipo=list&app_ID=<?php echo $app_ID; ?>" data-control="listar_tabla"  data-value="pago_hasta" style="display: inline-table;cursor:pointer;">
								<span class="hidden-md hidden-sm" ><i class="fa fa-sort hidden-md hidden-sm"></i> Pago Hasta</span>
								<span class="visible-md visible-sm" >P. Hasta</span>

							</div>
			               </th>
			               <!--th  width="8%" style="padding-left: 5px;border: 1px solid #ddd;">Aprob&oacute;</th-->
			               <th  width="5%" style="padding-left: 5px;border-bottom: 1px solid #ddd;">
			               	<div class="col-md-12 orderby" data-div="#busqueda_list" 
                                 data-vars="?order=pago_hasta&tipo=list&app_ID=<?php echo $app_ID; ?>" data-control="listar_tabla"  data-value="pago_hasta" style="display: inline-table;cursor:pointer;">
								<span class="" ><i class="fa fa-sort hidden-md hidden-sm"></i> Mora</span>
							</div>
			               </th>
			               <!-- <th  width="1%" style="border-right: 1px solid #ddd;border-bottom: 1px solid #ddd;"></th> -->
			            </tr>
			    </table>
			</div>
			<div class="element_visible restar_div">
			    <table class="table table-condensed span12 table-bordered margin_0 bck_table">
			        <thead>
			            <tr style="border-bottom:none !important;">
			                <td style="border-bottom:none !important;"> Movil
			                    <i class="fa fa-angle-right gray"></i> Placa
			                    <i class="fa fa-angle-right gray"></i> Grupo 
			                    <i class="fa fa-angle-right gray"></i> Nombre
			                    <i class="fa fa-angle-right gray"></i> P. Hasta
			                    <i class="fa fa-angle-right gray"></i> Mora
			                </td>
			            </tr>
			        </thead>
			    </table>
			</div> 
			<div id="a2" class="hidden">
			    <div class="popover-heading">
			       <span class='nav_search_string titlepopover' style="font-size:13px">Seleccione Empresa</span>
			       <button class='close pull-right close_popover_medio' style='margin-top: 0px;font-size:22px'>× </button>
			    </div>
			    
			    <div class="popover-body" style="">
			      <div class="col-md-9x">
						<div class="list-group">
			    	<?php 
			    	if($grupo){
					   foreach ($grupo->result() as $grupo) {
					?>
						 <a href="#" class="list-group-item list-group-item-primary filter" 
						    data-id="<?php echo $grupo->grupo ?>" data-cpopover="popovermedio" data-campo="grupo"  data-tipo="filtro" style="font-size:12px;padding:10px 5px;">
						   <?php echo $grupo->grupo ?>
						 </a>
					<?php
					  }	
					 }
					?>
					 </div>
				   </div>
			    </div>
			</div>  

			<div id="a3" class="hidden">
			    <div class="popover-heading">
			       <span class='nav_search_string titlepopover' style="font-size:13px">Seleccione Origen</span>
			       <button class='close pull-right close_popover_origen' style='margin-top: 0px;font-size:22px'>× </button>
			    </div>
			    
			    <div class="popover-body" style="">
			      <div class="col-md-9x">
						<div class="list-group">
			    	<?php 
					   //foreach ($origen->result() as $dataorigen) {
					?>
						 <a href="#" class="list-group-item list-group-item-primary filter" 
						    data-id="<?php //echo $dataorigen->origen ?>" data-cpopover="popoverorigen" data-campo="origen"  data-tipo="filtro" style="font-size:12px;padding:10px 5px;">
						   <?php //echo $dataorigen->origen ?>
						 </a>
					<?php
					 // }	
					?>
					 </div>
				   </div>
			    </div>
			</div>

			<div id="a4" class="hidden">
			    <div class="popover-heading">
			       <span class='nav_search_string titlepopover' style="font-size:13px">Seleccione Tipo Doc.</span>
			       <button class='close pull-right close_popover_tipodoc' style='margin-top: 0px;font-size:22px'>× </button>
			    </div>
			    
			    <div class="popover-body" style="">
			      <div class="col-md-9x">
						<div class="list-group">
			    	<?php 
					  // foreach ($tipodoc->result() as $datatipodoc) {
					?>
						 <a href="#" class="list-group-item list-group-item-primary filter" 
						    data-id="<?php //echo $datatipodoc->tipo_doc ?>" data-cpopover="popovertipodoc" data-campo="tipo_doc.tipo_doc"  data-tipo="filtro" style="font-size:12px;padding:10px 5px;">
						   <?php //echo $datatipodoc->tipo_doc ?>
						 </a>
					<?php
					 // }	
					?>
					 </div>
				   </div>
			    </div>
			</div>
			<!-- =========================head tipodoc================== -->
			<!-- =========================body tipodoc================== -->
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
			<div class="scroll_inicio_busca scroll_div" data-class=".scroll_inicio_busca" style="position:relative">
			    <table class="table table-condensed bck_table margin_0 table-hover table_tr_selected" style="font-size: 12px;">
			     
			        <tbody id="busqueda_list">
			        </tbody>
			    </table>
			</div>
		   </div><!--.col-md-12-->
		</div><!--.row-->

		
	</div><!--.content-->
	<button class="btn btn-default toastr-notify hide grabaok" data-toastr-title="" data-toastr-type="success"
			data-toastr-notification="Solicitud grabada con Exito!!!!!" data-toastr-close-others="true"></button>
<!--     <button class="btn btn-default toastr-notify  grabaerror" data-toastr-title="" data-toastr-type="error"
    		data-toastr-notification="Error al grabar!!!!!"></button>  -->
    <button class="btn btn-default toastr-notify grabaerror" data-toastr-close-others="true" data-toastr-type="error"
    data-toastr-notification="" data-toastr-position="toast-top-right"></button>
	<div class="modal fade full-height from-right" id="panel-modal2" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Nueva Solicitud de Documento</h4>
				</div>
				<div class="modal-body">
				  <div class="row">
				  	<div class="col-md-12">

				  		<div class="panel">
				  			<div class="panel-body">
				  				<form action="#" class="form-horizontal" id="adddoc">
				  					<div class="form-content">
				  						<div class="form-group">
				  							<label class="control-label col-md-5">Nombre del documento</label>
				  							<div class="col-md-6">
				  								<div class="inputer inputer-green">
				  									<div class="input-wrapper">
				  										<input type="text"  name="ndoc" id="ndoc" class="form-control">
				  										<input type="hidden" name="id_proc" id="id_proc" value="<?php echo $id_proc ?>" >
				  									</div>
				  								</div>
				  							</div>
				  						</div><!--.form-group-->
				  						<div class="form-group">
				  							<label class="control-label col-md-5">Detalle</label>
				  							<div class="col-md-6">
				  								<div class="inputer inputer-green">
				  									<div class="input-wrapper">
				  										<textarea name="detallen" class="form-control"></textarea>
				  									</div>
				  								</div>
				  							</div>
				  						</div><!--.form-group-->
				  						<div class="form-group">
				  							<label class="control-label col-md-5">Solicitante</label>
				  							<div class="col-md-6">
				  								<div class="inputer inputer-green">
				  									<div class="input-wrapper">
				  										<input type="text" name="solicita" class="form-control">
				  									</div>
				  								</div>
				  							</div>
				  						</div><!--.form-group-->

				  					</div><!--.form-content-->
				  				</form>
				  			</div><!--.panel-body-->
				  		</div><!--.panel-->

				  	</div><!--.col-md-12-->
				  </div><!--.row-->	
				</div><!--.body modal-->	
				<div class="modal-footer">
					<button type="button" class="btn btn-flat btn-red btn-ripple cancelaform" data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-flat btn-green btn-ripple guardanuevo" >Grabar</button>
				</div>
			</div>
		</div>
	</div><!--.modal-->
	<div class="modal fade full-height from-left" id="edit_doc" tabindex="-1" role="dialog" aria-hidden="true">
	 <div class="modal-dialog">
      <div class="modal-content " id="edit_modal">
      </div>
     </div>
	</div><!--.modal-->
		<div class="modal fade full-height from-left" id="borrar_doc" tabindex="-1" role="dialog" aria-hidden="true">
		 <div class="modal-dialog">
	      <div class="modal-content " id="borrar_modal">
	      </div>
	     </div>
		</div><!--.modal-->	

	<div class="modal fade full-scream" id="modaltaxi" style="    overflow-y: hidden;" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content " id="taxi_modal" style="overflow=hidden">
      </div>
		</div>
	</div><!--.modal-->
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
		$("[data-toggle=popover]").popover({
        html : true,
        template: '<div class="popover popover_months_nivel_2"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content selector_proc" style="height: 100px;overflow-y: scroll;"></div></div>',
        content: function() {
          var content = $(this).attr("data-popover-content");
          return $(content).children(".popover-body").html();
        },
        title: function() {
          var title = $(this).attr("data-popover-content");
          return $(title).children(".popover-heading").html();
        } 
     });
	});
	</script>
	<script type="text/javascript">
        var win_height = window.innerHeight;
        var resta =win_height-195;
        //console.log(win_height);
       
        //console.log(resta);
        $('.scroll_inicio_busca').height(resta+'px');
	   $('.scroll_inicio_busca').perfectScrollbar({
           
            wheelPropagation: false,
            minScrollbarLength: 100,
            useBothWheelAxes: false,
            useKeyboard: true,
            suppressScrollX: true
        }); 
	    function queue_load_all(div,params,control){
		    $.ajax({
		        url: '<?php echo base_url() ?>sart.php/sistemasart/'+control+params,
		        type: "POST",
		        async: true,
		        cache: false,
		        success: function( result ) {
		            $(div).html(result);
		        }
		    });
		}
	   var order = $('#order').val();
       var orderby = $('#orderby').val();
		var vg=$('#filtrog').val();
		if(vg!=''){
			var parini='?grupo='+vg+'&order='+order+'&by='+orderby+'&app_ID=<?php echo $app_ID; ?>';
		}else{
			var parini='?order='+order+'&by='+orderby+'&app_ID=<?php echo $app_ID; ?>';
		}
        
       
	   queue_load_all('#busqueda_list',parini,'listar_tabla');

	   $('.scroll_inicio_busca').scroll(function() {
	       if($('.scroll_inicio_busca').is(':visible')){
	           
	           if($(this)[0].scrollHeight - $(this).scrollTop() == $(this).outerHeight()) {
	               if (parseFloat(sgcapp.page) >= parseFloat(sgcapp.pages)) {
	                   //========================+'&search='+$('#search_general').val()
	               }else{
	               	  if($('#search2').val()!=''){
	               	  	 var paramfi='&search2='+$('#search2').val()+'&campo='+$('#campo').val()+'&app_ID=<?php echo $app_ID; ?>';
	               	  }else{
	               	  	var paramfi="";
	               	  }
	               	  if($('#buscadoc').val()!=''){
	               	  	 var paramfound='&search='+$('#buscadoc').val()+'&app_ID=<?php echo $app_ID; ?>';
	               	  }else{
	               	  	var paramfound="";
	               	  }
	               	  var vg=$('#filtrog').val();
	               	  if(vg!=''){
	               	  	var parini='&grupo='+vg;
	               	  }else{
	               	  	var parini='';
	               	  }
	               	  var order = $('#order').val();
                      var orderby = $('#orderby').val();
	                   sgcapp.page = parseFloat(sgcapp.page) + 1;
	                   var params = '<?php echo base_url() ?>sart.php/sistemasart/listar_tabla?page='+sgcapp.page+paramfi+parini+'&order='+order+'&by='+orderby+paramfound+'&tipo=list'+'&app_ID=<?php echo $app_ID; ?>';
	                   $.ajax({
	                       url: params,
	                       type: "POST",
	                       async: true,
	                       cache: false,
	                       success: function( result ) {
	                           $('#busqueda_list').append(result);
	                       }
	                   });
	               }
	           }
	       }
	   });
	     $(window).resize(function() {
	      var win_height = window.innerHeight;
          var resta =win_height-195;
	      $('.scroll_inicio_busca').height(resta+'px');
	      $('.scroll_inicio_busca').perfectScrollbar('update');
	   });
	</script>
</body>
</html>