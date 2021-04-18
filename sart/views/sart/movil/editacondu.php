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
  $anotaciones=$dataprop->anotaciones;
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
  $anotaciones='';
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
                <input type="hidden"  name="tipo" value="<?php echo $tipo?>" >
                
                <div class="form-content">
                <div class="row">
                   <div class="col-md-6"> 
                    <div class="form-group">
                      <label class="control-label col-md-3">Foto</label>
                      <div class="col-md-4">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                        <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"><img src="../../fotos/<?php echo $foto ?>" class="user-photo" alt="" style=""></div>
                          <span class="btn btn-default btn-file btn-ripple ">
                          <span class="fileinput-new">Seleccione imagen</span>
                          <span class="fileinput-exists">Cambiar</span>
                            <input name="archivo" type="file" id="imagen"  value="" class="form-control ">  
                          </span>
                          <span class="fileinput-filename"></span>
                          <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>
                        </div>
                      </div>                                         
                    </div><!--.form-group-->
                   </div>
                 </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-labelx col-md-4" style=" text-align: right;">Documento</label>
                      <div class="col-md-6">
                        <?php echo $campoid?>
                      </div>
                    </div><!--.form-group-->
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Grupo sanguineo</label>
                      <div class="col-md-6">
                         <select class="selecter selpop selobligatorio" name="rh" data-style="btn-indigo" data-width="100%">
                              <option <?php if($rh==''){ echo 'selected="selected"';}?> value="">Seleccione</option>
                              <option <?php if($rh=='O-'){ echo 'selected="selected"';}?> value="O-">O-</option>
                              <option <?php if($rh=='O+'){ echo 'selected="selected"';}?> value="O+">O+</option>
                              <option <?php if($rh=='A-'){ echo 'selected="selected"';}?> value="A-">A-</option>
                              <option <?php if($rh=='A+'){ echo 'selected="selected"';}?> value="A+">A+</option>
                              <option <?php if($rh=='B-'){ echo 'selected="selected"';}?> value="B-">B-</option>
                              <option <?php if($rh=='B+'){ echo 'selected="selected"';}?> value="B+">B+</option>
                              <option <?php if($rh=='AB-'){ echo 'selected="selected"';}?> value="AB-">AB-</option>
                              <option <?php if($rh=='AB+'){ echo 'selected="selected"';}?> value="AB+">AB+</option>
                        </select>
                      </div>
                    </div><!--.form-group-->
                  </div>
                </div>
                <div class="row">
                 <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Nombres</label>
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
                      <label class="control-label col-md-4">Apellidos</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="apellprop" value="<?php echo trim($apellidos)?>" id="apellprop" class="form-control obligatorio">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Fecha de nacimiento</label>
                      <div class="col-md-6">
                      <div class="col-md-6 divfechax input-group" >
                       <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                       <div class="inputer inputer-indigo " style="margin-top:0px;">
                         <div class="input-wrapper divfecha">
                         <input type="text" name="fechanace" readonly class="form-control bootstrap-daterangepicker-basicx obligatorio" value="<?php echo $fnace?>" id="fechalic" style="cursor:pointer">
                         </div>
                       </div>  
                       </div>
                      </div>
                    </div><!--.form-group-->
                  </div>
                 <div class="col-md-6">
                   <div class="form-group">
                     <label class="control-label col-md-4">Direcci&oacute;n</label>
                     <div class="col-md-6">
                       <div class="inputer inputer-indigo">
                         <div class="input-wrapper">
                           <input type="text"  name="dirprop" value="<?php echo trim($direccion)?>" id="dirprop" class="form-control obligatorio">
                         </div>
                       </div>
                     </div>
                   </div><!--.form-group-->
                 </div>
                </div>
                <div class="row">
                 <div class="col-md-6"> 
                    <div class="form-group">
                      <label class="control-label col-md-4">Tel&eacute;fono</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="telprop" value="<?php echo trim($telefono)?>" id="telprop" class="form-control obligatorio">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Email</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="emailc" value="<?php echo trim($emailc)?>" id="emailc" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                  </div>
                  </div>
                  <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Contacto de emergencia</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="acudiente" value="<?php echo trim($acudiente)?>" id="acudiente" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                   </div>
                   <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Tel&eacute;fono contacto emergencia</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="telacu" value="<?php echo trim($telefonoa)?>" id="telacu" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                   </div>
                </div>
                 <div class="row">
                   <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Pensionado</label>
                      <div class="col-md-6">
                        <div class="clearfix">
                          <div class="radioer radioer-indigo form-inline">
                            <input type="radio" name="pensionado" id="estadoact" value="si" <?php echo $esact?> >
                            <label for="estadoact">Si</label>
                          </div>
                          <div class="radioer radioer-indigo form-inline">
                            <input type="radio" name="pensionado" id="estado_inac" value="no" <?php echo $esinac?>>
                            <label for="estado_inac">No</label>
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                   </div>
                   <div class="col-md-6">
                    <div class="form-group">
                      <label class="control-label col-md-4">Conductor desde el año</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="expe" value="<?php echo trim($experiencia)?>" id="expe" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-12">
                   <table class="table table-bordered border_l_0  head-shadowxx margin_0 bck_table table-hover" >
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
                    <tbody id="global_table_list_items_properties_items_detail">
                      <?php

                      if($docs){
                        $i=0;
                        foreach ($docs -> result() as $rowdosv) {
                        if($rowdosv->obligatorio=='si'){
                          $isobg='obligatorio';
                        }else{
                          $isobg='';
                        }
                        if($tipo=='edit'){
                          if($rowdosv->fecha_ant==NULL || $rowdosv->fecha_ant=='0000-00-00'){
                            $fini="";
                          }else{
                            $fini=date('d-m-Y',strtotime($rowdosv->fecha_ant));
                          }
                          if($rowdosv->fecha_vence==NULL || $rowdosv->fecha_vence=='0000-00-00'){
                            $ffin="";
                          }else{
                            $ffin=date('d-m-Y',strtotime($rowdosv->fecha_vence));
                          }
                          if($rowdosv->diff>15){
                            $datedif="VIGENTE";
                          }elseif($rowdosv->diff>=0 && $rowdosv->diff<=15){
                            $datedif="PROX VEN";
                          }elseif($rowdosv->diff<0){
                            $datedif="VENCIDO";
                          }

                          $numerodv=$rowdosv->numero;
                          $info=$rowdosv->categoria;
                          
                        }else{
                        $datedif="";
                        $numerodv="";
                        $info="";
                        $ffin="";
                        $fini="";
                        }
                      ?>                      
                      <tr class=" ">
                         <td width="30%"  class="  border_t_0">
                            <span style="color: #999;"><?php echo $rowdosv->documento;?></span>
                            <input type="hidden" name="idoc[]" value="<?php echo  $rowdosv->id_doc;?>"/> 
                            <input type="hidden" name="notif[]" value="<?php echo  $rowdosv->isnotif;?>"/> 
                            <input type="hidden" name="conduc[]" value="<?php echo  $nombre.' '.$apellidos;?>"/> 
                          </td>
                          <td  width="16%"  class="  border_t_0">
                            <div class="input-group divfecha">
                              <input type="text" readonly class="form-control datepicker" style="cursor:pointer;font-size: 12px;" name="fexp<?php echo $i;?>" id="fexp<?php echo $i;?>" value="<?php echo $ffin;?>">                                            
                            </div>

                          </td>
                          <td  width="16%"  class="  border_t_0">
                            <div class="inputer inputer-indigo " style="margin-top:0px;">
                              <div class=" input-wrapper input-group divfechafin" >
                                <input type="text" readonly class="form-control  inpmobilex inputmobile_cborder datepicker <?php echo $isobg;?>" style="cursor:pointer;font-size: 12px;" data-indice="<?php echo $i;?>" 
                                name="fven<?php echo $i;?>"  id="fven<?php echo $i;?>" value="<?php echo $ffin;?>">                                            
                              </div>
                            </div>
                          </td>
                          <td width="21%" class="  border_t_0">
                          <div class="inputer inputer-indigo " style="margin-top:0px;">
                            <div class="input-wrapper">
                            <input type="text" class="form-control  " name="numerodoc[]" value="<?php echo trim($numerodv);?>" style="font-size: 12px;">
                            </div>
                          </div>
                          </td>
                          <td width="21%" class="  border_t_0">
                          <div class="inputer inputer-indigo " style="margin-top:0px;">
                            <div class="input-wrapper">
                            <input type="text" class="form-control " name="info[]" value="<?php echo trim($info);?>" style="font-size: 12px;">
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
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-12">
                    <div class="form-group">
                      <label class="control-label ">Informaci&oacute;n estadistica conductor</label>
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <textarea name="obs" id="obs" class="form-control js-auto-sizex obligatorio"><?php echo $obs?></textarea>
                          </div>
                      </div>
                    </div><!--.form-group-->
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-12">
                    <div class="form-group">
                      <label class="control-label ">Anotaciones</label>
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <textarea name="anotaciones" id="anotaciones" class="form-control js-auto-sizex obligatorio"><?php echo trim($anotaciones)?></textarea>
                          </div>
                      </div>
                    </div><!--.form-group-->
                   </div>
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
      <button type="button" class="btn btn-flat btn-indigo btn-ripple guardaeditcondu" >Grabar</button>
    </div>
   <script>
	  	$(document).ready(function () {
       /* var fileExtension = "";
        $('#imagen').change(function()
        {
            //obtenemos un array con los datos del archivo
            var file = $("#imagen")[0].files[0];
            //obtenemos el nombre del archivo
            var fileName = file.name;
            //obtenemos la extensión del archivo
            fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
            //obtenemos el tamaño del archivo
            var fileSize = file.size;
            //obtenemos el tipo de archivo image/png ejemplo
            var fileType = file.type;
            //mensaje con la información del archivo
            //showMessage("<span class='info'>"+fileName+"</span>");
        });*/
          $('#nombreprop').focus()
           Pleasure.init();
           Layout.init();
           FormsSelect.init(); 
           // $('.bootstrap-daterangepicker-basic').daterangepicker({
           //    singleDatePicker: true
           //    }, function(start, end, label) {
           //      console.log(start.toISOString(), end.toISOString(), label);
           //    }
           //  );
		     var win_height = window.innerHeight;
		    var resta =win_height-150;
		    $('.modal-body').height(resta+'px');
		    $('.modal-body').perfectScrollbar({        
		                wheelPropagation: false,
		                minScrollbarLength: 100,
		                useBothWheelAxes: false,
		                useKeyboard: true,
		                suppressScrollX: true
		     }); 
 function getNumeroDeNits(f1,f2){
   var d1 = f1.split("-");
   var dat1 = new Date( d1[2],parseFloat(d1[1])-1, parseFloat(d1[0]));
   var d2 = f2.split("-");
   var dat2 = new Date( d2[2],parseFloat(d2[1])-1, parseFloat(d2[0]));
   var fin = dat2.getTime() - dat1.getTime();
   var dias = Math.floor(fin / (1000 * 60 * 60 * 24));
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
      $('.selectpicker').perfectScrollbar({
              swipePropagation:true,
              wheelPropagation:true
             });

		     $(window).resize(function() {
		        var win_height = window.innerHeight;
		        var resta =win_height-150;
		        $('.modal-body').height(resta+'px');
		        $('.modal-body').perfectScrollbar('update');
		     });
            var rippledButtons=true;
            if( rippledButtons ) {

              // Thanks to Andrew Tunnecliffe http://codepen.io/atunnecliffe/pen/VYayGp
              var element, ripple, d, x, y;
              var i = 1;
              var queue = [];

              $('.btn').addClass('btn-ripple');

              $('.btn-ripple').on('click', function(e) {
                element = $(this);

                // remove old items from queue and DOM
                // allow max 5 to be loaded
                if (queue.length > 5) {
                  $('._' + queue.shift()).remove();
                }

                // Assume user can't click more than 1000 times / second
                //terrible overflow protection.
                if (i > 1000) {
                  i = 0;
                }

                // add next item to queue
                i++;
                queue.push(i);

                // Build element
                element.append('<span class="ripple _' + i + '"></span>');
                ripple = element.find('._' + i);

                // Make it big enough to cover whole parent
                if(!ripple.height() && !ripple.width()) {
                  d = Math.max(element.outerWidth(), element.outerHeight());
                  ripple.css({height: d, width: d});
                }

                // Get origin
                x = e.pageX - element.offset().left - ripple.width() / 2;
                y = e.pageY - element.offset().top - ripple.height() / 2 ;

                // Set location and animate
                ripple.css({top: y+'px', left: x+'px'}).addClass('animate');
              });

            }
            
            $('.inputer>.input-wrapper>.form-control:disabled').parents('.input-wrapper').addClass('disabled');

             // Readonly
             $('.inputer>.input-wrapper>.form-control[readonly]').parents('.input-wrapper').addClass('readonly');

             $('.inputer>.input-wrapper>.form-control').on('focus', function () {
               $('.input-wrapper.active').removeClass('active');
               $(this).parents('.input-wrapper').addClass('active');
             });
             $('.inputer>.input-wrapper>.form-control').on('blur', function () {
               $('.input-wrapper.active').removeClass('active');
             });
             $('.inputmask-email').inputmask({
                  mask: '*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[.*{2,6}][.*{1,2}]',
                  greedy: false,
                  definitions: {
                    '*': {
                      validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~\-]",
                      cardinality: 1,
                      casing: "lower"
                    }
                  }
                });
    });
   </script>