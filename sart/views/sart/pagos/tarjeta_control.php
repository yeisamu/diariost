<?php 

if($empresa){
  $dataemp = $empresa->row();
 
 }
 if($tarjeta){
  $datatarjeta = $tarjeta->row();
 
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
		    border: 1px solid #000000 !important;
		    font-size: 18px;
		    padding: 10px;
		}
		.altofil {
			height: 60px;
		}
		body{
			font-size: 15px;
		}
	</style>
 </head>
<body>
    <table>
    	<tr>
    		<td width="54%">
    			<table>
    				<tr>
    					<td colspan="2">
    						<h3 style="font-size: 24px"><strong>TARJETA DE CONTROL #<?php echo $datatarjeta->id_tarjeta; ?></strong></h3>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td width="30%"  style="height:130px">
    						<img src="img/cespedes.png" width="140" height="180">
    					</td>
    					<td align="center" width="70%">
    						<div >
  					 		<div style="text-align:center;font-size: 25px;"><strong><?php echo  $dataemp->nombre ?></strong></div>
  							<div style="font-size: 15px;text-align:center">NIT:<?php echo  $dataemp->nit ?></div>
  							<!--div style="font-size: 15px;text-align:center"><?php echo  $dataemp->direccion ?></div-->
  							<div style="font-size: 10px;text-align:center"><span ><?php echo  $dataemp->email ?></span></div>

  					 	</div>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td align="center" colspan="2">
    						<div >
  					 		<div style="text-align:center">OFICINA: Calle 34 # 35-05 Tel: 2316122</div>
  							</div>
  							
  					 	</div>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td colspan="2">
    						<span style="font-size: 35px;padding-top:60px"><strong>PBX : 224 2424</strong> <img src="img/wsap.png" width="20" height="20"><span style="font-size: 13px"><strong>318 540 7559</strong> </span></span>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td colspan="2">
    						<table   width="90%" style="padding-top:60px">
    						   <tr>
    							<th width="50%" align="center">
    								<div style="text-align:center;font-size:30px">MOVIL #</div>
    								<div style="text-align:center;font-size:65px;color:#bd0000"><?php echo  $datatarjeta->id_movil ?></div>
    							</th>
    							<th width="50%" align="right" style="" height="180">
                                   
    								<div style="border:1px solid #000000;width:60px;height:90px">
                                        <img src="../sar/fotos/<?php echo  $datatarjeta->codigo ?>.jpg" width="150" height="180">                       
                                    </div>
    							</th>
    						   </tr>
    						</table>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td colspan="2" align="center" style="height:25px"><span style="text-align:center;font-size:17px"><strong>DATOS PERSONALES</strong></span></td>
    				</tr>
    				<tr>
    					<td colspan="2">
    						<table   width="90%" class="table table-bordered" style="font-size:20px">
    						   
    						   <tr>
    							<td colspan="3" style="height:35px;margin-left;10px:padding:20px">
    								&nbsp;Nombre: <strong><?php echo $datatarjeta->nombre1." ".$datatarjeta->nombre2?></strong>
    							</td>   							
    						   </tr>
    						   <tr>
    							<td colspan="3" style="height:35px">
    								&nbsp;Apellido: <strong><?php echo $datatarjeta->apellido1." ".$datatarjeta->apellido2?></strong>
    							</td>   							
    						   </tr>
    						   <tr>
    							<td style="height:35px">
    								&nbsp;CC: <strong><?php echo $datatarjeta->codigo?></strong>
    							</td>  
    							<td colspan="2" style="height:35px">
    								&nbsp;Grupo sanguineo: <strong><?php echo $datatarjeta->tipo_rh?></strong>
    							</td>   							
    						   </tr>
    						    <tr>
    							<td style="height:35px">
    								<div>&nbsp;Licencia de conducción:</div>
    								<div>&nbsp;<strong><?php echo $datatarjeta->numero?></strong></div>
    							</td>  
    							<td style="height:35px">
    								<div>&nbsp;Cat:</div>
    								<div>&nbsp;<strong><?php echo $datatarjeta->categoria?></strong></div>
    							</td>  
    							<td style="height:35px">
    								<div>&nbsp;Vencimiento:</div>
    								<div>&nbsp;<strong><?php echo $datatarjeta->fecha_vence?></strong></div>
    							</td>   							
    						   </tr>
    						      <tr>
    						   	<td colspan="2" style="height:35px">
    						   		&nbsp;Dirección: <strong><?php echo $datatarjeta->direccion?></strong>
    						   	</td>   							
    						   	<td style="height:35px">
    						   		&nbsp;Tel: <strong><?php echo $datatarjeta->telefono?></strong>
    						   	</td>  
    						      </tr>
                                  <tr>
                                 <td style="height:35px">
                                    &nbsp;EPS: <strong><?php echo $datatarjeta->eps?></strong>
                                </td>  
                                <td colspan="2" style="height:35px">
                                    &nbsp;ARL: <strong><?php echo $datatarjeta->arl?></strong>
                                </td>                               
                               </tr> 
    						</table>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td colspan="2" align="center" style="height:25px"><span style="text-align:center;font-size:17px"><strong>En caso de Accidente avisar A:</strong></span></td>
    				</tr>
    				<tr>
					 <td colspan="2" style="height:25px">
    				  <table   width="90%" class="table table-bordered">
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;<?php echo $datatarjeta->acudiente?></td>
    					<td  style="height:35px">&nbsp;Celular: <?php echo $datatarjeta->telefonoa?></td>
    				   </tr>
    				  </table>
    				 </td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:25px"></td>
    				</tr>
    				<tr>
    					<td colspan="2" align="center" style="height:25px"><span style="text-align:center;font-size:17px"><strong>DATOS DEL VEHICULO</strong></span></td>
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
					 <td colspan="2" style="height:25px">
    				  <table   width="90%" class="table table-bordered">
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;PLACA: <strong><?php echo $datatarjeta->placa?></strong></td>
    					<td  style="height:35px">&nbsp;MARCA: <strong><?php echo $datatarjeta->marca?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;MODELO: <strong><?php echo $datatarjeta->modelo?></strong></td>
    					<td  style="height:35px">&nbsp;MOVIL: <strong><?php echo $datatarjeta->id_movil?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;Rev. tecnicomecanica <strong><?php echo $certimov?></strong></td>
    					<td  style="height:35px">&nbsp;VCTO: <strong> <?php echo $fcertimov?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;SOAT <strong><?php echo $soat?></strong></td>
    					<td  style="height:35px">&nbsp;VCTO: <strong><?php echo $fsoat?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;Seguro RCC/RCE N° <strong><?php echo $contra?></strong></td>
    					<td  style="height:35px">&nbsp;VCTO: <strong><?php echo $fcontra?></strong></td>
    				   </tr>
    				   <tr>
    					<td  style="height:35px" width="60%">&nbsp;Tarjeta OpEracion N° <strong><?php echo $top?></strong></td>
    					<td  style="height:35px">&nbsp;VCTO: <strong><?php echo $ftop?></strong></td>
    				   </tr>
    				  </table>
    				 </td>
    				</tr>
    				<tr>
    					<td colspan="2" style="height:50px"></td>
    				</tr>
    				<tr>
    					<td colspan="2" align="center" style="height:25px"><span style="text-align:center;font-size:11px">Esta tarjeta sera de carácter permanente individual e instransferible. </span></td>
    				</tr>
					<tr>
    					<td colspan="2" align="center" style="height:25px"><span style="text-align:center;font-size:11px">El conductor portara esta tarjeta en lugar</span></td>
    				</tr>
    				<tr>
    					<td colspan="2" align="center" style="height:25px"><span style="text-align:center;font-size:11px">visible dentro del vehiculo Art  48 y 51, Decreto 172 del 2001</span></td>
    				</tr>
    			</table>
    		</td>
    		<td width="2%"></td>
    		<td width="54%">
    			<table class="table table-bordered" style="font-size: 18px;" >
    			   <tr>
    				<th align="center">&nbsp;FECHA DE VENCIMIENTO</th>
    			   </tr>
    			   <tr>
    				<th>
    					<table class="table table-bordered">
    					  <tr>
    						<td width="10%">&nbsp;DIA</td>
    						<td width="10%">&nbsp;MES</td>
    						<td width="15%">&nbsp;AÑO</td>
    						<td >&nbsp;FIRMA Y SELLO DE LA EMPRESA</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					  <tr>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					    <td class="altofil" height="40px">&nbsp;</td>
    					  </tr>
    					</table>
    					<table class="table table-bordered" style="font-size: 18px;" >
		    			   <tr>
		    				<th align="center">&nbsp;TARIFAS URBANAS</th>
		    			   </tr>
		    			</table>
		    			<table class="table table-bordered" style="font-size: 18px;" >
                        <?php 
                            foreach ($tarifas->result() as $value) {
                              
                        ?>
                           <tr>
                            <td align="left" class="altofil" height="45px">&nbsp;$ <?php echo number_format($value->tarifa,0,'.',',');?></td>
                            <td class="altofil" height="45px">&nbsp;<?php echo $value->concepto;?></td>
                           </tr>
                        <?php 
                            }
                        ?>
		    			</table>
    				</th>
    			   </tr>
    			</table>
    		</td>
    	</tr>
    </table>
</body>
</html>