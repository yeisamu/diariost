<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if($prop){
 $dataprop = $prop->row();
  $nombre=$dataprop->nombres;
  $apellidos=$dataprop->apellidos;
  $id=$dataprop->codigo;
  $idcondu=$dataprop->id_conductor;
  $direccion=$dataprop->direccion;
  $telefono=$dataprop->telefono;
  $acudiente=$dataprop->acudiente;
  $telefonoa=$dataprop->telefonoa;
  $ispensionado=$dataprop->ispensionado;
  $rh=$dataprop->tipo_rh;
  $emailc=$dataprop->emailc;
  $experiencia=$dataprop->experiencia_laboral;
  $obs=$dataprop->observacion;
  $foto=$dataprop->foto;
  $lnace=$dataprop->lugarNace;
  $fnace=date('d-m-Y',strtotime($dataprop->fecha_nace));

  $titulo="Modificar Conductor";
  if($ispensionado=='si'){
    $esact='checked="checked"';
    $esinac='';
  }else{
    $esact='';
    $esinac='checked="checked"';
  }
  $campoid='<span>'.$id.'</span><input type="hidden"  name="idp" value="'.$id.'" ><input type="hidden"  name="id_condu" value="'.$idcondu.'" >';

}else{ 
  $titulo="Nuevo Conductor";
  $nombre="";
  $apellidos="";
  $id="";
  $direccion="";
  $telefono="";  
  $acudiente="";
  $telefonoa="";
  $rh="";
  $ispensionado="";
  $esact='';
  $esinac='checked="checked"';
  $vencelic='';
  $licencia='';
  $cate='';
  $entidasalud='';
  $vencesalud='';
  $lnace='';
  $emailc='';
  $experiencia='';
  $obs='El vehículo MOVIL *** lo he recibido en calidad de arrendamiento, según contrato verbal que tengo con el (a) señor (a) ***********, a quien cancelo la suma diaria de $*******.oo, la cual es entregada en la ********* de la ciudad de ********.';
  $foto='';
  $fnace='';
  
  $campoid='<div class="inputer inputer-indigo">
              <div class="input-wrapper">
                <input type="text"  name="idp" value="" id="idp" class="form-control obligatorio">
              </div>
            </div>';
}
  

 ?>
 <style type="text/css">
.datepicker{
  z-index: 9999;
}
 </style>
    <div class="modal-header">
      <h4 class="modal-title"><?php echo $titulo?></h4>
    </div>
    <div class="modal-body">
      <div class="row">
        <div class="col-md-12">

          <div class="panel">
            <div class="panel-body">
              <form action="#" class="form-horizontal" id="editdoc" enctype="multipart/form-data">
                <div class="form-content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-6">Tarjeta #</label>
                            <div class="col-md-6">
                                <div class="inputer inputer-indigo">
                                <div class="input-wrapper">
                                    <input type="text"  name="nombreprop" value="<?php echo trim($nombre)?>" id="nombreprop" class="form-control obligatorio">
                                </div>
                                </div>
                            </div>
                        </div><!--.form-group-->
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-4">Movil</label>
                            <div class="col-md-6">
                                <div class="inputer inputer-indigo">
                                <div class="input-wrapper">
                                    <input type="text"  name="nombreprop" value="<?php //echo trim($nombre)?>" id="nombreprop" class="form-control obligatorio muestramovil">
                                </div>
                                </div>
                            </div>
                        </div><!--.form-group-->
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            <h6>Documentos <?php echo $nombre." ".$apellidos;?></h6>
                            <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover"  style="font-size:12px">
                                <thead>
                                <tr class=" ">
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
                                    <th width="21%" class=" border_l_0 border_t_0">
                                        <span style="padding-left:5px;padding-right:5px">Info</span>
                                    </th>
                                    <th width="17%" class=" border_l_0 border_t_0">
                                        <span style="padding-left:5px;padding-right:5px">Estado</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="condudocs">
                                <?php

                                if($docs){
                                    $i=0;
                                    foreach ($docs -> result() as $rowdosv) {
                                        if($rowdosv->fecha_ant==NULL || $rowdosv->fecha_ant=='0000-00-00'){
                                            $fini="";
                                        }else{
                                            $fini=date('d-m-Y',strtotime($rowdosv->fecha_ant));
                                        }
                                        if($rowdosv->fecha_vence==NULL || $rowdosv->fecha_vence=='0000-00-00'){
                                            $ffin="";
                                        }else{
                                            $ffin=date('Y-m-d',strtotime($rowdosv->fecha_vence));
                                        }
                                        if($rowdosv->diff>15){
                                            $datedif="VIGENTE";
                                            $clasestatus="label label-success";
                                        }elseif($rowdosv->diff>=0 && $rowdosv->diff<=15){
                                            $datedif="PROX VEN";
                                            $clasestatus="label label-warning";
                                        }elseif($rowdosv->diff<0){
                                            $clasestatus="label label-danger";
                                            $datedif="VENCIDO";
                                        }

                                    $numerodv=$rowdosv->numero;
                                    $info=$rowdosv->categoria;

                                ?>                      
                                <tr class=" ">
                                    <td width="30%"  class="  border_t_0" style="padding: 5px;font-size:12px">
                                        <span style="color: #999;"><?php echo $rowdosv->documento;?></span>
                                    </td>
                                    <td  width="16%" style="padding: 5px;font-size:12px" class="  border_t_0">
                                        <div class="">
                                            <?php echo $ffin;?>                                          
                                        </div>

                                    </td>
                                    <td  width="16%"  style="padding: 5px;font-size:12px"class="  border_t_0">
                                        <div class=" " style="margin-top:0px;">
                                            <?php echo $ffin;?>
                                        </div>
                                    </td>
                                    <td width="21%" style="padding: 5px;font-size:12px" class="  border_t_0">
                                        <div class=" " style="margin-top:0px;">
                                        <?php echo trim($numerodv);?>
                                        </div>
                                    </td>
                                    <td width="21%" style="padding: 5px;font-size:12px" class="  border_t_0">
                                        <div class=" " style="margin-top:0px;">
                                            <?php echo trim($info);?>
                                        </div>
                                    </td>
                                    <td width="17%" style="padding: 5px;font-size:12px" class="  border_t_0">
                                        <span style="" class="estado_doc <?php echo $clasestatus;?>"><?php echo $datedif;?></span>
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
                            </div>
                        </div>
                    </div>
                </div>
                <div id="datamovil"></div>
                </div><!--.form-content-->
              </form>
            </div><!--.panel-body-->
          </div><!--.panel-->

        </div><!--.col-md-12-->
      </div><!--.row--> 
    </div><!--.body modal-->  
    <div class="modal-footer">
      <button type="button" class="btn btn-flat btn-red btn-ripple cancelaformedit" data-dismiss="modal">Cancelar</button>
      <button type="button" class="btn btn-flat btn-info btn-ripple hide grabando" ><i class="fa fa-refresh fa-spin"></i> Grabando...</button>
      <button type="button" class="btn btn-flat btn-indigo btn-ripple guardaeditcondu" >Grabar</button>
    </div>
<script>
	  	$(document).ready(function () {
          $('#nombreprop').focus()
           Pleasure.init();
           Layout.init();
           FormsSelect.init(); 
        });
</script>