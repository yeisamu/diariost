<?php 
$numlic='';
$cat='';
$vencelic='';
$firmauser='';
if($empresa){
  $dataemp = $empresa->row();
 
 }
 if($user){
	$datauser = $user->row();
     $firmauser=$datauser->firma;
   }
 if($tarjeta){

  $datatarjeta = $tarjeta->row();
   if($datatarjeta->documento=='LICENCIA DE CONDUCCION'){
	   $numlic=$datatarjeta->codigo;
	   $cat=$datatarjeta->numero;
	   $vencelic=$datatarjeta->fecha_vence;
   }
 }

?>
<!DOCTYPE html>
<html>
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

	<style type="text/css">
		.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
		    border: none !important;
		    font-size: 14px;
		    padding: 10px;
		}
		.altofil {
			height: 60px;
		}
		body{
			font-size: 15px;
		}
		.table-bordered{
    		border: none !important;
		}
	</style>
 </head>
<body>
	<table>
    	<tr>
    		<td width="54%">
    			<table>
    				<tr>
						<td   style="text-align:center"><div style="font-size: 18px;padding:0mm 20mm 0 70mm;color:#FFF">tarje</div></td>
					    <td   style="text-align:center;padding:0mm 20mm 0 70mm;">
							<div style="color:#FFF">control</div>
							<div style="font-size: 18px;padding:0mm 10mm 15mm 70mm;float:right"><?php echo $datatarjeta->id_tarjeta; ?></div>
						    
							
							<div style="color:#FFF">control</div>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2"  style="padding:0mm 2mm 0 78mm;">
						  <img src="fotos/<?php echo $datatarjeta->foto?>" width="30mm" height="50mm">
						</td>
    				</tr>
					<tr>
    					<td colspan="2">
    						<table   width="90%" border="0" class="table table-bordered" style="font-size:16px;margin-top:29mm"> 
    						   <tr>
    							<td colspan="3" style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black;">
    								<strong ><?php echo $datatarjeta->nombres?></strong>
    							</td>   							
    						   </tr>
    						   <tr>
    							<td colspan="3" style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
    								<strong ><?php echo $datatarjeta->apellidos?></strong>
    							</td>   							
    						   </tr>
    						   <tr>
    							<td style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
    								<strong ><?php echo $datatarjeta->codigo?></strong>
    							</td>  
    							<td colspan="2" style="height:10mm;padding:3mm 0 0 40mm;border: 0px none black">
    								<strong ><?php echo $datatarjeta->tipo_rh?></strong>
    							</td>   							
    						   </tr>
    						    <tr>
    							<td style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
									<strong><?php echo $numlic?></strong></div>
    							</td>  
    							<td style="height:10mm;padding:3mm 0 0 40mm;border: 0px none black">
									<strong><?php echo $cat?></strong></div>
    							</td>  
    							<td style="height:10mm;padding:3mm 0 0 10mm;border: 0px none black">
									<strong><?php echo $vencelic?></strong></div>
    							</td>   							
    						   </tr>
    						      <tr>
    						   	<td colspan="2" style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
    						   		<strong ><?php echo $datatarjeta->direccion?></strong>
    						   	</td>   							
    						   	<td style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
    						   		<strong ><?php echo $datatarjeta->telefono?></strong>
    						   	</td>  
    						      </tr>
                                  <tr>
                                 <td style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
                                    <strong><?php echo $datatarjeta->eps?></strong>
                                </td>  
                                <td  style="height:10mm;padding:3mm 0 0 10mm;border: 0px none black">
                                    <strong><?php echo $datatarjeta->arl?></strong>
                                </td>   
								<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black">
                                    <strong><?php echo $datatarjeta->afp?></strong>
                                </td>                            
                               </tr> 
    						</table>
    					</td>
    				</tr>
					<?php 
					if($veh_doc[$datatarjeta->id_movil]){
						foreach ($veh_doc[$datatarjeta->id_movil]->result() as $docs) {
							if($docs->id_documento=='01'){
								$soat=$docs->numero;
								$fsoat=$docs->fecha_ven;
							}
							if($docs->id_documento=='02'){
								$top=$docs->numero;
								$ftop=$docs->fecha_ven;
							}
							if($docs->id_documento=='03'){
								$contra=$docs->numero;
								$fcontra=$docs->fecha_ven;
							}
							if($docs->id_documento=='04'){
								$certimov=$docs->numero;
								$fcertimov=$docs->fecha_ven;
							}
						}
					}
                    ?>
    				<tr>
					 <td colspan="2" style="height:40px">
    				  <table   width="90%" class="table table-bordered" style="margin-top:38mm;font-size:16px">
    				   <tr>
					   <td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black"><strong><?php echo $datatarjeta->marca?></strong>
					    </td>
						<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black" ><strong><?php echo $datatarjeta->modelo?></strong></td> 
    				   </tr>
    				   <tr>
					   <td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black" ><strong><?php echo $datatarjeta->placa?></strong></td>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black"><strong><?php echo $datatarjeta->id_movil?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black" ><strong><?php echo $certimov?></strong></td>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black"><strong> <?php echo $fcertimov?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black" ><strong><?php echo $soat?></strong></td>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black"><strong><?php echo $fsoat?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black" ><strong><?php echo $contra?></strong></td>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black"><strong><?php echo $fcontra?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black" ><strong><?php echo $top?></strong></td>
    					<td  style="height:10mm;padding:3mm 0 0 5mm;border: 0px none black"><strong><?php echo $ftop?></strong></td>
    				   </tr>
    				  </table>
    				 </td>
    				</tr>
				</table>
			</td>
			<td width="2%"></td>
    		<td width="54%">
    			<table class=" table-borderedx" style="font-size: 14px;" >
    			   <!--tr>
    				<th style="height:25px;padding:0mm 0 0 30mm;position: absolute;top: 10mm;color:#FFF;">&nbsp;FECHA DE VENCIMIENTO</th>
    			   </tr-->
				   <tr>
    				<th>
    					<table class="table table-bordered">
    					  <tr>
    						<td width="30%"  style="height:1mm;padding:0mm 0 0 5mm;border: 0px none black;color:#FFF">&nbsp;fecha ref</td>
    						
    						<td width="30%" style="height:1mm;padding:0mm 0 0 5mm;border: 0px none black;color:#FFF">&nbsp;AÑO</td>
    						<td width="40%" style="height:1mm;padding:0mm 0 0 5mm;border: 0px none black;color:#FFF">&nbsp;FIRMA </td>
    					  </tr>
						  <?php 
						  //$datatarjeta->planilla=1;
						  for($i=0;$i<13;$i++){ 
							  if(($i+1)==$datatarjeta->planilla){
						 $fecharef=date('d-m-Y',strtotime($datatarjeta->fecha_elab));
						 $fechavig=date('d-m-Y',strtotime($datatarjeta->fecha_vigencia));
						   ?>
    					  <tr>
    					    <td class="altofil" style="height:8mm;padding:3mm 0 0 5mm;border: 0px none black;width:30mm" ><?php echo $fecharef;?></td>
							<td class="altofil" style="height:8mm;padding:3mm 0 0 15mm;border: 0px none black;width:30mm" ><?php echo $fechavig;?></td>
    					    <td class="altofil" style="height:8mm;padding:3mm 0 0 5mm;border: 0px none black;width:40mm">
							<?php if($firmauser!=''){ ?>	
								<img src="uploads/firmas/<?php echo $firmauser;?>" width="120px" height="8mm">
							<?php } ?>
							</td>
    					  </tr>
						  <?php }else{ ?>
						  <tr>
    					    <td class="altofil" style="height:8mm;padding:3mm 0 0 5mm;border: 0px none black" >&nbsp;</td>
							<td class="altofil" style="height:8mm;padding:3mm 0 0 5mm;border: 0px none black" >&nbsp;</td>
    					    <td class="altofil" style="height:8mm;padding:3mm 0 0 5mm;border: 0px none black">&nbsp;</td>
    					  </tr>
						   <?php } ?>
						  <?php } ?>
						  <tr>
    					    <td class="altofil" style="height:110mm;border: 0px none black;" >&nbsp;</td>
    					  </tr>
						  
						</table>
					</th>
				   </tr>
				</table>
			</td>
    	</tr>
    </table>
</body>
</html>