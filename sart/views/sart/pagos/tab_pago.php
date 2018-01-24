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
     $ultimop=$datamov->ultimo_pago;
     if($taller>1){
       $clastipop='';
     }else{
      $clastipop='disabled';
     }
 if($propietario){
  $dataprop = $propietario->row();
  $nombre=$dataprop->id_prop.'-'.$dataprop->nombre.' '.$dataprop->apellidos.', telefono: '.$dataprop->telefono.', Dir: '.$dataprop->direccion;
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
 ?>
   <div class="row example-row ">
    <!--<div class="col-md-3">Justified Tabs</div>.col-md-3-->
    <div class="col-md-12">

      <ul class="nav nav-tabs tabs-active-border-indigo tabs-active-text-indigo nav-justified" role="tablist">
        <li class="active lir_tab"><a href="#rec_tab" id="recibotab" data-toggle="tab">Recibo</a></li>
        <li class="lid_tab"><a href="#desc_tab" id="adestab" class="no_cuota">Descuento</a></li>
        <li><a href="#tab4_3" data-toggle="tab">Documentos</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="rec_tab">
         <form id="form_diariomovil" class="margin_0 form-horizontal"  onsubmit="return false;">
          <div class="form-content">
            <div class="row">
             <div class="col-md-8 col-xs-8">
               <div class="col-md-6 col-xs-6">
                <div class="form-group">
                  <div class="radioer radioer-indigo form-inline">
                    <input type="radio" name="tipof" class="tallervalor" data-vtaller="<?php echo $vrdia;?>" checked id="diariof" value="diarios">
                    <label for="diariof">Diarios</label>
                  </div>
                  <div class="radioer radioer-indigo form-inline hide <?php echo $clastipop ?>">
                    <input type="radio" name="tipof" class="tallervalor" <?php echo $clastipop ?> data-vtaller="<?php echo $vtaller;?>" id="tallerf" value="taller">
                    <label for="tallerf">Taller</label>
                  </div>
                </div><!--.form-group-->
              </div>
                <div class="col-md-6 col-xs-6" style="padding-left: 0px;">
                 <a class="btn demo-btn-loading btn-default btn-success btn-ripple grabadiario " 
                    data-loading-text="Guardando..." >
                  <span class="ion-android-print"></span> 
                  Imprimir
                 </a>
               </div>
              </div>
              
              <div class="col-md-8 col-xs-8">
              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label class="control-label">Fecha saldo</label>
                  <div class="inputerx">
                      <?php echo date('d/m/Y',strtotime($pago_hasta));?>
                  </div>
                </div><!--.form-group-->
              </div>
               <div class="col-md-2 col-xs-2">
                <div class="form-group">
                  <label class="control-label">Dias mora</label>
                  <div class="inputerx">
                      <?php echo $mora;?>
                  </div>
                </div><!--.form-group-->
              </div>
               <div class="col-md-3 col-xs-3">
                <div class="form-group">
                  <label class="control-label">Mensualidad</label>
                  <div class="inputer inputer-indigo">
                    <div class="input-wrapper ">
                      <input type="number" min="1" name="cuota" id="cuota" autocomplete="off"  data-vdia="<?php echo $vrdia;?>" class="form-control cuota" style="margin-top: -4px;">
                      <input type="hidden" name="phasta" id="phasta" value="<?php echo $pago_hasta;?>" >
                      <input type="hidden" name="cuotav" id="cuotav" value="<?php echo $vrdia;?>" >
                      <input type="hidden" name="pagarnf" id="pagarnf" value="" >
                      <input type="hidden" name="pagaror" id="pagaror" value="" >
                      <input type="hidden" name="vadmint" id="vadmint" value="" >
                      <input type="hidden" name="vdiadm" id="vdiadm" value="<?php echo $admin;?>" >
                      <input type="hidden" name="vdiat" id="vdiat" value="<?php echo $vradia;?>" >
                      <input type="hidden" name="vradit" id="vradit" value="" >
                      <input type="hidden" name="id_movil" id="id_movil" value="<?php echo  $id_movil ?>" >
                      <input type="hidden" name="vdiataller" id="vdiataller" value="<?php echo $vtaller;?>" >
                      <input type="hidden" name="vdiaaporte" id="vdiaaporte" value="<?php echo $vaporte;?>" >
                      <input type="hidden" name="ndtaller" id="ndtaller" value="<?php echo $taller;?>" >

                      <input type="hidden" name="descampo" id="descampo" value="" >
                      <input type="hidden" name="descaplicado" id="descaplicado" value="0" >
                      <input type="hidden" name="id_desc" id="id_desc" value="" >
                    </div>
                  </div>
                </div><!--.form-group-->
              </div>
               <div class="col-md-3 col-xs-3">
                <div class="form-group">
                  <label class="control-label">Valor mes</label>
                  <div class="inputer vdia">
                    $ <?php echo number_format($vrdia,0,'.',',');?>
                  </div>
                </div><!--.form-group-->
              </div>
            </div>
            <div class="col-md-4 col-xs-4">
              <div class="col-md-12 col-xs-12" style="font-size:70px;margin-top: -30px;">
                <div class="form-group" style="margin-bottom:0px">
                  <label class="control-label">Total</label>
                </div><!--.form-group-->
              </div>
            </div>
           </div>
           <div class="row">
            <div class="col-md-8 col-xs-8">
              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label class="control-label">Ultimo pago</label>
                  <div class="inputer">
                    <?php 
                     if($ultimop != NULL and $ultimop != '0000-00-00'){
                        echo date('d/m/Y',strtotime($ultimop));
                     }else{
                        echo '';
                     }
                   ?>
                  </div>
                </div><!--.form-group-->
              </div>
               <div class="col-md-2 col-xs-2 hide">
                <div class="form-group">
                  <label class="control-label">Taller disp</label>
                  <div class="inputer">
                     <?php echo $taller;?>
                  </div>
                </div><!--.form-group-->
              </div>
               <div class="col-md-2 col-xs-2">
                <div class="form-group">
                  <div class="checkboxer checkboxer-indigo form-inline">
                    <input type="checkbox" id="dctock" disabled="disabled" value="descuento">
                    <label for="dctock">Dcto</label>
                  </div>
                </div><!--.form-group-->
              </div>
               <div class="col-md-3 col-xs-3">
                <div class="form-group">
                  <label class="control-label">Descuento</label>
                  <div class="inputer">
                    <span class="dctoval">
                     $ 0.00
                      </span>
                  </div>
                </div><!--.form-group-->
              </div>
              </div>
              <div class="col-md-4 col-xs-4">
                <div class="col-md-12 col-xs-12" style="font-size:50px;margin-top: -20px;">
                  <div class="form-group">
                    <div class="inputer ">
                      $ <span class="apagar ">
                          0.00
                        </span>
                    </div>
                  </div><!--.form-group-->
                </div>
              </div>
              <div class="col-md-12 col-xs-12">
                <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
                     <tr class=" ">
                         <th width="70%"  class=" border_l_0 border_t_0">
                           <span style="padding-left:5px;padding-right:5px">Concepto pago</span>
                         </th>
                         <th  width="30%"  class=" border_l_0 border_t_0">
                           <span style="padding-left:5px;padding-right:5px">Valor</span>
                         </th>
                     </tr>
                   <tbody id="global_table_list_items_properties_items_detail">
                     <?php
                     if($valores){
                       $totalcon=0;
                       foreach ($valores -> result() as $rowval) {
      
                        if($radio=='si'){
                          $idtip=3;
                        }else{
                          $idtip=2;
                        }
                        if($rowval->tipo==1/*<$idtip*/){
                         $totalcon+=$rowval->valor;   
                     ?>                      
                     <tr class="fconcepto">
                        <td width="70%"  class="  border_t_0">
                          <span style="color: #999;"><?php echo $rowval->detalle_concepto;?></span>
                        </td>
                        <td  width="30%"  class="  border_t_0">
                          <span style="color: #999;">$ <?php echo number_format($rowval->valor,0,'.',',');?>
                        </td>
                      <?php
                        }
                      ?>
                         
                     </tr>
                      <?php
                        if($rowval->tipo==4){
                      ?>
                     <tr class="ftaller ">
                        <td width="70%"  class="  border_t_0">
                          <span style="color: #999;"><?php echo $rowval->detalle_concepto;?></span>
                        </td>
                        <td  width="30%"  class="  border_t_0">
                          <span style="color: #999;" >$ <?php echo number_format($rowval->valor,0,'.',',');?>
                        </td>
                      <?php
                        $totalcon+=$rowval->valor; 
                        }
                      ?>
                         
                     </tr>

                     <?php
                        }
                     }
                     ?>
                     <tr class=" ">
                        <td width="70%"  class="  border_t_0">
                          <span style="" class="pull-right">Total</span>
                        </td>
                        <td  width="30%"  class="  border_t_0">
                          <span style="" class="vtotalconcx">$ <?php echo number_format($totalcon,0,'.',',');?>
                        </td>
                     </tr>
                   </tbody>
                 </table>
              </div>  
            </div>
          </div><!--.form-content-->
         </form>

        </div><!--.tab-pane-->
        <div class="tab-pane" id="desc_tab">
         <div class="row">
          <form id="form_descmovil" class="margin_0 form-horizontal"  onsubmit="return false;">
          <input type="hidden" name="id_movild" value="<?php echo $id_movil ?> " >
           <input type="hidden" name="tmora" value="<?php echo $mora ?> " >

             <div class="col-md-12 col-xs-12">
             <li>Concepto</li>
            <div class="col-md-9"> 
             <div class= "inputer iputer-indigo" style="margin-bottom: 20px;">
               <div class="input-wrapperx"> 
                <textarea class="form-control js-auto-size" rows="1" name="concepto_descuento" placeholder="Escriba aqui su Concepto"></textarea>
                
                </div>
              </div> 
             </div>
            
              <div class="col-md-3 col-xs-3" style="padding-left:0px;">
               <a class="btn demo-btn-loading btn-default btn-success btn-ripple pull-right grabadescuento " 
                  data-loading-text="Guardando..." >
                 <span class="ion-android-print"></span> 
                 Guardar
             </a>
            </div> 
                <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
                   <tr class=" ">
                       <th width="40%"  class=" border_l_0 border_t_0">
                         <span style="padding-left:5px;padding-right:5px">Concepto pago</span>
                       </th>
                       <th  width="20%"  class=" border_l_0 border_t_0">
                         <span style="padding-left:5px;padding-right:5px">subtotal</span>
                       </th>
                        <th  width="20%"  class=" border_l_0 border_t_0">
                         <span style="padding-left:5px;padding-right:5px">descuento</span>
                       </th>
                        <th  width="20%"  class=" border_l_0 border_t_0">
                         <span style="padding-left:5px;padding-right:5px">total</span>
                       </th>                                                
                 <tbody id="global_table_list_items_properties_items_detail">
                   <?php
                   if($valores){
                     $totalcon=0;
                     foreach ($valores -> result() as $rowval) {
                      if($radio=='si'){
                        $idtip=3;
                      }else{
                        $idtip=2;
                      }
                      if($rowval->tipo==1){
                       $totalcon+=$rowval->valor;   
                   ?>                      
                   <tr class="fconcepto">
                      <td width="40%"  class="  border_t_0">
                        <span style="color: #999;"><?php echo $rowval->detalle_concepto;?></span>
                      </td>
                      <td  width="20%"  class="  border_t_0">
                        <span style="color: #999;" class="vdtotal<?php echo $rowval->id_con_pago;?>"><?php //echo number_format($rowval->valor * $mora,0,'.',',');?></span>
                         <input type="hidden" name="vdiatotal<?php echo $rowval->id_con_pago;?>" id="vdiatotal<?php echo $rowval->id_con_pago;?>" value="" >
                      </td>
                       <td width="20%"  class="  border_t_0">
                        <span style="color: #999;">
                        <div class="input-group">
                          
                          <div class="inputer inputer-indigo">

                            <div class="input-wrapper ">
                              <input type="text" name="v_descuento<?php echo $rowval->id_con_pago;?>" id="v_descuento" autocomplete="off"   class="form-control calcula_des" data-idcod="<?php echo $rowval->id_con_pago;?>" style="margin-top: -4px;">
                            </div>
                          </div>
                          <span class="input-group-addon">%</span>
                          </div>
                        </span>
                      </td>
                      <td  width="20%"  class="  border_t_0">
                        <span style="color: #999;" class="total_des<?php echo $rowval->id_con_pago;?> "></span>
                        <span style="color: #999;" class="total_desnf<?php echo $rowval->id_con_pago;?> vsubtotnf hide">0</span>
                      </td>          
                    <?php
                      }
                    ?>
                       
                   </tr>
                   <?php
                      }
                   }
                   ?>
                   <tr class=" ">
                      <td width="70%" colspan="3"  class="  border_t_0">
                        <span style="" class="pull-right">Total</span>
                      </td>
                      <td  width="30%"  class="  border_t_0">
                        <span style="" class="vtotalconc">$ 0</span>
                        <input type="hidden" name="vtotalconctext" id="vtotalconctext" value="" >
                      </td>
                   </tr>
                 </tbody>
               </table>
            </div>
            </form>  
          </div>
        </div><!--.tab-pane-->
        <div class="tab-pane" id="tab4_3">
         <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size: 13px;" >
             <tr class=" ">
                 <th width="5%"  class="  border_t_0">
                   <span style="padding-left:5px;padding-right:5px">Cod</span>
                 </th>
                 <th width="30%"  class=" border_l_0 border_t_0">
                   <span style="padding-left:5px;padding-right:5px">Descripci&oacute;n</span>
                 </th>
                 <th  width="16%"  class=" border_l_0 border_t_0">
                   <span style="padding-left:5px;padding-right:5px">Expedici&oacute;n</span>
                 </th>
                 <th  width="16%"  class=" border_l_0 border_t_0">
                   <span style="padding-left:5px;padding-right:5px">Vencimiento</span>
                 </th>
                 <th width="21%" class=" border_l_0 border_t_0">
                   <span style="padding-left:5px;padding-right:5px">N&uacute;mero</span>
                 </th>
                 <th width="17%" class=" border_l_0 border_t_0">
                   <span style="padding-left:5px;padding-right:5px">Estado</span>
                 </th>
             </tr>
           <tbody id="global_table_list_items_properties_items_detail">
             <?php
             if($docv){
               $i=0;
               foreach ($docv -> result() as $rowdosv) {
                 if(($rowdosv->fecha_exp !=NULL) and ($rowdosv->fecha_exp !='0000-00-00')){
                   $fini=date('m/d/Y',strtotime($rowdosv->fecha_exp));
                 }else{
                   $fini="";
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
                 <td width="5%"  class="  border_t_0">
                   <span style="color: #999;"><?php echo $rowdosv->id_documento;?></span> 
                 </td>
                 <td width="30%"  class="  border_t_0">
                   <span style="color: #999;"><?php echo $rowdosv->descripcion;?></span>
                 </td>
                 <td  width="16%"  class="  border_t_0">
                   <span style="color: #999;"><?php echo $fini;?>
                 </td>
                 <td  width="16%"  class="  border_t_0">
                  <span style="color: #999;"><?php echo $ffin ;?>                                           
                  </span>
                 </td>
                 <td width="21%" class="  border_t_0">
                   <span style="color: #999;"><?php echo trim($numerodv);?>
                   </span>
                 </td>
                 <td width="17%" class="<?php echo $classtex;?> btn-flat ">
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
         <ul style="margin-top:8px">
          <li>Fecha contrato: <span style="color: #337ab7;font-style: italic;font-size: 14px;"><?php echo date('d/m/Y',strtotime($fcontrato))?></span></li>
          <?php if($propietario){ ?>
          <li>Propietario: <span data-geo="lng"><?php echo $nombre;?></span></li>
          <?php } ?>
           <?php if(isset($manager) && $manager  ){ ?>
          <li>Administrador: <span data-geo="lng"><?php echo $nombrea;?></span></li>
          <?php } ?>
          <!-- <li>Address: <span data-geo="formatted_address">111 Broadway, New York, NY 10006, EE. UU.</span></li> -->
        </ul>
        </div><!--.tab-pane-->
      </div><!--.tab-content-->
    </div><!--.col-md-12-->
   </div><!--.row-->
   <?php }else{ ?>

   <div class="col-md-9">
      <h1>Movil No existe</h1>
   <script>
      $(document).ready(function () {
       $('#placa').val('');
      });
   </script>
   </div>

  <?php $placa='';
        $id_movil='';
   }  ?>
   <script>
	  	$(document).ready(function () {
        Pleasure.init();
        Layout.init();
       $('#placa').val('<?php echo $placa;?>');
       $('#buscamov').val('<?php echo $id_movil;?>');
      });
   </script>
