  <?php
  defined('BASEPATH') OR exit('No direct script access allowed');
  date_default_timezone_set('America/Bogota');
  if($permisos){
  $dataper=$permisos->row();
  $leer=$dataper->leer;
  $borrar=$dataper->borrar;
  $editar=$dataper->editar;
  $crear=$dataper->crear;
}
if($editar=='no'){
  $readonly='readonly';
}else{
  $readonly='';
}

  if($tipo=='edit'){
   //if($vehi){
     $titulo="Modificar movil";

    $datamov = $vehi->row();
    $id_movil=$datamov->id_movil;
    $placa=$datamov->placa;
    $modelo=$datamov->modelo;
    $grupov=$datamov->grupo;
    $marcav=$datamov->id_marca;
    $referencia=$datamov->referencia;
    $clase=$datamov->clase;
    $linea=$datamov->referencia;
    $tipoc=$datamov->tipo;
    $combustible=$datamov->combustible;
    $motor=$datamov->motor;
    $serie=$datamov->serie;
    $dtaller=$datamov->cilindraje;
    $id_prop=$datamov->id_prop;
    $id_adm=$datamov->managerid;
    $pago_hasta=$datamov->pago_hasta;
    $fcontrato=$datamov->fcontrato;
    $radio=$datamov->radio;
    $estado=$datamov->estado;
    $anotaciones=$datamov->obs;
    $campoid='<span>'.$id_movil.'</span><input type="hidden"  name="idmovil" value="'.$id_movil.'" >';
    if(!isset($propietario)){
      $propietario="";
      $manager="";
      $id_prop="";
    }
    if(!isset($mananoedit)){

      $mananoedit="";

    }
  }else{ 
     $titulo="Agregar Nuevo movil";
     $id_movil="";
     $placa="";
     $grupov="";
     $marcav="";
     $modelo="";
     $referencia="";
     $clase="";
     $linea="";
     $tipoc="";
     $combustible="";
     $motor="";
     $serie="";
     $dtaller="";
     $id_prop="";
     $id_adm="";
     $pago_hasta="";
     $fcontrato="";
     $propietario="";
     $manager="";
     $anotaciones="";
     $campoid='<div class="inputer inputer-indigo floating-label">
                <div class="input-wrapper">
                 <input type="text" name="idmovil" placeholder="# Movil" class="form-control inpmobilex inputmobile_cborder obligatorio" value="" id="idmovil" >';
        if($id_movil==''){ 
         $campoid.='<label for="idmovil" class=""># Movil</label>';
         }
       $campoid.='</div>
                   </div>';

  }

   ?>  
      <style type="text/css">
      .dropdown-menu {
        z-index:9999;
      }
      </style>
      <div class="modal-header">
        <h4 class="modal-title"><?php echo $titulo?></h4>
      </div>
      <div class="modal-body padding_0" id="contienedata" style="overflow:hidden">
        <div class="row">
          <div class="col-md-12">
            <div class="panel">
              <div class="panel-body" style="padding-right:0px !important">
               <form id="form_movil" class="margin_0 form-horizontal">
                 <input type="hidden" value="<?php echo $tipo?>" name="tipo">
                 <div>
                                       <div class="col-md-5 padding_0 div_left div_form_tenant_left" style="border-top: 0px solid #eee;border-left: none;border-right: 1px solid #eee;border-bottom: none;position:relative; margin:0px auto; padding:0px; overflow: hidden;">
                                           <div class="scroll_left_block" style="position:relative; padding:0px; overflow: hidden;">
                                             <div class="col-md-12" style="font-size:17px">    
                                                 <div class="col-md-12 ">
                                                   <div class="form-group">
                                                       <div class="col-sm-12">
                                                         <?php 
                                                           echo $campoid;
                                                         ?>  
                                                       </div>
                                                     </div>
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
                                                        <div class="inputer inputer-indigo floating-label" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio obligatorio" placeholder="Placa" value="<?php echo $placa?>" name="placa" id="placa" >
                                                           <?php if($placa==''){ ?>
                                                            <label for="placa">Placa</label> 
                                                           <?php }?>

                                                         </div>
                                                        </div>
                                                       </div>
                                                     </div> 
                                                     <?php 
                                                       if($tipo=='nuevo'){
                                                         $estrigf="Fecha de vinculaci&oacute;n";
                                                         $valfecha=date('d-m-Y');
                                                         $valcontrato=date('d-m-Y');
                                                         $selfecha="divfecha";
                                                       }else{
                                                          if($placa==""){
                                                            $valfecha=date('d-m-Y');
                                                            $valcontrato=date('d-m-Y');
                                                            $selfecha="divfecha";	
                                                          }else{
                                                            $estrigf="Pago hasta";

                                                            $valfecha=$pago_hasta == '0000-00-00'?date('d-m-Y'):date('d-m-Y',strtotime($pago_hasta));
                                                            $valcontrato=$fcontrato == '0000-00-00'?date('d-m-Y'):date('d-m-Y',strtotime($fcontrato));
                                                            $selfecha="divfecha";
							                                            } 
                                                       }
                                                     ?>
                                                     <div class="form-group">
                                                      <label for="clase" class="col-sm-3 " style="padding-top: 7px;">Ingreso</label>
                                                       <div class="col-sm-9 <?php echo $selfecha ?> input-group" >
                                                        <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                                                        <div class="inputer inputer-indigo " style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                          <input type="text" readonly style="width: 200px" name="fechaing" id="fechaing" class="form-control bootstrap-daterangepicker-basicx" value="<?php echo $valfecha?>" />
                                                         </div>
                                                       </div>   
                                                       </div>
                                                     </div> 
                                                     <div class="form-group">
                                                      <label for="clase" class="col-sm-3 " style="padding-top: 7px;">Contrato</label>
                                                      <div class="col-sm-9 divfecha input-group" >
                                                       <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                                                       <div class="inputer inputer-indigo " style="margin-top:0px;">
                                                         <div class="input-wrapper">
                                                         <input type="text" name="fechacont" readonly class="form-control bootstrap-daterangepicker-basic" value="<?php echo $valcontrato?>" id="fechacont" style="cursor:pointer">
                                                         </div>
                                                       </div>  
                                                       </div>
                                                     </div> 
                                                     <?php 
                                                       $datagrupo=$grupo->row();
                                                     ?>
                                                      <input type="hidden" name="grupo" value="<?php echo $datagrupo->grupo ?>">


                                                    <!--  <div class="form-group has-indigo">
                                                       <div class="col-sm-12">
                                                             <select class="selecter selpop selobligatorio" name="grupo" id="grupo" data-style="btn-indigo" data-width="100%">
                                                                  <option selected="selected" value="">Empresa</option>
                                                              <?php 
                                                                //foreach ($grupo->result() as $datagrupo) {
                                                              ?>
                                                                  <option value="<?php //echo $datagrupo->grupo ?>" <?php //if(trim($grupov)==$datagrupo->grupo) echo'selected="selected"'?> > <?php //echo $datagrupo->grupo ?></option>
                                                             <?php
                                                               //}  
                                                             ?>
                                                            </select>
                                                       </div>
                                                     </div>  -->
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
							<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px">Modelo</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="Modelo" value="<?php echo $modelo?>" name="modelo" id="modelo" >
                                                           <?php if($modelo==''){ ?>
                                                            <!--label for="modelo" >Modelo</label-->
                                                           <?php }?>
                                                          </div>
                                                        </div>
                                                      </div>
                                                     </div>
                                                     <div class="form-group has-indigo">
                                                       <div class="col-sm-12">
                                                             <select class="selecter selpop selobligatorio" name="impmarca" data-style="btn-indigo" data-width="100%">
                                                                  <option selected="selected" value="">Marca</option>
                                                              <?php 
                                                                foreach ($marca->result() as $datamarca) {
                                                              ?>
                                                                  <option value=" <?php echo $datamarca->id_marca ?>"  <?php if($marcav==$datamarca->id_marca) echo'selected="selected"'?>> <?php echo $datamarca->marca ?></option>
                                                             <?php
                                                               }  
                                                             ?>
                                                            </select>
                                                       </div>
                                                     </div>
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px">Linea</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="Linea" value="<?php echo $referencia?>" name="linea" id="linea" >
                                                            <?php if($referencia==''){ ?>
                                                             <!--label for="linea" >Linea</label-->
                                                            <?php }?>  
                                                           </div>
                                                         </div>  
                                                       </div>
                                                     </div> 
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
							<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px">Clase</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="Clase" name="clase" value="<?php echo $clase?>" id="clase" >
                                                           <?php if($clase==''){ ?>
                                                            <!--label for="clase" >Clase</label-->
                                                           <?php }?>
                                                          </div>
                                                        </div>  
                                                       </div>
                                                     </div> 
                                                    
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
							<label for="clase" class="col-sm-6 " style="padding-top: 7px;padding-left:0px">Tipo Carroceria</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="Tipo Carroceria"  value="<?php echo $tipoc?>" name="tipoc" id="tipoc" >
                                                            <?php if($tipoc==''){ ?>
                                                             <!--label for="tipoc" >Tipo Carroceria</label-->
                                                            <?php }?>
                                                           </div>
                                                         </div>  
                                                       </div>
                                                     </div> 
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
							<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px">Combustible</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="Combustible" value="<?php echo $combustible?>" name="gas" id="combus" >
                                                            <?php if($combustible==''){ ?>
                                                             <label for="combus" >Combustible</label>
                                                            <?php }?>
                                                           </div>
                                                         </div>  
                                                       </div>
                                                     </div> 
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
							<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px"># Motor</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="# Motor" value="<?php echo $motor?>" name="motor" id="motor" >
                                                           <?php if($motor==''){ ?>
                                                            <label for="motor" ># Motor</label>
                                                           <?php }?>
                                                          </div>
                                                        </div>  
                                                         </div>
                                                     </div> 
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
							<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px"># Chasis</label>
                                                        <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                          <div class="input-wrapper">
                                                           <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorio" placeholder="# Chasis" name="chasis" value="<?php echo $serie?>" id="chasis" >
                                                            <?php if($serie==''){ ?>
                                                             <label for="chasis" ># Chasis</label>
                                                            <?php }?>

                                                            
                                                           </div>
                                                         </div>  
                                                        </div>
                                                     </div> 
                                                     <div class="form-group">
                                                      <div class="col-sm-12">
							<label for="clase" class="col-sm-3 " style="padding-top: 7px;padding-left:0px">Cilindraje</label>
                                                       <div class="inputer inputer-indigo floating-labelx" style="margin-top:0px;">
                                                         <div class="input-wrapper">
                                                         <input type="text" <?php echo $readonly;?> class="form-control inpmobilex inputmobile_cborder obligatorioX" value="<?php echo $dtaller?>" placeholder="cilindraje" name="cilindra"  id="cilindra" >
                                                         </div>
                                                       </div>  
                                                       </div>
                                                     </div> 
                                                 </div>
                                             </div>
                                           </div>
                                       </div>
                                       <div class="col-md-7  div_rightx  div_form_distributions_right" style="border-top: 0px solid #eee;border-left: 1px solid #eee;border-right: none;border-bottom: none;position:relative; margin:0px auto;/*overflow: hidden;*/">
                                            <div class="scroll_rigth_blockx" style="position:relative; padding:0px; /*overflow: hidden;*/">
                                               <div class="col-md-12 padding_l_0 "  style="font-size:14px">
                                                 <table class="table table-condensed col-md-12x margin_0 bck_table heder_footer_dis" style="margin-bottom:0px">
                                                     <thead>
                                                         <tr>
                                                             <th class="left thin padding_0 border_b_1 padding_l_15" style="color:#8E8E93;font-size: 17px;padding-bottom: 4px !important;padding-top: 2px !important;">
                                                               Documentos
                                                             </th>
                                                         </tr>
                                                     </thead>
                                                 </table>
                                                 <div class="div_right_tablex"  style="font-size:14px;position:relative; margin:0px auto; padding:0px; /*overflow: hidden;*/">
                                                     <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" >
                                                       <thead>
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
                                                       </thead>
                                                       <tbody id="global_table_list_items_properties_items_detail">
                                                         <?php

                                                         if($docv){
															
                                                           $i=0;
                                                           foreach ($docv -> result() as $rowdosv) {

                                                           if($tipo=='edit'){
                                                             if($rowdosv->fecha_exp==NULL || $rowdosv->fecha_exp=='0000-00-00'){
                                                               $fini="";
                                                             }else{
                                                               $fini=date('d-m-Y',strtotime($rowdosv->fecha_exp));
                                                             }
                                                             if($rowdosv->fecha_ven==NULL || $rowdosv->fecha_ven=='0000-00-00'){
                                                               $ffin="";
                                                             }else{
                                                               $ffin=date('d-m-Y',strtotime($rowdosv->fecha_ven));
                                                             }
                                                             if($rowdosv->diff>15){
                                                               $datedif="VIGENTE";
                                                             }elseif($rowdosv->diff>=0 && $rowdosv->diff<=15){
                                                               $datedif="PROX VEN";
                                                             }elseif($rowdosv->diff<0){
                                                               $datedif="VENCIDO";
                                                             }

                                                             $numerodv=$rowdosv->numero;
                                                             
                                                           }else{
                                                            $datedif="";
                                                            $numerodv="";
                                                            $ffin="";
                                                            $fini="";
                                                           }
                                                         ?>                      
                                                         <tr class=" ">
                                                             <td width="5%"  class="  border_t_0">
                                                               <span style="color: #999;"><?php echo $rowdosv->id_documento;?></span>
                                                               <input type="hidden" <?php echo $readonly;?> name="idoc[]" value="<?php echo  $rowdosv->id_documento;?>"> 
                                                             </td>
                                                             <td width="30%"  class="  border_t_0">
                                                               <span style="color: #999;"><?php echo $rowdosv->descripcion;?></span>
                                                             </td>
                                                             <td  width="16%"  class="  border_t_0">
                                                               <div class="input-group divfecha">
                                                                 <input type="text" readonly class="form-control datepicker" style="cursor:pointer;font-size: 12px;" name="fexp<?php echo $i;?>" id="fexp<?php echo $i;?>" value="<?php echo $fini;?>">                                            
                                                               </div>

                                                             </td>
                                                             <td  width="16%"  class="  border_t_0">
                                                              <div class="input-group divfechafin" >
                                                                <input type="text" readonly class="form-control  inpmobilex inputmobile_cborder datepicker" style="cursor:pointer;font-size: 12px;" data-indice="<?php echo $i;?>" 
                                                                name="fven<?php echo $i;?>"  id="fven<?php echo $i;?>" value="<?php echo $ffin;?>">                                            
                                                              </div>
                                                             </td>
                                                             <td width="21%" class="  border_t_0">
                                                              <div class="inputer inputer-indigo " style="margin-top:0px;">
                                                               <div class="input-wrapper">
                                                                <input type="text" <?php echo $readonly;?> class="form-control " name="numerodoc[]" value="<?php echo trim($numerodv);?>" style="font-size: 12px;">
                                                               </div>
                                                              </div>
                                                             </td>
                                                             <td width="17%" class="  border_t_0">
                                                               <span style="color: #999;" class="estado_doc"><?php echo $datedif;?></span>
                                                             </td>
                                                         </tr>
                                                         <?php
                                                         $i++;
                                                            }
                                                         }else{
                                                         ?>                      

                                                         <?php

                                                         }
                                                         ?>
                                                       </tbody>
                                                     </table>
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
                                                        <div class="inputerx inputer-indigox floating-labelx" style="margin-top:30px;">
                                                          <div class="input-wrapperx">
                                                          <?php if($editar=='si'){ ?>
                                                            <select class="selectize-remote2 selinput selobligatorio" name="id_propietario" placeholder="Propietario">
                                                              <option value="<?php echo trim($id_prop);?>" selected="selected"><?php echo trim($propietario);?></option>
                                                            </select>
                                                          <?php }else{ echo trim($propnoedi);
                                                                }?>
                                                         </div>
                                                        </div>
                                                       </div>
                                                     </div> 
                                                     <div class="form-group">
                                                       <div class="col-sm-12">
                                                        <div class="" style="margin-top:0px;">
                                                          <div class="input-wrapperw">
                                                          <?php if($editar=='si'){ ?>
                                                            <select class="selectize-remote2" name="id_adm" placeholder="Administrador">
                                                              <option value="<?php echo trim($id_adm);?>" selected="selected"><?php echo trim($manager);?></option>
                                                            </select>
                                                            <?php }else{ echo trim($mananoedit);
                                                                }?>
                                                          </div>
                                                        </div>
                                                       </div>
                                                     </div>
                                                     <div class="form-group">
                                                        <label class="control-label ">Observaciones</label>
                                                          <div class="inputer inputer-indigo">
                                                            <div class="input-wrapper">
                                                              <textarea name="anotaciones" id="anotaciones" class="form-control js-auto-sizex "><?php echo trim($anotaciones)?></textarea>
                                                            </div>
                                                        </div>
                                                      </div><!--.form-group-->

                                                <input type="hidden" id="vinculado" name="estadomovil" value="1">

                                                 <?php if($editar=='si'){
                                                 ?>
                                                 <!-- <div class="form-group">
                                                  <label class="control-label col-sm-2" style="text-align: left;">Radio</label>
                                                  <div class="clearfix col-sm-10"> 
                                                    <div class="radioer radioer-indigo form-inline">
                                                      <input type="radio" <?php echo $radiosi;?>  id="activo" name="radio" value="si" >
                                                      <label for="activo">Activo</label>
                                                    </div>
                                                    <div class="radioer radioer-indigo form-inline">
                                                      <input type="radio"  <?php echo $radiono;?> id="sinradio" name="radio"  value="no">
                                                      <label for="sinradio">Inactivo</label>
                                                    </div>
                                                  </div>
                                                 </div> -->
                                                 <?php 
                                                 if($tipo=="edit"){
                                                    if($estado==1){
                                                     $estadosi='checked="checked"';
                                                     $estadono="";
                                                    }else{
                                                     $estadosi='';
                                                     $estadono='checked="checked"';
                                                    }
                                                  }else{
                                                   $estadosi='checked="checked"';
                                                    $estadono="";
                                                  }
                                                 ?>
                                                <!--  <div class="form-group">
                                                  <label class="control-label col-sm-2" style="text-align: left;">Estado</label>
                                                  <div class="clearfix col-sm-10"> 
                                                    <div class="radioer radioer-indigo form-inline">
                                                      <input type="radio" <?php echo $estadosi;?> id="vinculado" name="estadomovil" value="1">
                                                      <label for="vinculado">Vinculado</label>
                                                    </div>
                                                    <div class="radioer radioer-indigo form-inline">
                                                      <input type="radio" <?php echo $estadono;?>  id="desvin" name="estadomovil" value="0">
                                                      <label for="desvin">Desvinculado</label>
                                                    </div>
                                                  </div>
                                                 </div>  -->
                                                <?php } ?>
                                                </div>
                                           </div>
                                       </div>
                                   </div>
                                  </div>
                               </form>
                           </div>
                        </div>
                       </div>
                      </div>
                     </div><!-- fin body modal -->
                     <div class="modal-footer">
                       <button type="button" class="btn btn-flat btn-red btn-ripple cancelataxi" data-dismiss="modal">Cancelar</button>
                       <?php if($editar=='si'){ ?>
                       <button type="button" class="btn btn-flat btn-info btn-ripple hide grabando" ><i class="fa fa-refresh fa-spin"></i> Grabando...</button>
                       <button type="button" class="btn btn-flat btn-indigo btn-ripple guardamovil" >Grabar</button>
                       <?php } ?>
                     </div>
        <script type="text/javascript">
        $(document).ready(function () {
       Pleasure.init();
       Layout.init();
       FormsSelect.init();
      })         
 function getNumeroDeNits(f1,f2){
   var d1 = f1.split("-");
   var dat1 = new Date( d1[2],parseFloat(d1[1])-1, parseFloat(d1[0]));
   var d2 = f2.split("-");
   var dat2 = new Date( d2[2],parseFloat(d2[1])-1, parseFloat(d2[0]));
   
   var fin = dat2.getTime() - dat1.getTime();
   var dias = Math.floor(fin / (1000 * 60 * 60 * 24))  
   
   return dias+1;
 }

             var data= $('.divfecha input').datepicker({
                 format: "dd-mm-yyyy",
                  language: "es",
                  autoclose: true
              }).on('changeDate', function(ev) {
                 $(this).datepicker('hide');
               }).data('datepicker');

              var dataf= $('.divfechafin input').datepicker({
                          format: "dd-mm-yyyy",
                           language: "es",
                           autoclose: true
                         }).on('changeDate', function(ev) {
                          //
                          var indice= $(this).data('indice');
                      //alert('<?php echo date("d-m-Y");?>')
                          var difer=getNumeroDeNits('<?php echo date("d-m-Y");?>',$(this).val());
                         // alert(difer)
                          if(difer>=0 && difer<=15){
                           //  alert('cambio'+difer)    
                             $(this).closest('tr').find('.estado_doc').html("PROX VEN"); 
                          }else if(difer<=0){
                            // alert('cambio'+difer)  
                            $(this).closest('tr').find('.estado_doc').html("VENCIDO"); 
                          }else if(difer>=16){
                            // alert('cambio'+difer)  
                            $(this).closest('tr').find('.estado_doc').html("VIGENTE"); 
                          }
                            $(this).datepicker('hide');
                         }).data('datepicker');

             var alto = $(window).height();
             $('.scroll_left_block').css('height',alto-160+'px');
              $('.div_right').css('height',alto-160+'px');
             $('#contienedata').css('height',alto-117+'px');
             $('#contienedata').css('overflow-x','hidden');
             $('#contienedata').perfectScrollbar();
             $('.scroll_left_block').perfectScrollbar({
              swipePropagation:true,
              wheelPropagation:true
             });
             $('.div_right').perfectScrollbar({
              swipePropagation:true,
              wheelPropagation:true
             });
             $('.selectpicker').perfectScrollbar({
              swipePropagation:true,
              wheelPropagation:true
             });

           $( window ).resize(function() {
            //  setTimeout(function(){ calcular_newscroll('#modal_movil', '#contienedata', 'no') },500);  
               var alto = $(window).height();
              $('#contienedata').css('height',alto-117+'px');
              $('.scroll_left_block').css('height',alto-140+'px');
              $('.div_right').css('height',alto-140+'px');
              $('.scroll_left_block').perfectScrollbar('update'); 
              $('.div_right').perfectScrollbar('update'); 
              $('#contienedata').perfectScrollbar('update');               
           })   
		 
       </script>
