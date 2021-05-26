<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if($prop){
 $dataprop = $prop->row();
  $nombre=$dataprop->nombre;
  $apellidos=$dataprop->apellidos;
  $id=$dataprop->id_prop;
  $direccion=$dataprop->direccion;
  $telefono=$dataprop->telefono;
  $ciudad=$dataprop->ciudad_nac;
  $email=$dataprop->email;
  $estado=$dataprop->estado_prop;
  $escondu=$dataprop->escondu;

  $titulo="Modificar Propietario";
  if($dataprop->fecha_exp != '0000-00-00' && $dataprop->fecha_exp != NULL){
  $fecha_exp=date('m/d/Y',strtotime($dataprop->fecha_exp));
  }else{
    $fecha_exp='';
  }
  $fecha_nac=date('m/d/Y',strtotime($dataprop->fecha_nac));
  if($estado=='activo'){
    $esact='checked="checked"';
    $esinac='';
  }else{
    $esact='';
    $esinac='checked="checked"';
  }

  if($escondu=='si'){
    $escondusi='checked="checked"';
    $esconduno='';
  }else{
    $escondusi='';
    $esconduno='checked="checked"';
  }
  $campoid='<span>'.$id.'</span><input type="hidden"  name="idp" value="'.$id.'" >';
}else{ 
  $titulo="Nuevo Propietario";
  $nombre="";
  $apellidos="";
  $id="";
  $direccion="";
  $telefono="";  
  $ciudad="";
  $email="";
  $estado="";
  $fecha_exp='';
  $fecha_nac='';
  $escondusi='';
  $esconduno='checked="checked"';

  $esact='checked="checked"';
  $esinac='';
  
  $campoid='<div class="inputer inputer-indigo">
              <div class="input-wrapper">
                <input type="text"  name="idp" value="" id="idp" class="form-control obligatorio">
              </div>
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
    <div class="modal-body">
      <div class="row">
        <div class="col-md-12">

          <div class="panel">
            <div class="panel-body">
              <form action="#" class="form-horizontal" id="editdoc">
                <input type="hidden"  name="tipo" value="<?php echo $tipo?>" >
                
                <div class="form-content">
                  <div class="form-group">
                    <label class="control-labelx col-md-4" style=" text-align: right;">Documento</label>
                    <div class="col-md-6">
                      <?php echo $campoid?>
                    </div>
                  </div><!--.form-group-->
                  <!--div class="form-group">
                   <label for="clase" class="col-sm-4 control-label " style="">Fecha exp</label>
                    <div class="col-sm-6 divfecha input-group" >
                     <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                     <div class="inputer inputer-indigo " style="margin-top:0px;">
                       <div class="input-wrapper">
                       <input type="text" readonly style="" name="fexpdoc" id="fexpdoc" class="form-control bootstrap-daterangepicker-basicx" value="<?php echo $fecha_exp?>" />
                      </div>
                    </div>   
                    </div>
                  </div--> 
                  <div class="form-group">
                    <label class="control-label col-md-4">Nombre</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="nombreprop" value="<?php echo trim($nombre)?>" id="nombreprop" class="form-control obligatorio">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
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
                 <div class="form-group">
                  <label for="clase" class="col-sm-4 control-label " style="">Fecha de nacimiento</label>
                   <div class="col-sm-6 divfecha input-group" >
                    <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                    <div class="inputer inputer-indigo " style="margin-top:0px;">
                      <div class="input-wrapper">
                      <input type="text" readonly style="" name="fechaing" id="fechaing" class="form-control bootstrap-daterangepicker-basicx" value="<?php echo $fecha_nac?>" />
                     </div>
                   </div>   
                   </div>
                 </div> 

                  <div class="form-group">
                    <label class="control-label col-md-4">Direcci&oacute;n</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="dirprop" value="<?php echo trim($direccion)?>" id="dirprop" class="form-control">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  <div class="form-group">
                    <label class="control-label col-md-4">Ciudad</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="cityprop" value="<?php echo trim($ciudad)?>" id="cityprop" class="form-control">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  <div class="form-group">
                    <label class="control-label col-md-4">Tel&eacute;fono</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="telprop" value="<?php echo trim($telefono)?>" id="telprop" class="form-control">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  <div class="form-group">
                    <label class="control-label col-md-4">Email</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="emailprop" value="<?php echo trim($email)?>" id="emailprop" class="form-control inputmaskx inputmask-emailx obligatorio">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  <div class="form-group">
                    <label class="control-label col-md-4">Es conductor?</label>
                    <div class="col-md-6">
                      <div class="clearfix">
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="escondu" id="escondusi" class="condustatus" value="si" <?php echo $escondusi?> >
                          <label for="escondusi">Si</label>
                        </div>
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="escondu" id="esconduno" class="condustatus" value="no" <?php echo $esconduno?>>
                          <label for="esconduno">No</label>
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  <div class="condu hide">
                    <div class="form-group">
                      <label class="control-label col-md-4">Ciudad</label>
                      <div class="col-md-6">
                        <div class="inputer inputer-indigo">
                          <div class="input-wrapper">
                            <input type="text"  name="cityprop1" value="<?php echo trim($ciudad)?>" id="cityprop1" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div><!--.form-group-->
                  </div>
                  


                  <div class="form-group">
                    <label class="control-label col-md-4">Estado</label>
                    <div class="col-md-6">
                      <div class="clearfix">
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="estado_prop" id="estadoact" value="activo" <?php echo $esact?> >
                          <label for="estadoact">Activo</label>
                        </div>
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="estado_prop" id="estado_inac" value="inactivo" <?php echo $esinac?>>
                          <label for="estado_inac">Inactivo</label>
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

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
      <button type="button" class="btn btn-flat btn-indigo btn-ripple guardaedit" data-menu="<?php echo $menu;?>" >Grabar</button>
    </div>
   <script>
	  	$(document).ready(function () {


        $('input').on('ifChecked', function(event){
          alert(event.type + ' callback');
        });

        $('input.condustatus').on('ifChecked',function(event){
          var estado=$(this).val();
          alert(estado)
          if(estado=="si"){
            $(".condu").removeClass('hide');
           }else{
            $(".condu").addClass('hide');

           }
          });
          

        var data= $('.divfecha input').datepicker({
            format: "mm/dd/yyyy",
             language: "es",
             autoclose: true
         }).on('changeDate', function(ev) {
            $(this).datepicker('hide');
          }).data('datepicker');

          $('#nombreprop').focus()
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