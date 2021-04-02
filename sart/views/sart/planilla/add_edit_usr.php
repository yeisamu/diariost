<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if($user){

  $datauser = $user->row();

  $id         =   $datauser->id_usr;
  $nombre     =   $datauser->nombre;
  $email      =   $datauser->email;
  $telefono   =   $datauser->phone;
  $tipo_doc   =   $datauser->tipo_doc;
  $documento  =   $datauser->documento;
  $login      =   $datauser->login;
  $esadmin    =   $datauser->admin;
  $estado     =   $datauser->estado;
 
  $datatd     = $tipodoc->row();
  $tipdoc     = $datatd->tipo_doc;

  $titulo="Modificar Usuario";
    
  if($estado=='activo'){
    $esact='checked="checked"';
    $esinac='';
  }else{
    $esact='';
    $esinac='checked="checked"';
  }

  if($esadmin=='1'){
    $esadminsi='checked="checked"';
    $esadminno='';
  }else{
    $esadminsi='';
    $esadminno='checked="checked"';
  }

  $campoid='<span>'.$id.'</span><input type="hidden"  name="idp" value="'.$id.'" >';

}else{ 

  $titulo="Agregar Usuario";

  $id         =   '';
  $nombre     =   '';
  $email      =   '';
  $telefono   =   '';
  $tipo_doc   =   '';
  $documento  =   '';
  $login      =   '';
  $estado     =   '';

  $datatd     = $tipodoc->row();
  $tipdoc     = $datatd->tipo_doc;

  $esadminsi='';
  $esadminno='checked="checked"';

  $tipdoc = "";

  $esact='checked="checked"';
  $esinac='';
  
  $campoid='<div class="inputer inputer-indigo">
              <div class="input-wrapper">
                <input type="text"  name="idp" value="" id="idp" class="form-control">
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
              <form action="#" class="form-horizontal" id="addedituser">
                <input type="hidden" name="tipo" value="<?php echo $tipo?>" >
                
                <div class="form-content">

                  <div class="form-group" style="display: none;">
                    <div class="col-sm-12">
                     <?php 
                       echo $campoid;
                     ?>  
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="control-label col-md-4">Nombre</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="nomuser" value="<?php echo $nombre ?>" id="nomuser" class="form-control obligatorio" autocomplete="off">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

                  <div class="form-group">
                    <label class="control-label col-md-4">Tipo Documento</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <select class="selecter selpop selobligatorio" name="seltipodoc" id="seltipodoc" data-style="btn-indigo" data-width="100%">
                            <option selected="selected" value="">Seleccione</option>
                            <?php 
                              foreach ($tipodoc->result() as $datatipodoc) {
                            ?>
                                <option value=" <?php echo $datatipodoc->tipo_doc ?>"  <?php if($tipdoc==$datatipodoc->tipo_doc) echo'selected="selected"'?>> <?php echo $datatipodoc->abreviatura." ".$datatipodoc->descrip ?></option>
                            <?php
                             }  
                            ?>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

                  <div class="form-group">
                    <label class="control-label col-md-4">Documento</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="docuser" value="<?php echo trim($documento)?>" id="docuser" class="form-control obligatorio" autocomplete="off">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  
                  <div class="form-group">
                    <label class="control-label col-md-4">Email</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="emailuser" value="<?php echo trim($email)?>" id="emailuser" class="form-control inputmask inputmask-email obligatorio">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

                  <div class="form-group">
                    <label class="control-label col-md-4">Usuario</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="aliasuser" value="<?php echo trim($login)?>" id="aliasuser" class="form-control obligatorio" autocomplete="off">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

                  <div class="form-group">
                    <label class="control-label col-md-4">Clave</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="password"  name="passuser" value="" id="passuser" class="form-control obligatorio" autocomplete="off">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->
                  
                  <div class="form-group">
                    <label class="control-label col-md-4">Tel&eacute;fono</label>
                    <div class="col-md-6">
                      <div class="inputer inputer-indigo">
                        <div class="input-wrapper">
                          <input type="text"  name="teluser" value="<?php echo trim($telefono)?>" id="teluser" class="form-control obligatorio" maxlength="10" autocomplete="off">
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

                  <div class="form-group">
                    <label class="control-label col-md-4">¿Es Administrador?</label>
                    <div class="col-md-6">
                      <div class="clearfix">
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="esadmin" id="esadminsi" class="condustatus" value="1" <?php echo $esadminsi?> >
                          <label for="esadminsi">Si</label>
                        </div>
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="esadmin" id="esadminno" class="condustatus" value="0" <?php echo $esadminno?>>
                          <label for="esadminno">No</label>
                        </div>
                      </div>
                    </div>
                  </div><!--.form-group-->

                  <div class="form-group">
                    <label class="control-label col-md-4">Estado</label>
                    <div class="col-md-6">
                      <div class="clearfix">
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="estado_user" id="estadoact" value="activo" <?php echo $esact?> >
                          <label for="estadoact">Activo</label>
                        </div>
                        <div class="radioer radioer-indigo form-inline">
                          <input type="radio" name="estado_user" id="estado_inac" value="inactivo" <?php echo $esinac?>>
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
      <button type="button" class="btn btn-flat btn-indigo btn-ripple saveaddedituser" data-menu="<?php echo $menu;?>" >Grabar</button>
    </div>
   <script>

	  	$(document).ready(function () {

        Pleasure.init();
        Layout.init();
        FormsSelect.init();

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


        $('#nomuser').focus();

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