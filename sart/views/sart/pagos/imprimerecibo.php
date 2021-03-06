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
 if($propietario ){
  $dataprop = $propietario->row();
  $nombre=$dataprop->id_prop.'-'.$dataprop->nombre.' '.$dataprop->apellidos;
 }

 if($diarios){
  $datadiario = $diarios->row();
  $id=$datadiario->id_diario;
  $tiporeci='Administracion';
 }
if($tellerdata){
  $datadiario = $tellerdata->row();
  $id=$datadiario->id_ptaller;
  $tiporeci='Taller';
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
      if($valor->tipo==4){
        $vaporte=$valor->valor;
      }
       
     }
 }

 if($radio=='si'){
  $vrdia=$admin+$vradio+$vaporte;
  $vradia=$vradio;
  //echo $admin.' '.$vradio;
 }else{
  $vrdia=$admin+$vaporte;
  $vradia=0;
 }

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
							<h4>COMPROBANTE DE PAGO DE ADMINISTRACION</h4>
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

									 	   <div> Recibo # <?php echo  $id ?> </div>
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
										</div><!--.col-md-6-->
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
										  <div>Mensualidad: <?php echo  $datadiario->pagos_dia ?></div>
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
										<!--<div class="col-md-4 col-xs-4 col-sm-4">
										  <div>Pago hasta: <?php echo  $datamov->placa ?></div>
										</div>.col-md-6-->
									</div><!--.col-md-12-->
									<div class="col-md-12 col-xs-12 company">
										<div class="col-md-9 col-xs-9 col-sm-9">
									 	   <div> Propietario <?php if(isset($nombre))echo  $nombre ?> </div>
										</div><!--.col-md-4-->
										<?php if($anula=='yes'){ ?>
										  <div class="col-md-3 col-xs-3 col-sm-3">
											  <div>V. Administración $<?php echo  number_format($datadiario->total,0,',','.') ?></div>
											</div><!--.col-md-6-->
										<?php } ?>
									</div><!--.col-md-12-->
									<?php if($anula=='no'){ ?>
									<div class="col-md-12 col-xs-12 company">
										<div class="col-md-5 col-xs-5 col-sm-5">
									 	   <div>Pago hasta: <?php echo  $meses[date('m',strtotime($datamov->pago_hasta ))].' '.date('d',strtotime($datamov->pago_hasta )).' de '.date('Y',strtotime($datamov->pago_hasta )) ?> </div>
										</div><!--.col-md-4-->
										<div class="col-md-4 col-xs-4 col-sm-4">
										  <div>Mensualidad: <?php echo  $datadiario->pagos_dia ?></div>
										</div><!--.col-md-6-->
										<div class="col-md-3 col-xs-3 col-sm-3">
										  <div>Tipo pago: <?php echo $tiporeci ?></div>
										</div><!--.col-md-6-->
									</div><!--.col-md-12-->
									<?php
									} ?>
								</div><!--.row-->
							</div><!--.invoice-heading-->
							<div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  <?php if($anula=='no'){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 11px;" >
									     <tr class=" ">
									         <th width="60%"  class=" border_l_0 border_t_0" style="padding: 0px 0 0px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Concepto pago</span>
									         </th>
									         <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 0px 0 0px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Valor</span>
									         </th>
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 0px 0 0px 10px;">
									           <span style="padding-left:5px;padding-right:5px">Subtotal</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
									     <?php
									      $desc=0;
									     if($diarios){
									     
									     ?>                      
									     <tr class="fconcepto">
									        <td width="60%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">ADMINISTRACION</span>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">$ <?php echo number_format(($datadiario->admin/$datadiario->pagos_dia),0,'.',',');?>
									        </td>
									        <td  width="20%"  class="  border_t_0 " style="padding: 0px 0 0px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->admin,0,'.',',');?>
									        </td>
									      </tr>
									      <?php
									      if($datadiario->aporte>0){
									      
									      ?> 
									      <tr class="fconcepto">
									        <td width="60%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">APORTES</span>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">$ <?php echo number_format(($datadiario->aporte/$datadiario->pagos_dia),0,'.',',');?>
									        </td>
									        <td  width="20%"  class="  border_t_0 " style="padding: 0px 0 0px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->aporte,0,'.',',');?>
									        </td>
									      </tr>
									      <?php
									        }

									      if($datadiario->radio>0){
									   
									      ?> 
									      <tr class="fconcepto">
									        <td width="60%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">RADIO</span>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">$ <?php echo number_format(($datadiario->radio/$datadiario->pagos_dia),0,'.',',');?>
									        </td>
									        <td  width="20%"  class="  border_t_0 " style="padding: 0px 0 0px 10px;"> 
									          <span style="color: #999;">$ <?php echo number_format($datadiario->radio,0,'.',',');?>
									        </td>
									      </tr>
									      <?php
									        }

									      
									         if ($datadiario->descuento>0) {  
									       ?>
									         <tr class=" ">
									            <td width="60%" colspan="2" class="  border_t_0" style="padding: 0px 0px 0px 10px;">
									              <span style="" class="pull-right">Subtotal</span>
									            </td>
									            <td  width="40%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="vtotalconc">$ <?php echo number_format($datadiario->total,0,'.',',');?>
									            </td>
									         </tr>
									       	<tr class=" ">
									       	   <td width="60%" colspan="2" class="  border_t_0" style="padding: 0px 0px 0px 10px;">
									       	     <span style="" class="pull-right">Descuento</span>
									       	   </td>
									       	   <td  width="40%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									       	     <span style="" class="vtotalconc">$ <?php echo number_format($datadiario->descuento,0,'.',',');?>
									       	   </td>
									       	</tr>
									         <?php
									         $desc=$datadiario->descuento;
									          }
									       
									       }
									      ?>
									         
									     
									      <?php
									     // }else{
									      	
									        if($tellerdata){
									      ?>
									     <tr class="ftaller ">
									        <td width="60%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">Taller</span>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;">$ <?php echo number_format($datadiario->vdia,0,'.',',');?>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;" >$ <?php echo number_format($datadiario->total,0,'.',',');?>
									        </td>
									     </tr>
									      <?php
									       } 
									    //  }
									      ?>
									     <tr class=" ">
									        <td width="60%" colspan="2" class="  border_t_0" style="padding: 0px 0px 0px 10px;">
									          <span style="" class="pull-right">Total</span>
									        </td>
									        <td  width="40%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="" class="vtotalconc">$ <?php echo number_format($datadiario->total-$desc,0,'.',',');?>
									        </td>
									     </tr>
									   </tbody>
									 </table>
									<!-- </div>
									<div class="col-md-6 col-xs-6"> -->
									 <?php									 
									   if($tellerdata){  ?>
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

									 <?php	
									   }else{
									 ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 11px;" >
									    <tr class=" ">
									        <th width="100%" colspan="3" class=" border_l_0 border_t_0 center" style="text-align: center;">
									          <span style="padding-left:5px;padding-right:5px;text-align:center">DOCUM&Eacute;NTOS</span>
									        </th>
									    </tr>
									    <tr class=" ">
									        <th width="60%"  class=" border_l_0 border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="padding-left:5px;padding-right:5px">Descripci&oacute;n</span>
									        </th>
									        <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="padding-left:5px;padding-right:5px">Vencimiento</span>
									        </th>
									        <th width="20%" class=" border_l_0 border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="padding-left:5px;padding-right:5px">Estado</span>
									        </th>
									    </tr>
									  <tbody id="global_table_list_items_properties_items_detail">
									    <?php
									    if($docv){
									      $i=0;
									      foreach ($docv -> result() as $rowdosv) {
									        if($rowdosv->fecha_exp==NULL || $rowdosv->fecha_exp=='0000-00-00'){
									          $fini="";
									        }else{
									          $fini=date('m/d/Y',strtotime($rowdosv->fecha_exp));
									        }
									        if($rowdosv->fecha_ven==NULL || $rowdosv->fecha_ven=='0000-00-00'){
									          $ffin="";
									        }else{
									          $ffin=date('m/d/Y',strtotime($rowdosv->fecha_ven));
									        }
									        if($rowdosv->diff>15){
									          $datedif="VIGENTE";
									          $classtex="btn-success";
									        }elseif($rowdosv->diff>=0 && $rowdosv->diff<=15){
									          $datedif="PROX VEN";
									          $classtex="btn-warning";
									        }elseif($rowdosv->diff<0){
									          $datedif="VENCIDO";
									          $classtex="btn-danger";
									        }
									        $numerodv=$rowdosv->numero;
									    ?>                      
									    <tr class=" ">
									        <td width="60%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									          <span style="color: #999;"><?php echo $rowdosv->descripcion;?></span>
									        </td>
									        <td  width="20%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									         <span style="color: #999;"><?php echo date('d/m/Y',strtotime($ffin)) ;?>                                           
									         </span>
									        </td>
									        <td width="20%" class="<?php echo $classtex;?> btn-flat " style="padding: 0px 0 0px 10px;">
									          <span><?php echo $datedif;?></span>
									        </td>
									    </tr>
									    <?php
									    $i++;
									       }
									    }
									    ?>
									  </tbody>
									</table>
								  <?php
								   } 
								//  }
								  ?>
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
