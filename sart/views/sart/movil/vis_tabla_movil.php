<?php 
date_default_timezone_set('America/Bogota');
                    if($result){
                        foreach ($result->result() as $array) {

                    ?>
                    <!--   -->
                      <tr class="cursorcito abre_mod_global " data-capa='taxi_modal'
                          data-toggle="modal" style="cursor:pointer" 
                          data-target="#modaltaxi" data-vars="<?php echo base_url() ?>sart.php/sistemasart/taximodal?tipo=edit&id_movil=<?php echo $array->id_movil; ?>&app_ID=<?php echo $app_ID; ?>"
                      >
                        <td width="4%" class="center"
                             style="border-bottom: 1px solid #ddd; !important;border-top:none;text-align:center;word-break: break-all;">
                          <div class="" style="margin-bottom:5px;">
                            <span style="margin: 0px; color:#1F1F21;"><?php echo $array->id_movil; ?></span>
                          </div>
                          
                        </td>
                        
                        <td width="6%" class="center" 
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;text-align:center">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->placa; ?></span>
                        </td>
                        <!-- <td width="6%" class="center"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;text-align:center">
                           <span style="margin: 0px; color:#1F1F21;"><?php //echo $array->grupo; ?></span>
                        </td> -->
                        <td width="8%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->id_prop; ?></span>
                        </td>
                        <td width="20%" class=""
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->nombre.' '.$array->apellidos; ?></span>
                           <?php 
                            if($array->id_prop!=''){ 
                          ?>
                          <i class="fa fa-pencil   hover_s  tooltip_vu abre_edit pull-right" style="cursor:pointer"
                          data-placement="left" title="Modificar"  data-toggle="modal" data-target="#edit_doc"
                          data-vars="<?php echo base_url() ?>sart.php/sistemasart/editarprop?id_prop=<?php echo $array->id_prop ?>&tipo=edit&menu=vehi"></i>
                          <?php 
                           }
                          ?>
                        </td>
                        <td width="18%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->direccion; ?></span>
                        </td>
                        <td width="8%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->telefono; ?></span>
                        </td>
                        <td width="8%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->email; ?></span>
                        </td>
                        <td width="8%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo date('d-m-Y',strtotime($array->fcontrato)); ?></span>
                        </td>
                        <!--td width="8%" class=""
                            style="padding-right:14px;word-break: break-all;border: 1px solid #ddd;border-top:none;">
                          <span style="margin: 0px; color:#1F1F21;"><?php //echo date('d-m-Y',strtotime($array->pago_hasta)); ?></span>
                        </td>
                        <td width="5%" class="center"
                            style="padding-right:14px;word-break: break-all;border-bottom: 1px solid #ddd;border-top:none;">
                         
                           <?php 
                         /*  if($array->mora<=0){
                             $color="#1F1F21";
                           }else{
                             $color="#CC0000";
                           }*/
                          ?>
                         <span style="margin: 0px; color:<?php //echo $color?>;"><?php //echo $array->mora; ?></span>
                        </td-->
                       </tr>
                    <?php
                        }
                    }else{ ?>
                      <tr class="">
                          <td colspan="5" class="border_b_0  border_t_0 padding_0" style="padding: 0;">
                             <div class="nofound_div_main " style="padding:10px 0px 10px 30px;background: white !important;">
                                <div class="" style="color:#000000;">                                                                              
                                  No se han encontrado resultados para tu búsqueda                                                                             
                                </div><br> 
                                <div class="" style="color:#000000;">
                                  <strong>                                                                          
                                 (<?php echo $search; ?>)
                                 </strong>  
                               </div>
                                <br>                                                                             
                                <div class="">                                                                              
                                   Sugerencias:                                                                            
                                </div><br>                                                                            
                                <div>                                                                            
                                   <ul>                                                                            
                                      <li>Asegúrate de que todas las palabras estén escritas correctamente</li>                                                                             
                                      <li>Prueba diferentes palabras clave.</li>                                                                             
                                      <li>Prueba palabras clave más generales.</li>                                                                             
                                   </ul>                                                                           
                                </div>                                                                                                                                        
                             </div>
                          </td>
                       </tr> 
              <?php 
                   }
              ?>
<script type="text/javascript">
  sart.page  = '<?php echo $page; ?>';
  sart.pages = '<?php echo $pages; ?>';
  $('#cant_doc').html('(<?php echo $iTotal; ?>) Vehiculos');
   ///pagination_vars2('page_vehiculo', 'pages_movil', <?php echo $page; ?>, <?php echo $pages; ?>, <?php echo $iTotal; ?>, '#total_movil', 'Vehiculo(s)');
</script>
