<?php 
  date_default_timezone_set('America/Bogota');
defined('BASEPATH') OR exit('No direct script access allowed');
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
							<h4>INFORME</h4>
							<div class="panel-buttons">
								<button type="button" class="btn btn-primary print-trigger">Imprimir</button>
								<?php if ($informe=='docs_vencidos') {?>
								 <button type="button" class="btn btn-primary excel" data-var="?fini=<?php echo $fini ?>&ffin=<?php echo $ffin ?>&id_movil=<?php echo $id_movil ?>">Excel</button>

							<?php	} ?>
								
							</div><!--.panel-buttons-->
						</div><!--.panel-title-->
					</div><!--.panel-heading-->
					<div class="panel-body">
					 <?php 
					     switch ($informe) {
					     	case 'cuadre_caja':
					 ?>
						    <div class="invoice-heading">
						     <div class="row margin_0">
						     	<div class="col-md-12XX" style="padding-bottom:16px;">
						     	 <center>
						     	    <h3 class="no_bold" style="margin-top: 0px;">INFORME PAGO DE DIARIOS</h3>		
					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
									
	$empresa='COOMOCART LTDA';
									
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						     	 <?php if(isset($fini) && $fini!='' ){ ?>	
						     		<center>
						     		 <div class="bold">Para la fecha <?php echo $fini.' hasta '.$ffin ?></div>
						     		</center>	
						     	<?php } ?>	 
						     	 </center>
						     	</div>
						     </div>
						    </div>
							<div class="invoice-body">
								<div class="row">
							<?php if($mov){ ?>
								  <div class="col-md-12 col-xs-12">
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="6%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="6%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									         </th>
									          <th  width="21%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RECIBO</span>
									         </th>
									         <th width="7%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">CONCEPTO</span>
									         </th>
									         <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ADMIN</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RADIO</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TALLER</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TOTAL</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    					<?php
                    					 
                    					 	$tdias=0;
                    					 	$tadmin=0;
                    					 	$tradio=0;
                    					 	$ttaller=0;
                    					 	$tpagos=0;
                    					  foreach ($mov->result() as $detalle) {
                    					?>
									     <tr class="fconcepto">
									       <td  width="6%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="6%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->pagos_dia ?> </td>
									       <td  width="21%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
									       	<?php echo $detalle->recibo_num;
									       	     /* if(isset($fini)){ 
									       	      	echo ' /'.date('Y-m-d',strtotime($detalle->fecha_create));
									         }*/ ?>	 
									       </td>
									       <td  width="7%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->concepto ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->admin,0,'.',',') ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->radio,0,'.',',') ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->taller,0,'.',',') ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->total,0,'.',',') ?> </td>
									      </tr>
									     <?php
									     $tdias+=$detalle->pagos_dia;
									     $tadmin+=$detalle->admin;
									     $tradio+=$detalle->radio;
									     $ttaller+=$detalle->taller;
									     $tpagos+=$detalle->total;
									       }
									      ?>
									         <tr class=" ">
									            <th width="6%"  class="  border_t_0" style="padding: 0px 0px 0px 10px;">
									              <span style="" class="pull-right">TOTALES</span>
									            </th>
									            <th  width="6%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class=""> <?php echo $tdias;?></span>
									            </th>
									            <th  width="28%" colspan="2"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($tadmin,0,'.',',');?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($tradio,0,'.',',');?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($ttaller,0,'.',',');?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
									            </th>
									         </tr>
									    </tbody> 	
									  </table>
									  <?php }else{?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
						 <?php
								   break;
								   case 'simit':
									?>
										   <div class="invoice-heading">
											<div class="row margin_0">
												<div class="col-md-12XX" style="padding-bottom:16px;">
												 <center>
													<h3 class="no_bold" style="margin-top: 0px;">REGISTRO SIMIT</h3>		
									<?php
			   $empresa='';
			   //echo $grup;
				if(isset($grup)){ 
												   
				   $empresa='COOMOCART LTDA';
												   
			   ?>	
			   <center>
				   <div class="bold"><?php echo $empresa?></div>
			   </center>								     	<?php } ?>									
			   
												 <?php if(isset($fini) && $fini!='' ){ ?>	
													<center>
													 <div class="bold">Para la fecha <?php echo $fini.' hasta '.$ffin ?></div>
													</center>	
												<?php } ?>	 
												 </center>
												</div>
											</div>
										   </div>
										   <div class="invoice-body">
											   <div class="row">
										   <?php if($mov){ ?>
												 <div class="col-md-12 col-xs-12">
												   <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
														<tr class=" ">
															<th width="40%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
															  <span style="padding-left:5px;padding-right:5px">CONDUCTOR</span>
															</th>
															<th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
															  <span style="padding-left:5px;padding-right:5px">COMPARENDO</span>
															</th>
															 <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
															  <span style="padding-left:5px;padding-right:5px">INFRACCION</span>
															</th>
															<th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
															  <span style="padding-left:5px;padding-right:5px">VALOR</span>
															</th>
															<th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
															  <span style="padding-left:5px;padding-right:5px">FECHA COMPARENDO</span>
															</th>
															
														</tr>
													  <tbody id="global_table_list_items_properties_items_detail">
													   <?php
													     $totvalor=0;
														 foreach ($mov->result() as $detalle) {
													   ?>
														<tr class="fconcepto">
														  <td  width="40%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
														  	<?php echo $detalle->conductor ?> 
														  </td>
														  <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
														  	<?php echo $detalle->n_parte ?> 
														  </td>
														  <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
														  	<?php echo $detalle->cod_infraccion ?> 
														  </td>
														  <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
														  	$ <?php echo number_format($detalle->valor,0,'.',',') ?> 
														  </td>
														  <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
														  	<?php echo date('Y-m-d',strtotime($detalle->fecha_parte)); ?> 
														  </td>
														 </tr>
														<?php
							
														  }
														 ?>
													   </tbody> 	
													 </table>
													 <?php }else{?>
													   <div>No hay resultados </div>
													  <?php }?>
													 <div class="col-md-12 pull-right">
													  Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
													 </div>
												   </div>
											   </div>
										   </div><!--.invoice-body-->
										<?php
							break;
						   	case 'estado_cuenta':
						 ?>  	
						   	  <div class="invoice-heading">
						   	   <div class="row margin_0">
						   	   	<div class="col-md-12XX" style="padding-bottom:16px;">
						   	   	 <center>
						   	   	    <h3 class="no_bold" style="margin-top: 0px;">INFORME ESTADO DE CUENTA</h3>	

					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						   	   	     <?php if(isset($fini)){ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo $ffin ?></div>
						   	   	    	</center>	
						   	   	    <?php }else{ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo  date('Y-m-d') ?></div>
						   	   	    	</center>
						   	   	    <?php }?> 															
						   	   	 </center>
						   	   	</div>
						   	   </div>
						   	  </div>
						   	  <div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  	<?php if($mov){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									         </th>
										 <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ULTIMO PAGO</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">AL DIA HASTA</span>
									         </th>
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ADMIN</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RADIO</span>
									         </th>
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">SALDO</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    					<?php
                    					
                    					 	$tdias=0;
                    					 	$tadmin=0;
                    					 	$tradio=0;
                    					 	$tpagos=0;
                    					  foreach ($mov->result() as $detalle) {
                    					?>
									     <tr class="fconcepto">
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->mora ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php  if($detalle->ultimo_pago != NULL && $detalle->ultimo_pago != '0000-00-00'){ echo date('d-m-Y',strtotime($detalle->ultimo_pago));}?></td>	
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo date('d-m-Y',strtotime($detalle->pago_hasta));?></td>	
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->mora*$admin,0,'.',',') ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php 
 if($detalle->radio=='si'){
 $vradio=$radio;
}else{
 $vradio=0;
}
echo number_format($detalle->mora*$vradio,0,'.',',') ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format(($detalle->mora*$admin)+($detalle->mora*$vradio),0,'.',',') ?> </td>
									     </tr>
									     <?php
									     $tdias+=$detalle->mora;
									     $tadmin+=$detalle->mora*$admin;
									     $tradio+=$detalle->mora*$vradio;
									     $tpagos+=($detalle->mora*$admin)+($detalle->mora*$vradio);
									       }
									      ?>
									         <tr class=" ">
									            <th width="10%"  class="  border_t_0" style="padding: 3px 3px 3px 10px;">
									              <span style="" class="pull-right">TOTALES</span>
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""> <?php echo $tdias;?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">
									            </th>
										    <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">
									            </th>	
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tadmin,0,'.',',');?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tradio,0,'.',',');?></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
									            </th>
									         </tr>
									    </tbody> 	
									  </table>
									  <?php }else{?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
					   <?php
						   		break;
						   	case 'estado_cuentafa':
						 ?>  	
						   	  <div class="invoice-heading">
						   	   <div class="row margin_0">
						   	   	<div class="col-md-12XX" style="padding-bottom:16px;">
						   	   	 <center>
						   	   	    <h3 class="no_bold" style="margin-top: 0px;">INFORME ESTADO DE CUENTA</h3>	

					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						   	   	     <?php if(isset($fini)){ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo $ffin ?></div>
						   	   	    	</center>	
						   	   	    <?php }else{ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo  date('Y-m-d') ?></div>
						   	   	    	</center>
						   	   	    <?php }?> 															
						   	   	 </center>
						   	   	</div>
						   	   </div>
						   	  </div>
						   	  <div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  	<?php if($mov){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									         </th>
										 <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ULTIMO PAGO</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">AL DIA HASTA</span>
									         </th>
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ADMIN</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RADIO</span>
									         </th>
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">SALDO</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    					<?php
                    					
                    					 	$tdias=0;
                    					 	$tadmin=0;
                    					 	$tradio=0;
                    					 	$tpagos=0;
                    					  foreach ($mov->result() as $detalle) {
                    					?>
									     <tr class="fconcepto">
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->mora+$sumpago[$detalle->id_movil]->diarios ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php  if($detalle->ultimo_pago != NULL && $detalle->ultimo_pago != '0000-00-00'){ echo date('d-m-Y',strtotime($detalle->ultimo_pago));}?></td>	
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo date('d-m-Y',strtotime($detalle->pago_hasta));?></td>	
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format(($detalle->mora+$sumpago[$detalle->id_movil]->diarios)*$admin,0,'.',',') ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php 
 if($detalle->radio=='si'){
 $vradio=$radio;
}else{
 $vradio=0;
}
echo number_format(($detalle->mora+$sumpago[$detalle->id_movil]->diarios)*$vradio,0,'.',',') ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format((($detalle->mora+$sumpago[$detalle->id_movil]->diarios)*$admin)+(($detalle->mora+$sumpago[$detalle->id_movil]->diarios)*$vradio),0,'.',',') ?> </td>
									     </tr>
									     <?php
									     $tdias+=$detalle->mora+$sumpago[$detalle->id_movil]->diarios;
									     $tadmin+=($detalle->mora)+$sumpago[$detalle->id_movil]->diarios*$admin;
									     $tradio+=($detalle->mora+$sumpago[$detalle->id_movil]->diarios)*$vradio;
									     $tpagos+=($detalle->mora*$admin)+(($detalle->mora+$sumpago[$detalle->id_movil]->diarios)*$vradio);
									       }
									      ?>
									         <tr class=" ">
									            <th width="10%"  class="  border_t_0" style="padding: 3px 3px 3px 10px;">
									              <span style="" class="pull-right">TOTALES</span>
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""> <?php echo $tdias;?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">
									            </th>
										    <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">
									            </th>	
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tadmin,0,'.',',');?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tradio,0,'.',',');?></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
									            </th>
									         </tr>
									    </tbody> 	
									  </table>
									  <?php }else{?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
					   <?php
						   		break;	
						   	case 'taller':
						 ?>  	
						   	  <div class="invoice-heading">
						   	   <div class="row margin_0">
						   	   	<div class="col-md-12XX" style="padding-bottom:16px;">
						   	   	 <center>
						   	   	    <h3 class="no_bold" style="margin-top: 0px;">INFORME ORDENES DE TALLER</h3>	
					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						   	   	     <?php if(isset($fini)){ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Para la fecha <?php echo $fini.' hasta '.$ffin ?></div>
						   	   	    	</center>	
						   	   	    <?php }?> 															
						   	   	 </center>
						   	   	</div>
						   	   </div>
						   	  </div>
						   	  <div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  <?php  if($mov){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									         </th>
									          <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">SALDO</span>
									         </th>
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RECIBO</span>
									         </th>
									         <th width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">FECHA</span>
									         </th>
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TOTAL</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    					<?php
                    					
                    					 	$tdias=0;
                    					 	$tadmin=0;
                    					 	$tradio=0;
                    					 	$tpagos=0;
                    					  foreach ($mov->result() as $detalle) {
                    					  	if($detalle->radio=='si'){
                    					  		$saltaller=$detalle->pagos_dia*$conradio;
                    					  	}else{
                    					  		$saltaller=$detalle->pagos_dia*$sinradio;
                    					  	}
                    					?>
									     <tr class="fconcepto">
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->pagos_dia ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->saldo ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_ptaller ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo date('d-m-Y',strtotime($detalle->fecha_pago));?></td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($saltaller,0,'.',',') ?> </td>
									     </tr>
									     <?php
									     $tdias+=$detalle->saldo;
									     $tadmin+=$detalle->pagos_dia;
									     $tpagos+=$saltaller;
									       }
									      ?>
									         <tr class=" ">
									            <th width="15%"  class="  border_t_0" style="padding: 3px 3px 3px 10px;">
									              <span style="" class="pull-right">TOTALES</span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""> <?php echo $tadmin;?></span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""><?php echo $tdias;?></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
									            </th>
									         </tr>
									    </tbody> 	
									  </table>
									   <?php }else{?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
						 <?php
						   		break;
case 'descuento':
						 ?>  	
						   	  <div class="invoice-heading">
						   	   <div class="row margin_0">
						   	   	<div class="col-md-12XX" style="padding-bottom:16px;">
						   	   	 <center>
						   	   	    <h3 class="no_bold" style="margin-top: 0px;">INFORME DESCUENTOS</h3>	
					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						   	   	     <?php if(isset($fini)){ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Para la fecha <?php echo $fini.' hasta '.$ffin ?></div>
						   	   	    	</center>	
						   	   	    <?php }?> 															
						   	   	 </center>
						   	   	</div>
						   	   </div>
						   	  </div>
						   	  <div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  <?php  if($mov){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									         </th>
									          <!--th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TOTAL</span>
									         </th-->
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RECIBO</span>
									         </th>
									         <th width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">FECHA</span>
									         </th>
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TOTAL</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    					<?php
                    					
                    					 	$tdias=0;
                    					 	$tadmin=0;
                    					 	$tradio=0;
                    					 	$tpagos=0;
                    					  foreach ($mov->result() as $detalle) {

                    					?>
									     <tr class="fconcepto">
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->diarios_mora ?> </td>
									       <!--td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->saldo ?> </td-->
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_descuento ?> </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo date('d-m-Y',strtotime($detalle->fecha_pago));?></td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->vtdescuento,0,'.',',') ?> </td>
									     </tr>
									     <?php
									     //dias+=$detalle->saldo;
									     $tadmin+=$detalle->diarios_mora;
									     $tpagos+=$detalle->vtdescuento;
									       }
									      ?>
									         <tr class=" ">
									            <th width="15%"  class="  border_t_0" style="padding: 3px 3px 3px 10px;">
									              <span style="" class="pull-right">TOTALES</span>
									            </th>
									            <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""> <?php echo $tadmin;?></span>
									            </th>
									            <!--th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""><?php echo $tdias;?></span>
									            </th-->
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class=""></span>
									            </th>
									            <th  width="20%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
									              <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
									            </th>
									         </tr>
									    </tbody> 	
									  </table>
									   <?php }else{?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
						 <?php
						   		break;
						   	case 'diarios_movil':
						 ?>  	
						   	  <div class="invoice-heading">
						   	   <div class="row margin_0">
						   	   	<div class="col-md-12XX" style="padding-bottom:16px;">
						   	   	 <center>
						   	   	    <h3 class="no_bold" style="margin-top: 0px;">INFORME Pagos X movil</h3>	

<?php		
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						   	   	     <?php if(isset($fini)){ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo $ffin ?></div>
						   	   	    	</center>	
						   	   	    <?php }else{ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo  date('Y-m-d') ?></div>
						   	   	    	</center>
						   	   	    <?php }?> 															
						   	   	 </center>
						   	   	</div>
						   	   </div>
						   	  </div>
						   	  <div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  	<?php if($movildata){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">FECHA SALDO</span>
									         </th>
									          <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ULTIMO PAGO</span>
									         </th>
									         <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">CEDULA</span>
									         </th>
									          <th  width="30%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">PROPIETARIO</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    				  <?php
                    					  foreach ($movildata->result() as $detalle) {
                    					?>
									     <tr class="fconcepto">
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo date('d-m-Y',strtotime($detalle->pago_hasta)); ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
									       	<?php
									       	  if($detalle->ultimo_pago!= NULL){	
									       		 echo date('d-m-Y',strtotime($detalle->ultimo_pago));
									       	  }
									       	 ?>
									       </td>
									       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_prop ?> </td>
									       <td  width="30%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->nombre.' '.$detalle->apellidos ?> </td>
									     </tr>
									    
									     <?php 
									      if($mov[$detalle->id_movil]){ 
									     ?>
									      <tr >
									       <td colspan='5'>
									      	<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									          <tr class=" ">
									              <th width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">FECHA</span>
									              </th>
									              <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									              </th>
									               <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">RECIBO</span>
									              </th>
									              <th width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">CONCEPTO</span>
									              </th>
									               <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">SALDO</span>
									              </th>
									              <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">ADMIN</span>
									              </th>
									              <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">RADIO</span>
									              </th>
									              <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">TALLER</span>
									              </th>
									              <th  width="15%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">TOTAL</span>
									              </th>
									          </tr>
									          <tbody>
									          	 <?php
									          	  $tdias=0;
									          	  $tadmin=0;
									          	  $tradio=0;
									          	  $ttaller=0;
									          	  $tpagos=0;

			                    					  foreach ($mov[$detalle->id_movil]->result() as $movimientos) {
			                    					?>
												     <tr class="fconcepto">
												       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo  date('d-m-Y',strtotime($movimientos->fecha_create)); ?> </td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->pagos_dia?></td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->recibo_num?></td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->concepto ?> </td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
												       	<?php
												       	  if($movimientos->saldo_hasta!= NULL){
												       	    echo date('d-m-Y',strtotime($movimientos->saldo_hasta));
												       	  }
												       	 ?> 
												       </td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->admin  ?></td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->radio ?></td>
												       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->taller ?> </td>
												       <td  width="15%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->total ?> </td>
												     </tr>
												 <?php
												  	  $tdias+=$movimientos->pagos_dia;
												  	  $tadmin+=$movimientos->admin;
												  	  $tradio+=$movimientos->radio;
												  	  $ttaller+=$movimientos->taller;
												  	  $tpagos+=$movimientos->total;
												  	    }
												  	   ?>
												  	      <tr class=" ">
												  	         <th width="15%"  class="  border_t_0" style="padding: 3px 3px 3px 10px;">
												  	           <span style="" class="pull-right">TOTALES</span>
												  	         </th>
												  	         <th  width="10%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
												  	           <span style="" class=""> <?php echo $tdias;?></span>
												  	         </th>
												  	         <th  width="30%" colspan='3'  class="  border_t_0" style="padding: 3px 0 3px 10px;">
												  	           <span style="" class=""></span>
												  	         </th>
												  	         <th  width="10%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
												  	           <span style="" class="">$ <?php echo number_format($tadmin,0,'.',',');?></span>
												  	         </th>
												  	         <th  width="10%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
												  	           <span style="" class="">$ <?php echo number_format($tradio,0,'.',',');?></span>
												  	         </th>
												  	         <th  width="10%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
												  	           <span style="" class="">$ <?php echo number_format($ttaller,0,'.',',');?></span>
												  	         </th>
												  	         <th  width="15%"  class="  border_t_0" style="padding: 3px 0 3px 10px;">
												  	           <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
												  	         </th>
												  	      </tr>
									          </tbody> 
									        </table>
									      </td>
									     </tr>
										<?php }?>
										     <?php
									       }
									      ?>

									    </tbody> 	
									  </table>
									  <?php }else{ ?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
						 <?php
						        break;
						       	case 'docs_vencidos':
						 ?>  	
						   	  <div class="invoice-heading">
						   	   <div class="row margin_0">
						   	   	<div class="col-md-12XX" style="padding-bottom:16px;">
						   	   	 <center>
						   	   	    <h3 class="no_bold" style="margin-top: 0px;">INFORME DOCUMENTOS VENCIDOS</h3>
					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									
	
						   	   	     <?php if(isset($fini)){ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo $ffin ?></div>
						   	   	    	</center>	
						   	   	    <?php }else{ ?>	
						   	   	    	<center>
						   	   	    	 <div class="bold">Fecha de corte: <?php echo  date('Y-m-d') ?></div>
						   	   	    	</center>
						   	   	    <?php }?> 															
						   	   	 </center>
						   	   	</div>
						   	   </div>
						   	  </div>
						   	  <div class="invoice-body">
								<div class="row">
								  <div class="col-md-12 col-xs-12">
								  	<?php if($movildata){ ?>
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">PLACA</span>
									         </th>
									         <th width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">CEDULA</span>
									         </th>
									          <th  width="40%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">PROPIETARIO</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    				  <?php
                    					  foreach ($movildata->result() as $detalle) {
                    					?>
									     <tr class="fconcepto">
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->placa; ?> </td>
									       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_prop ?> </td>
									       <td  width="30%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->nombre.' '.$detalle->apellidos ?> </td>
									     </tr>
									    
									     <?php 
									      if($docv[$detalle->id_movil]){ 
									     ?>
									      <tr >
									       <td colspan='4'>
									      	<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									          <tr class=" ">
									              <th width="40%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">Documento</span>
									              </th>
									              <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">Vencimiento</span>
									              </th>
									               <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">Dias vigencia</span>
									              </th>
									              <th  width="20%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									                <span style="padding-left:5px;padding-right:5px">Estado</span>
									              </th>
									          </tr>
									          <tbody>
									          	 <?php
			                    					  foreach ($docv[$detalle->id_movil]->result() as $movimientos) {
			                    					  	if($movimientos->diff>15){
			                    					  	  $datedif="VIGENTE";
			                    					  	  $classtex="btn-success";
			                    					  	}elseif($movimientos->diff>=0 && $movimientos->diff<=15){
			                    					  	  $datedif="PROX VEN";
			                    					  	  $classtex="btn-warning";
			                    					  	}elseif($movimientos->diff<0){
			                    					  	  $datedif="VENCIDO";
			                    					  	  $classtex="btn-danger";
			                    					  	}
			                    					?>
												     <tr class="fconcepto">
												       <td  width="40%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo  $movimientos->descripcion ; ?> </td>
												       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo date('d-m-Y',strtotime($movimientos->fecha_ven))?></td>
												       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $movimientos->diff?></td>
												       <td  width="20%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $datedif ?> </td>
												     </tr>
												 <?php
												  	   }
												  	   ?>

									          </tbody> 
									        </table>
									      </td>
									     </tr>
										<?php }?>
										     <?php
									       }
									      ?>

									    </tbody> 	
									  </table>
									  <?php }else{ ?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
						 <?php
						        break;
						         	case 'desvinculados':
					 ?>
						    <div class="invoice-heading">
						     <div class="row margin_0">
						     	<div class="col-md-12XX" style="padding-bottom:16px;">
						     	 <center>
						     	    <h3 class="no_bold" style="margin-top: 0px;">INFORME MOVILES DESVINCULADOS</h3>		
					 <?php
$empresa='';
//echo $grup;
 if(isset($grup)){ 
	$empresa='COOMOCART LTDA';
?>	
<center>
	<div class="bold"><?php echo $empresa?></div>
</center>								     	<?php } ?>									

						     	 <?php if(isset($fini) && $fini!='' ){ ?>	
						     		<center>
						     		 <div class="bold">Para la fecha <?php echo $fini.' hasta '.$ffin ?></div>
						     		</center>	
						     	<?php } ?>	 
						     	 </center>
						     	</div>
						     </div>
						    </div>
							<div class="invoice-body">
								<div class="row">
							<?php if($mov){ ?>
								  <div class="col-md-12 col-xs-12">
									<table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
									     <tr class=" ">
									         <th width="6%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">MOVIL</span>
									         </th>
									         <th  width="6%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">DIARIOS</span>
									         </th>
									          <th  width="21%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RECIBO</span>
									         </th>
									         <th width="7%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">CONCEPTO</span>
									         </th>
									         <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">ADMIN</span>
									         </th>
									          <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">RADIO</span>
									         </th>
									          <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TALLER</span>
									         </th>
									          <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">FECHA PAGO</span>
									         </th>
									          <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">PAGO HASTA</span>
									         </th>
									          <th  width="10%"  class=" border_l_0 border_t_0" style="padding: 3px 0 3px 10px;">
									           <span style="padding-left:5px;padding-right:5px">TOTAL</span>
									         </th>
									     </tr>
									   <tbody id="global_table_list_items_properties_items_detail">
                    					<?php
                    					 
                    					 	$tdias=0;
                    					 	$tadmin=0;
                    					 	$tradio=0;
                    					 	$ttaller=0;
                    					 	$tpagos=0;
                    					  foreach ($mov->result() as $detalle) {
                    					?>
									     <tr class="fconcepto">
									       <td  width="6%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->id_movil ?> </td>
									       <td  width="6%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->diarios ?> </td>
									       <td  width="21%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">
									       	<?php echo $detalle->recibo;
									       	     /* if(isset($fini)){ 
									       	      	echo ' /'.date('Y-m-d',strtotime($detalle->fecha_create));
									         }*/ ?>	 
									       </td>
									       <td  width="7%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->concepto ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->admin,0,'.',',') ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->radio,0,'.',',') ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->taller,0,'.',',') ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->fecha_pago ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px"><?php echo $detalle->pago_hasta ?> </td>
									       <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;padding:0px 0px 0px 6px">$ <?php echo number_format($detalle->total,0,'.',',') ?> </td>
									      </tr>
									     <?php
									     $tdias+=$detalle->diarios;
									     $tadmin+=$detalle->admin;
									     $tradio+=$detalle->radio;
									     $ttaller+=$detalle->taller;
									     $tpagos+=$detalle->total;
									       }
									      ?>
									         <tr class=" ">
									            <th width="6%"  class="  border_t_0" style="padding: 0px 0px 0px 10px;">
									              <span style="" class="pull-right">TOTALES</span>
									            </th>
									            <th  width="6%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class=""> <?php echo $tdias;?></span>
									            </th>
									            <th  width="28%" colspan="2"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($tadmin,0,'.',',');?></span>
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($tradio,0,'.',',');?></span>
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($ttaller,0,'.',',');?></span>
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									            </th>
									            <th  width="10%"  class="  border_t_0" style="padding: 0px 0 0px 10px;">
									              <span style="" class="">$ <?php echo number_format($tpagos,0,'.',',');?></span>
									            </th>
									         </tr>
									    </tbody> 	
									  </table>
									  <?php }else{?>
									    <div>No hay resultados </div>
									   <?php }?>
									  <div class="col-md-12 pull-right">
									   Fecha de generación Reporte: <?php echo date('Y-m-d H:i:s');?>				
									  </div>
									</div>
								</div>
							</div><!--.invoice-body-->
						 <?php
						   		break;
						   }//fin switch
						 ?>
						</div><!--.invoice-->

					</div><!--.panel-body-->
				</div><!--.panel-->
			</div><!--.col-md-12-->
		</div><!--.row-->
	</div><!--.content-->

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
