<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if(!isset($permisos)){

  $datapriv = $permisos->row();

  $id       =   $datapriv->id_usr;

  //$titulo     =   "Gestionar Privilegios";

  /*$nombre     =   $datapriv->nombre;
  $email      =   $datapriv->email;
  $telefono   =   $datapriv->phone;
  $tipo_doc   =   $datapriv->tipo_doc;
  $documento  =   $datapriv->documento;
  $login      =   $datapriv->login;
  $esadmin    =   $datapriv->admin;
  $estado     =   $datapriv->estado;
 
  $datatd     = $tipodoc->row();
  $tipdoc     = $datatd->tipo_doc;

  
    
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
  }*/

  $campoid='<span>'.$id.'</span><input type="hidden"  name="idp" value="'.$id.'" >';

}else{
  //$titulo     =   "Gestionar Privilegios - Sin Permisos";
  $id         =   "";
}

 ?>
  <style type="text/css">
      .dropdown-menu {
        z-index:9999;
      }
  </style>

    <div class="modal-header">
      <h4 class="modal-title">Gestionar Privilegios</h4>
    </div>

    <div class="modal-body">

      <div class="row"  style="margin-top: 110px;">
      
      <div class="col-md-12">

        <input type="hidden" value="<?php echo base_url() ?>" id="base_url">

        <div class="content" style="padding:0 5px 0 5px">
          <div class="row">
            <div class="col-md-12">
              <div class="panel">
                
                <div class="panel-body">

                  <table class="table table-striped" id="tableUser">
                    <thead>
                      <tr>
                        <th scope="col">Opci&oacute;n</th>
                        <th scope="col">Acceso</th>
                        <th scope="col">Leer</th>
                        <th scope="col">Borrar</th>
                        <th scope="col">Crear</th>
                        <th scope="col">Editar</th>
                      </tr>
                    </thead>

                    <tbody>
                     <?php 
                      if($permisos){
                        foreach ($permisos->result() as $array) {
                      ?>
                      <tr>
                        <td style="word-break: break-all;">
                          <?php echo $array->opcion; ?>
                              
                        </td>
                        <td style="word-break: break-all;">

                          <?php 
                            
                            if($array->permiso == 1 || $array->permiso == "1"){
                              $chkpermiso = 'checked';
                            }else{
                              $chkpermiso = '';
                            }
                          ?>

                          <div class="checkboxer checkboxer-indigo ">
                            <div class="row">
                              <div class="col-md-2">
                                <input type="checkbox" class="infocheck change_status" value="<?php echo $array->permiso; ?>" id="permiso<?php echo $array->id_permiso; ?>" <?php echo $chkpermiso; ?> data-idusr="<?php echo $array->id_usr; ?>" data-idgroup="<?php echo $array->id_group; ?>" data-appid="<?php echo $app_ID; ?>" data-vars="<?php echo base_url() ?>sart.php/sistemasart/changestatus?id_usr=<?php echo $array->id_usr; ?>&id_opcion=<?php echo $array->id_opcion; ?>&permiso=<?php echo $array->permiso; ?>&id_group=<?php echo $array->id_group; ?>">
                                <label for="permiso<?php echo $array->id_permiso;?>"></label>
                              </div>
                            </div>
                          </div>

                        </td>

                        <td style="word-break: break-all;">

                          <?php 
                            if($array->leer == 'si'){
                              $chkleer = 'checked';
                            }else{
                              $chkleer = '';
                            }
                          ?>

                          <div class="checkboxer checkboxer-indigo ">
                            <div class="row">
                              <div class="col-md-2">
                                <input type="checkbox" class="infocheck change_status" value="<?php echo $array->leer; ?>" id="leer<?php echo $array->id_permiso; ?>" <?php echo $chkleer; ?> data-idusr="<?php echo $array->id_usr; ?>" data-idgroup="<?php echo $array->id_group; ?>" data-appid="<?php echo $app_ID; ?>" data-vars="<?php echo base_url() ?>sart.php/sistemasart/changepriv?id_usr=<?php echo $array->id_usr; ?>&id_opcion=<?php echo $array->id_opcion; ?>&permiso=<?php echo $array->id_permiso; ?>&campo=leer&valor=<?php echo $array->leer; ?>&id_group=<?php echo $array->id_group; ?>">
                                <label for="leer<?php echo $array->id_permiso; ?>"></label>
                              </div>
                            </div>
                          </div>

                        </td>

                        <td style="word-break: break-all;">

                          <?php 
                            if($array->borrar == 'si'){
                              $chkborrar = 'checked';
                            }else{
                              $chkborrar = '';
                            }
                          ?>

                          <div class="checkboxer checkboxer-indigo">
                            <div class="row">
                              <div class="col-md-2">
                                <input type="checkbox" class="infocheck change_status" value="<?php echo $array->borrar; ?>" id="borrar<?php echo $array->id_permiso; ?>" <?php echo $chkborrar; ?> data-idusr="<?php echo $array->id_usr; ?>" data-idgroup="<?php echo $array->id_group; ?>" data-appid="<?php echo $app_ID; ?>" data-vars="<?php echo base_url() ?>sart.php/sistemasart/changepriv?id_usr=<?php echo $array->id_usr; ?>&id_opcion=<?php echo $array->id_opcion; ?>&permiso=<?php echo $array->id_permiso; ?>&campo=borrar&valor=<?php echo $array->borrar; ?>&id_group=<?php echo $array->id_group; ?>">
                                <label for="borrar<?php echo $array->id_permiso; ?>"></label>
                              </div>
                            </div>
                          </div>

                        </td>

                        <td style="word-break: break-all;">

                          <?php 
                            if($array->crear == 'si'){
                              $chkcrear = 'checked';
                            }else{
                              $chkcrear = '';
                            }
                          ?>

                          <div class="checkboxer checkboxer-indigo">
                            <div class="row">
                              <div class="col-md-2">
                                <input type="checkbox" class="infocheck change_status" value="<?php echo $array->crear; ?>" id="crear<?php echo $array->id_permiso; ?>" <?php echo $chkcrear; ?> data-idusr="<?php echo $array->id_usr; ?>" data-idgroup="<?php echo $array->id_group; ?>" data-appid="<?php echo $app_ID; ?>" data-vars="<?php echo base_url() ?>sart.php/sistemasart/changepriv?id_usr=<?php echo $array->id_usr; ?>&id_opcion=<?php echo $array->id_opcion; ?>&permiso=<?php echo $array->id_permiso; ?>&campo=crear&valor=<?php echo $array->crear; ?>&id_group=<?php echo $array->id_group; ?>">
                                <label for="crear<?php echo $array->id_permiso; ?>"></label>
                              </div>
                            </div>
                          </div>
                            
                        </td>
                        <td style="word-break: break-all;">

                          <?php 
                            if($array->editar == 'si'){
                              $chkeditar = 'checked';
                            }else{
                              $chkeditar = '';
                            }
                          ?>

                          <div class="checkboxer checkboxer-indigo ">
                            <div class="row">
                              <div class="col-md-2">
                                <input type="checkbox" class="infocheck change_status" value="<?php echo $array->editar; ?>" id="editar<?php echo $array->id_permiso; ?>" <?php echo $chkeditar; ?> data-idusr="<?php echo $array->id_usr; ?>" data-idgroup="<?php echo $array->id_group; ?>" data-appid="<?php echo $app_ID; ?>" data-vars="<?php echo base_url() ?>sart.php/sistemasart/changepriv?id_usr=<?php echo $array->id_usr; ?>&id_opcion=<?php echo $array->id_opcion; ?>&permiso=<?php echo $array->id_permiso; ?>&campo=editar&valor=<?php echo $array->editar; ?>&id_group=<?php echo $array->id_group; ?>">
                                <label for="editar<?php echo $array->id_permiso; ?>"></label>
                              </div>
                            </div>
                          </div>
                            
                        </td>

                      </tr>

                      <?php 
                          }
                        }else{
                      ?>
                      <td style="word-break: break-all;" colspan="6">El usuario no tiene privilegios asignados. Por favor, comun&iacute;quese con el administrador.</td>
                      <?php     
                        }
                     ?>
                    </tbody>
                  </table>

                </div><!--.panel-body-->
              </div><!--.panel-->
            </div><!--.col-md-12-->
          </div><!--.row-->

        </div><!--.content-->
     
      </div><!--.col-md-12-->

    </div><!--.modal-body-->  

    <div class="modal-footer">
      <button type="button" class="btn btn-flat btn-red btn-ripple cancelaformedit" data-dismiss="modal">Cerrar</button>
      <!--<button type="button" class="btn btn-flat btn-info btn-ripple hide grabando" ><i class="fa fa-refresh fa-spin"></i> Grabando...</button>
       <button type="button" class="btn btn-flat btn-indigo btn-ripple saveaddedituser" data-menu="<?php //echo $menu;?>" >Grabar</button> -->
    </div>

    <button class="btn btn-default toastr-notify hide grabaok" data-toastr-title="" data-toastr-type="success"
      data-toastr-notification="Solicitud grabada con Exito!!!!!" data-toastr-close-others="true"></button>
<!--     <button class="btn btn-default toastr-notify  grabaerror" data-toastr-title="" data-toastr-type="error"
        data-toastr-notification="Error al grabar!!!!!"></button>  -->
    <button class="btn btn-default toastr-notify hide grabaerror" data-toastr-close-others="true" data-toastr-type="error"
    data-toastr-notification="" data-toastr-position="toast-top-right"></button>

   <script>

      $(document).ready(function () {

        Pleasure.init();
        Layout.init();
        FormsSelect.init();

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
            
    });
   </script>