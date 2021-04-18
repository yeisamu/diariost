<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if($prop){
 $dataprop = $prop->row();
  $nombre=$dataprop->nombres;
  $apellidos=$dataprop->apellidos;
  $id=$dataprop->codigo;
  $idcondu=$dataprop->id_conductor;
  $ispensionado=$dataprop->ispensionado;
  


}else{ 
  $titulo="Nuevo Conductor";
  $nombre="";
  $apellidos="";
  $id="";
  $idcondu="";
  $ispensionado="";
  

}
if($tipo=='edit'){
    
    $isedit='hide';
    $obligatorio='';
    $filact='';
    if($tc){
       // $datatc=$tc->row();
        $filact=$tc->planilla;
        $numtc=$tc->id_tarjeta;
    }
    $titulo="Actializaci&oacute;n tarjeta de control # ".$numtc;
    if($movil){
        $dataprop = $movil->row();
        $idmov=$dataprop->id_movil;
        $placa=$dataprop->placa; 
    }
}else{
    $numtc='';
    $titulo="Nueva Tarjeta de control";
    $isedit='';
    $obligatorio='obligatorio';
    $filact='';
    $idmov='';
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
              <form action="#" class="form-horizontal" id="frmTarjeta" enctype="multipart/form-data">
                <div class="form-content">
                <div class="row <?php echo $isedit;?>">
                    <div class="col-md-6 hide">
                        <div class="form-group">
                            <label class="control-label col-md-6">Tarjeta #</label>
                            <div class="col-md-6">
                                <div class="inputer inputer-indigo">
                                <div class="input-wrapper">
                                    <input type="text"  name="tarjeta" value="<?php echo $numtc?>" id="tarjeta" class="form-control ">
                                    <input type="hidden"  name="pensionado" value="<?php echo trim($ispensionado)?>" id="pensionado" class="">
                                    <input type="hidden"  name="docref" value="" id="docref" class="">
                                    <input type="hidden"  name="nomdocRef" value="" id="nomdocRef" class="">
                                    <input type="hidden"  name="fechavig" value="<" id="fechavig" class="">
                                    <input type="hidden"  name="idconductor" value="<?php echo $idcondu?>" id="idconductor" class="">
                                    <input type="hidden"  name="tipo" value="<?php echo $tipo?>" id="tipo" class="">
                                    <input type="hidden"  name="filact" value="<?php echo $filact?>" id="filact" class="">
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
                                    <input type="text"  name="idmovil" value="<?php echo trim($idmov)?>" id="idmovil" class="form-control <?php echo $obligatorio;?> muestramovil">
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
                                        $isvencido='no';
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
                                            $isvencido='si';
                                        }

                                    $numerodv=$rowdosv->numero;
                                    $info=$rowdosv->categoria;

                                ?>                      
                                <tr class=" ">
                                    <td width="30%" data-docid="<?php echo $rowdosv->id_doc;?>"  data-include="<?php echo $rowdosv->obligatorio;?>" data-vencido="<?php echo $isvencido;?>" class="  border_t_0" style="padding: 5px;font-size:12px">
                                        <span style="color: #999;"><?php echo $rowdosv->documento;?></span>
                                    </td>
                                    <td  width="16%" style="padding: 5px;font-size:12px" class="  border_t_0">
                                        <div class="">
                                            <?php echo $fini;?>                                          
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
                <div id="datamovil">
                    <?php
                        if($docsv){
                    ?>
                    <div class="panel">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                <h6>Documentos del movil <?php echo $idmov." ".$placa;?></h6>
                                <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" style="font-size:12px" id="tMovilD">
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
                                        <th width="17%" class=" border_l_0 border_t_0">
                                            <span style="padding-left:5px;padding-right:5px">Estado</span>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="vehidocs">
                                    <?php

                                    if($docsv){
                                        $i=0;
                                        foreach ($docsv -> result() as $rowdosv) {
                                            $isvencido='no';
                                            if($rowdosv->fecha_exp==NULL || $rowdosv->fecha_exp=='0000-00-00'){
                                                $fini="";
                                            }else{
                                                $fini=date('Y-m-d',strtotime($rowdosv->fecha_exp));
                                            }
                                            if($rowdosv->fecha_ven==NULL || $rowdosv->fecha_ven=='0000-00-00'){
                                                $ffin="";
                                            }else{
                                                $ffin=date('Y-m-d',strtotime($rowdosv->fecha_ven));
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
                                                $isvencido='si';
                                            }

                                        $numerodv=$rowdosv->numero;

                                    ?>                      
                                    <tr class=" ">
                                        <td width="30%" data-docid="<?php echo $rowdosv->id_documento;?>"  data-vencido="<?php echo $isvencido;?>" class="border_t_0" style="padding: 5px;font-size:12px">
                                            <span style="color: #999;"><?php echo $rowdosv->descripcion;?></span>
                                        </td>
                                        <td  width="16%" style="padding: 5px;font-size:12px" class="  border_t_0">
                                            <div class="">
                                                <?php echo $fini;?>                                          
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
                                        <td width="17%" style="padding: 5px;font-size:12px"  class="  border_t_0">
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
                                <div class="row example-buttons">

                                    <div class="col-md-12">
                                        <div class="note note-info note-bottom-striped docsok hide">
                                            <h4>Nueva vigencia</h4>
                                            <div><strong>Fecha de Vigencia: </strong><span class="newfechav"></span></div>
                                            <div><strong>Documento de referencia: </strong><span class="newdocv"></span></div>
                                        </div><!--.note-->
                                        <div class="note note-warning  note-bottom-striped docsfail hide">
                                            <h4>Documentos vencidos</h4>
                                            <p>Para continuar con el proceso es necesario que actualice los documentos vencidos:</p>
                                            <ul class="list-material docerror"></ul>
                                            <button type="button" class="btn btn-success button-striped button-full-striped btn-ripple abre_mod_global " data-capa='global_sm' data-toggle="modal"  data-target="#modal_sm" 
                                data-vars="<?php echo base_url() ?>sart.php/sistemasart/autoriza">Autorizar</button>
                                            
                                        </div><!--.note-->
                                    </div><!--.col-md-9-->
                                </div><!--.row-->
                            </div>
                            </div>
                        </div>
                    </div>
                    <script>
                    $(document).ready(function () {
                        var fecharef = new Array();
                        var inc='';
                        var i=0;
                        var msjevencido='';
                    $('#vehidocs tr').each(function(e){
                        fecharef.push({'fecha' : $.trim($(' > td:eq(2)', $(this)).text()),'doc' : $.trim($(' > td:eq(0)', $(this)).text()),'iDdoc':$(' > td:eq(0)', $(this)).data('docid')});
                        if($(' > td:eq(0)', $(this)).data('vencido')==='si'){
                            msjevencido+="<li class='has-action-left has-action-right'><div class='list-content'>\n\
                                                            <span class='title'>"+ $.trim($(' > td:eq(0)', $(this)).text())+" (vehiculo)</span><span class='caption'> "+$.trim($(' > td:eq(2)', $(this)).text())+"</span></li>";
                            i++;
                        }
                    });
                    
                    $('#condudocs tr').each(function(e){ 
                        inc=$(' > td:eq(0)', $(this)).data('include');
                        if(inc==='si'){
                            if($.trim($(' > td:eq(0)', $(this)).text())==='EPS' || $.trim($(' > td:eq(0)', $(this)).text())==='ARL'){
                                if($('#pensionado').val()==='no'){
                                fecharef.push({'fecha' : $.trim($(' > td:eq(2)', $(this)).text()),'doc' : $.trim($(' > td:eq(0)', $(this)).text()),'iDdoc':$(' > td:eq(0)', $(this)).data('docid')});   
                                    if($(' > td:eq(0)', $(this)).data('vencido')==='si'){
                                        msjevencido+="<li class='has-action-left has-action-right'><div class='list-content'>\n\
                                                            <span class='title'>"+ $.trim($(' > td:eq(0)', $(this)).text())+" (conductor)</span><span class='caption'> "+$.trim($(' > td:eq(2)', $(this)).text())+"</span></li>";
                                        i++;
                                    }
                                }  
                            }else{
                                fecharef.push({'fecha' : $.trim($(' > td:eq(2)', $(this)).text()),'doc' : $.trim($(' > td:eq(0)', $(this)).text()),'iDdoc':$(' > td:eq(0)', $(this)).data('docid')});
                                if($(' > td:eq(0)', $(this)).data('vencido')==='si'){
                                    msjevencido+="<li class='has-action-left has-action-right'><div class='list-content'>\n\
                                                            <span class='title'>"+ $.trim($(' > td:eq(0)', $(this)).text())+" (conductor)</span><span class='caption'> "+$.trim($(' > td:eq(2)', $(this)).text())+"</span></li>";
                                                            i++;
                                }
                            }
                        }  
                    });
                    console.log(fecharef);
                    var mayorDate= new Date(fecharef[0].fecha);
                    var menorDate= new Date(fecharef[0].fecha);
                    var indiceU=0;
                    var indiceD=0;
                    for(var clave in fecharef) {
                        var arrDate= new Date(fecharef[clave].fecha);
                        if(arrDate > mayorDate){
                            mayorDate=arrDate;
                            indiceU=clave;
                        }
                        if(arrDate < menorDate){
                            indiceD=clave;
                            menorDate=arrDate;
                        }
                    }
                    $('#docref').val(fecharef[indiceD].iDdoc);
                    $('#fechavig').val(fecharef[indiceD].fecha);
                    $('#nomdocRef').val(fecharef[indiceD].doc);
                    $('.newfechav').html(fecharef[indiceD].fecha);
                    $('.newdocv').html(fecharef[indiceD].doc);
                    if(i===0){
                        $('#grabatc').removeClass('disabled');
                        $('.docsfail').addClass('hide');
                        $('.docsok').removeClass('hide');

                    }else{
                        $('.docsfail').removeClass('hide');
                        $('.docsok').addClass('hide');
                        $('.docerror').html(msjevencido);
                    }
                    });
                    </script>
                    <?php }?>

                
                </div>
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
      <button type="button" class="btn btn-flat btn-indigo btn-ripple guardaTC disabled" id="grabatc" >Grabar</button>
    </div>
<script>
	  	$(document).ready(function () {
          $('#nombreprop').focus()
           Pleasure.init();
           Layout.init();
           FormsSelect.init(); 
        });
</script>