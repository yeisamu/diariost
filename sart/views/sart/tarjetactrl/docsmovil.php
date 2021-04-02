<?php
  if($movil){
    $dataprop = $movil->row();
     $idmov=$dataprop->id_movil;
     $placa=$dataprop->placa;
  }   
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
<?php }else{ ?>

    <div class="col-md-9">
      <h1>Movil No existe</h1>
   </div>
<?php }
?>