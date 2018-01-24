<?php 
date_default_timezone_set('America/Bogota');
                    if($result){
                        foreach ($result->result() as $array) {

                    ?>
                    <!--   -->
                      <tr class="cursorcito abre_edit " data-capa='taxi_modal'
                          data-toggle="modal" style="cursor:pointer" 
                          data-target="#edit_doc" data-vars="<?php echo base_url() ?>sart.php/sistemasart/editarprop?id_prop=<?php echo $array->id_prop ?>&tipo=edit&app_ID=<?php echo $app_ID; ?>&menu=prop"
                      >
                         <td width="8%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->id_prop; ?></span>
                        </td>
                        <td width="8%" class="hidden-xs"
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo date('d-m-Y',strtotime($array->fecha_exp)); ?></span>
                        </td>
                        <td width="20%" class=""
                            style="word-break: break-all;border: 1px solid #ddd;border-top:none;">
                           <span style="margin: 0px; color:#1F1F21;"><?php echo $array->nombre.' '.$array->apellidos; ?></span>
                           
                        </td>
                         <td width="8%" class=""
                            style="padding-right:14px;word-break: break-all;border: 1px solid #ddd;border-top:none;">
                          <span style="margin: 0px; color:#1F1F21;"><?php echo date('d-m-Y',strtotime($array->fecha_nac)); ?></span>
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
  sgcapp.page  = '<?php echo $page; ?>';
  sgcapp.pages = '<?php echo $pages; ?>';
  $('#cant_doc').html('(<?php echo $iTotal; ?>) Propietarios');
   ///pagination_vars2('page_vehiculo', 'pages_movil', <?php echo $page; ?>, <?php echo $pages; ?>, <?php echo $iTotal; ?>, '#total_movil', 'Vehiculo(s)');
</script>
