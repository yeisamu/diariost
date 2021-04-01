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
                            $clasestatus="label label-success";
                        }elseif($rowdosv->diff>=0 && $rowdosv->diff<=15){
                            $datedif="PROX VEN";
                            $clasestatus="label label-warning";
                        }elseif($rowdosv->diff<0){
                            $clasestatus="label label-danger";
                            $datedif="VENCIDO";
                        }

                    $numerodv=$rowdosv->numero;

                ?>                      
                <tr class=" ">
                    <td width="30%"  class="  border_t_0" style="padding: 5px;font-size:12px">
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
<script>
$(document).ready(function () {
    var fecharef = new Array();
    var i=0;
  $('#vehidocs tr').each(function(e){
    fecharef.push({'fecha' : $.trim($(' > td:eq(2)', $(this)).text()),'doc' : $.trim($(' > td:eq(0)', $(this)).text())});
    i++;
  });

  $('#condudocs tr').each(function(e){
    fecharef.push({'fecha' : $.trim($(' > td:eq(2)', $(this)).text()),'doc' : $.trim($(' > td:eq(0)', $(this)).text())});

  });
  console.log(fecharef);
/*  var mayorDate= new Date(fecharef[0]);
var menorDate= new Date(fecharef[0]);
for(var clave in fecharef) {

    console.log(clave+": " +fecharef[clave]);
}*/
/*for (var i = 0; i<fecharef.length; i++){
	var arrDate= new Date(fecharef[i]);
	if(arrDate > mayorDate){
  	mayorDate=arrDate
  }
  if(arrDate < menorDate){
  	menorDate=arrDate
  }
}*/

console.log("Fecha mayor: "+mayorDate.toUTCString());
console.log("Fecha menor: "+menorDate.toUTCString());
});
</script>
<?php }else{ ?>

    <div class="col-md-9">
      <h1>Movil No existe</h1>
   </div>
<?php }
?>