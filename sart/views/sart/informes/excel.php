<?php 
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=reporte_docs.xls");
header("Pragma: no-cache");
header("Expires: 0");


?>
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
									 
