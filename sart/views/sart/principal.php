<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if(isset($grupo)){
  $filtrog=$grupo;
}else{
  $filtrog='*';
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
	<link rel="stylesheet" href="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/css/jasny-bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>css/plugins.css">
		
	<link rel="stylesheet" href="<?php echo base_url(); ?>plugins/datatables/media/css/jquery.dataTables.min.css">
	 <link rel="stylesheet" href="<?php echo base_url(); ?>plugins/datatables/themes/bootstrap/dataTables.bootstrap.css">
	 <link rel="stylesheet" href="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/css/jasny-bootstrap.min.css">

	<!-- END PLUGINS CSS -->

	<!-- BEGIN SHORTCUT AND TOUCH ICONS -->
	<link rel="shortcut icon" href="<?php echo base_url() ?>img/icons/favicon.ico">
	<link rel="apple-touch-icon" href="<?php echo base_url() ?>img/icons/apple-touch-icon.png">
	<!-- END SHORTCUT AND TOUCH ICONS -->
</head>
<body>
<?php echo $notif;?>
   
<input type="hidden" value="<?php echo base_url() ?>" id="base_url">
	<div class="content user_ID">
	    	<div class="page-header full-content header-tabs stickyx fixed bg-indigo" style="width: 100%;left: 40px;">
			<div class="row">
				<div class="col-xs-10">
					<h1 style="font-size: 25px;">Sistema De Gesti&oacute;n <small></small></h1>
				</div><!--.col-->
				<div class="col-xs-2 " style="cursor:pointer">
					<ol class="breadcrumb">
					<?php //if(trim($notif == 0)){ ?>
					    <li><a href="#" class="abre_mod_global docsvencidos" data-capa='global_lg'  data-toggle="modal"  data-target="#modal_lg"   data-vars="<?php echo base_url() ?>sart.php/sistemasart/docsvencidos"><i class="glyphicon glyphicon-bell"></i></a>
						</li>
						<?php //} ?>
						<li><a href="#" class='sign_out'><i class="glyphicon glyphicon-off"></i></a></li>
						<li><a href="#" class='sign_out'>Salir</a></li>
					</ol>
				</div><!--.col-->
			</div><!--.row-->
		</div><!--.page-header-->

		<div class="row" style="margin-top: 130px;">
		 <?php
		  if($panel){
		  	foreach ($panel->result() as $apps) {
		  	   //  echo $detalle->codigo
				 $grupoName=$apps->group_name;
		   
		  ?>
			<div class="col-md-4">
				<div class="card card-user <?php echo $apps->clase; ?> entrapanel" data-url="<?php echo $apps->path; ?>"
				     data-filterg="<?php echo $filtrog; ?>" data-idapp="<?php echo $apps->id_opcion; ?>">

					<div class="card-heading heading-left">
						<img src="<?php echo base_url() ?>img/faces/<?php echo $apps->img; ?>" style="background-color: gray;" alt="" class="user-image">
						<h3 class="card-title text-color-white"><?php echo $apps->opcion; ?></h3>
						<!--<div class="subhead">Designer at <a href="#">TeamFox</a></div>.card-heading-->
					</div>

					<div class="card-body">
						<p><?php echo $apps->descripcion; ?></p>
					</div><!--.card-body-->
				</div><!--.card-->
			</div><!--.col-md-4-->
			<?php
		     }
		   }else{
		   	?>
		   	  <div class="card-body">
			    <p>No tiene Opciones asignadas.</p>
			  </div><!--.card-body-->

		   	<?php
		   }
			 ?>
		</div><!--.row-->

	</div><!--.content-->
	<button class="btn btn-default toastr-notify hide grabaok" data-toastr-title="" data-toastr-type="success"
			data-toastr-notification="Solicitud grabada con Exito!!!!!" data-toastr-close-others="true">
	</button>
    <button class="btn btn-default toastr-notify grabaerror" data-toastr-close-others="true" data-toastr-type="error" data-toastr-notification="" data-toastr-position="toast-top-right"></button>
	<div class="modal scale fade" id="modal_lg" tabindex="-1" role="dialog" aria-hidden="true">
       	<div class="modal-dialog modal-lg">
       		<div class="modal-content global_lg" id="global_lg">
       		</div><!--.modal-content-->
       	</div><!--.modal-dialog-->
  </div><!--.modal large-->
  <div class="modal scale fade" id="modal_medio" tabindex="-1" role="dialog" aria-hidden="true">
       	<div class="modal-dialog modal-lg">
       		<div class="modal-content global_medio" id="global_medio">
       		</div><!--.modal-content-->
       	</div><!--.modal-dialog-->
  </div><!--.modal medio-->
		<!-- BEGIN GLOBAL AND THEME VENDORS -->
	<script src="<?php echo base_url() ?>js/global-vendors.js"></script>
	<!-- END GLOBAL AND THEME VENDORS -->

	<!-- BEGIN PLUGINS AREA -->
	<!-- END PLUGINS AREA -->

	<!-- PLUGINS INITIALIZATION AND SETTINGS -->
	<script src="<?php echo base_url() ?>scripts/user-pages.js"></script>
	<!-- END PLUGINS INITIALIZATION AND SETTINGS -->

	<!-- PLEASURE Initializer -->
	<script src="<?php echo base_url() ?>js/pleasure.js"></script>
	<!-- ADMIN 1 Layout Functions -->
	<script src="<?php echo base_url() ?>js/layout.js"></script>
	<script src="<?php echo base_url() ?>js/funciones.js"></script>
	<script src="<?php echo base_url() ?>plugins/quicksearch/dist/jquery.quicksearch.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="<?php echo base_url() ?>plugins/datatables/themes/bootstrap/dataTables.bootstrap.js"></script>
	<script src="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/js/jasny-bootstrap.min.js"></script>
	<script>
	sart.tablanoti='';
	  	$(document).ready(function () {
          if('<?php echo trim($notif);?>' == '0'){
			$('.docsvencidos').click();
		  }
		  <?php if(strpos($grupoName,'Secretaría') !== false){ ?>
          setInterval(function(){
			consultanotif();
		  }, 30000);
		  <?php } ?>
        });
</script>
</body>
</html>