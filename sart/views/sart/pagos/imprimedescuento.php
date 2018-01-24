<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
 if($movil){
     $datamov = $movil->row();
     $fcontrato=$datamov->fcontrato;
     $placa=$datamov->placa;
     $id_movil=$datamov->id_movil;
     $pago_hasta=$datamov->pago_hasta;
     $mora=$datamov->mora;
     $radio=$datamov->radio;
     $taller=$datamov->dtaller;
 if($propietario){
  $dataprop = $propietario->row();
  $nombre=$dataprop->id_prop.'-'.$dataprop->nombre.' '.$dataprop->apellidos;
 }

 if($diarios){
  $datadiario = $diarios->row();
 }

  if($empresa){
  $dataemp = $empresa->row();
 
 }
if(isset($manager) && $manager  ){
  $datapropa = $manager->row();
  $nombrea=$datapropa->id_prop.'-'.$datapropa->nombre.' '.$datapropa->apellidos;
 }

 if($valores){
     foreach ($valores->result() as $valor) {
      if($valor->tipo==1){
        $admin=$valor->valor;
      }
      if($valor->tipo==2){
        $vradio=$valor->valor;
      }
       if($valor->tipo==3){
        $vtaller=$valor->valor;
      }
       
     }
 }

 if($radio=='si'){
  $vrdia=$admin+$vradio;
  $vradia=$vradio;
  //echo $admin.' '.$vradio;
 }else{
  $vrdia=$admin;
  $vradia=0;
 }
$totalexo=0;  
 $meses=array('01'=>'Enero','02'=>'Febrero','03'=>'Marzo','04'=>'Abril','05'=>'Mayo','06'=>'Junio','07'=>'Julio','08'=>'Agosto','09'=>'Septiembre','10'=>'Octubre','11'=>'Noviembre','12'=>'Diciembre');
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
<body onload="window.print()">

	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="panel">
					<div class="panel-heading">
						<div class="panel-title">
							<?php if($anula=='no'){ ?>
								<h4>AUTORIZACION DE DESCUENTO ADMINISTRACION</h4>
							<?php }else{ ?>
							    <h4>ANULACI&Oacute;N DE RECIBOS</h4>
							<?php
							} ?>
							<div class="panel-buttons">
								<button type="button" class="btn btn-primary print-trigger">Imprimir</button>
							</div><!--.panel-buttons-->
						</div><!--.panel-title-->
					</div><!--.panel-heading-->
					<div class="panel-body">

						<div class="invoice" style="padding-top: 0px;">
							<div class="invoice-heading">
								<div class="row date-row" style="text-align: center;">
									<div class="col-md-12 col-xs-12">
										<div><?php echo  $dataemp->nombre ?></div>
										<div>NIT:<?php echo  $dataemp->nit ?></div>
										<div><?php echo  $dataemp->direccion ?></div>
										<div><?php echo  $dataemp->email ?></div>
									</div><!--.col-md-6-->
									
								</div><!--.row-->
								<div class="row customer-rowx">
									<div class="col-md-12 col-xs-12 company">
										<div class="col-md-4 col-xs-4 col-sm-4">

									 	   <div> Descuento # <?php echo  $datadiario->id_descuento ?> </div>
										</div><!--.col-md-4-->
										<div class="col-md-5 col-xs-5 col-sm-5">
										<?php if($anula=='no'){ ?>
										  <div>Fecha recibo: <?php echo  $meses[date('m',strtotime($datadiario->fecha_pago))].' '.date('d',strtotime($datadiario->fecha_pago)).' de '.date('Y',strtotime($datadiario->fecha_pago)) ?></div>
										<?php }else{ ?>
										   <div>Fecha: <?php echo  $meses[date('m',strtotime($datadiario->date_mod))].' '.date('d',strtotime($datadiario->date_mod)).' de '.date('Y',strtotime($datadiario->date_mod)) ?></div>
										<?php
										} ?>
										</div><!--.col-md-6-->
										<div class="col-md-3 col-xs-3 col-sm-3">
										<?php if($anula=='no'){ ?>
										  <div>Hora: <?php echo  date('h:i:s',strtotime($datadiario->fecha_pago)) ?></div>
										<?php }else{ ?>
										   <div>Hora: <?php echo  date('h:i:s',strtotime($datadiario->date_mod)) ?></div>
										<?php
										} ?>
									</div><!--.col-md-12-->
									<div class="col-md-12 col-xs-12 company">
										<?php if($anula=='yes'){ ?>
											<div class="col-md-4 col-xs-4 col-sm-4">
										 	   <div> Movil <?php echo  $datamov->id_movil ?> </div>
											</div><!--.col-md-4-->
										<div class="col-md-5 col-xs-5 col-sm-5">
										  <div>Placa <?php echo  $datamov->placa ?></div>
										</div><!--.col-md-6-->
										<div class="col-md-3 col-xs-3 col-sm-3">
										  <div>Diarios: <?php echo  $datadiario->diarios_mora ?></div>
										</div><!--.col-md-6-->
										<?php }else{ ?>
											<div class="col-md-4 col-xs-4 col-sm-4">
										 	   <div> Movil <?php echo  $datamov->id_movil ?> </div>
											</div><!--.col-md-4-->
											<div class="col-md-4 col-xs-4 col-sm-4">
											  <div>Placa <?php echo  $datamov->placa ?></div>
											</div><!--.col-md-6-->
										<?php
										} ?>
									</div><!--.col-md-12-->
									<div class="col-md-12 col-xs-12 company">
										<div class="col-md-9 col-xs-9 col-sm-9">
									 	   <div> Propietario <?php echo  $nombre ?> </div>
										</div><!--.col-md-4-->
										<?php if($anula=='yes'){ 
											$totalexo+=$datadiario->vt_admin*$datadiario->porcen_admin/100;
											$totalexo+=$datadiario->vt_radio*$datadiario->porcen_radio/100;
											?>
										  <div class="col-md-3 col-xs-3 col-sm-3">
											  <div>V. Descuento $<?php echo  number_format($totalexo,0,',','.') ?></div>
											</div><!--.col-md-6-->
										<?php } ?>
									</div><!--.col-md-12-->
								</div><!--.row-->
							</div><!--.invoice-heading-->
							<div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								   <?php if($anula=='no'){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="40%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Concepto</span>
									         </th>
									         <!--th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Diarios en Mora</span>
									         </th-->
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Valor Mensualidad</span>
									         </th>
									         <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Exoneraci&oacute;n Autorizada</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
									     <?php
										  $totaldescu=0;  
										  $totalexo=0;  
									     ?>                      
									     <tr class="fconcepto">
									        <td width="40%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									          <span style="color: #999;">ADMINISTRACION</span>
									        </td>
									        <!--td  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									          <span style="color: #999;"> <?php //echo $datadiario->diarios_mora;?>
									        </td-->
									        <td  width="20%"  class="  border_t_0 " style="padding: 3px 0 3px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->vt_admin,0,'.',',');?>
									        </td>
                                             <td  width="20%"  class="  border_t_0 " style="padding: 3px 0 3px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->vt_admin*$datadiario->porcen_admin/100,0,'.',',');?>
									        </td>

									      </tr>
									      <?php
									      $totaldescu+=$datadiario->vt_admin;
									      $totalexo+=$datadiario->vt_admin*$datadiario->porcen_admin/100;
									      if($datadiario->vt_radio>0){
									   
									      ?> 
									      <tr class="fconcepto">
									        <td width="40%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									          <span style="color: #999;">RADIO</span>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									          <span style="color: #999;"> <?php echo ($datadiario->diarios_mora);?>
									        </td>
									        <td  width="20%"  class="  border_t_0 " style="padding: 3px 0 3px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->vt_radio,0,'.',',');?>
									        </td>
									        <td  width="20%"  class="  border_t_0 " style="padding: 3px 0 3px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->vt_radio*$datadiario->porcen_radio/100,0,'.',',');?>
									        </td>
									      </tr>
									      <?php
									       $totaldescu+=$datadiario->vt_radio;
									       $totalexo+=$datadiario->vt_radio*$datadiario->porcen_radio/100;
									        }
									     	$desc=0;
									       if ($datadiario->vtdescuento>0) {  
									     ?>
									       <tr class=" ">
									          <td width="60%" colspan="2" class="  border_t_0" style="padding: 3px 3px 3px 10px;">
									            <span style="" class="pull-right">Total exoneraci&oacute;n</span>
									          </td>
									          <td  width="40%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									            <span style="" class="vtotalconc">$ <?php echo number_format($totalexo,0,'.',',');?>
									          </td>
									       </tr>
									       <tr class=" ">
									          <td width="60%" colspan="2" class="  border_t_0" style="padding: 3px 3px 3px 10px;">
									            <span style="" class="pull-right">Total a Pagar</span>
									          </td>
									          <td  width="40%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									            <span style="" class="vtotalconc">$ <?php echo number_format($totaldescu-$datadiario->vtdescuento,0,'.',',');?>
									          </td>
									       </tr>
									     	<?php
									        }
									      ?>
									     
									        
									     </tr>
									   </tbody>
									 </table>
									 <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="10%"  class=" border_l_0 border_t_0 center" style="text-align: center;">
									           <span style="padding-left:5px;padding-right:5px;text-align:center">MOTIVO</span>
									         </th>
									         <td width="90%"  class=" border_l_0 border_t_0 " style="">
									           <span style="padding-left:5px;padding-right:5px;"><?php echo $datadiario->concepto_desc ?></span>
									         </td>
									     </tr>
									 </table>
									  <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="50%"  class=" border_l_0 border_t_0 " style="">
									           <span style="padding-left:5px;padding-right:5px;text-align:center">____________________</span>
									         </th>
									         <td width="50%"  class=" border_l_0 border_t_0 " style="">
									           <span style="padding-left:5px;padding-right:5px;text-align:center">____________________</span>
									           <span style="padding-left:5px;padding-right:5px;text-align:center" class="pull-right">_______________</span>
									         </td>
									     </tr>
									     <tr class=" ">
									         <td width="50%"  class=" border_l_0 border_t_0 " style="">
									           <span style="padding-left:5px;padding-right:5px;text-align:center">Realizado por</span>
									         </td>
									         <td width="50%"  class=" border_l_0 border_t_0 " style="">
									           <span style="padding-left:5px;padding-right:5px;text-align:center">Propietario</span>
									           <span style="padding-left:5px;padding-right:5px;text-align:center" class="pull-right">C&eacute;dula</span>
									         </td>
									     </tr>
									 </table>
									 <?php }else{ ?>
									 	<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									 	    <tr class=" ">
									 	        <th width="10%"  class=" border_l_0 border_t_0 center" style="text-align: center;">
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center">MOTIVO</span>
									 	        </th>
									 	        <td width="90%"  class=" border_l_0 border_t_0 " style="">
									 	          <span style="padding-left:5px;padding-right:5px;"><?php echo $datadiario->motivo_anula ?></span>
									 	        </td>
									 	    </tr>
									 	</table>
									 	 <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									 	    <tr class=" ">
									 	        <th width="50%"  class=" border_l_0 border_t_0 " style="">
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center">____________________</span>
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center" class="pull-right">_______________</span>
									 	        </th>
									 	        <td width="50%"  class=" border_l_0 border_t_0 " style="">
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center">____________________</span>
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center" class="pull-right">_______________</span>
									 	        </td>
									 	    </tr>
									 	    <tr class=" ">
									 	        <td width="50%"  class=" border_l_0 border_t_0 " style="">
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center">Realizado por</span>
									 	           <span style="padding-left:5px;padding-right:5px;text-align:center" class="pull-right">Autoriza</span>
									 	        </td>
									 	        <td width="50%"  class=" border_l_0 border_t_0 " style="">
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center">Propietario</span>
									 	          <span style="padding-left:5px;padding-right:5px;text-align:center" class="pull-right">C&eacute;dula</span>
									 	        </td>
									 	    </tr>
									 	</table>
									 <?php }?>
									<!-- </div>
									<div class="col-md-6 col-xs-6"> -->
									</div>
								</div>
							</div><!--.invoice-body-->

						</div><!--.invoice-->

					</div><!--.panel-body-->
				</div><!--.panel-->
			</div><!--.col-md-12-->
		</div><!--.row-->
	</div><!--.content-->
<?php }?>
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
	<script type="text/javascript">
	$('.print-trigger').click(function () {
		 window.print();
	    return false;
	});
	</script>
</body>
</html>
