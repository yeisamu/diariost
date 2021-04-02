<?php 

  if(isset($gfijo)){
   
   if($gfijo){
     $valg=$gfijo;
   }else{
     $valg="";  
   }

  }else{
     $valg="";  
  }

  if($permisos){
    $dataper=$permisos->row();
    $leer=$dataper->leer;
    $borrar=$dataper->borrar;
    $editar=$dataper->editar;
    $crear=$dataper->crear;
  }
?>

<!DOCTYPE html>
<html lang="es">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>S.A.R.T</title>

  <meta name="description" content="">
  <meta name="author" content="">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

  <!-- BEGIN CORE CSS -->
  <link rel="stylesheet" href="<?php echo base_url() ?>css/admin1.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>css/elements.css">
  <!-- END CORE CSS -->

  <!-- BEGIN PLUGINS CSS -->
  <link rel="stylesheet" href="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/css/jasny-bootstrap.min.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-table/dist/bootstrap-table.min.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>plugins/scroll/css/perfect-scrollbar.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>css/plugins.css">

  <link rel="stylesheet" href="<?php echo base_url(); ?>plugins/datatables/media/css/jquery.dataTables.min.css">
   <link rel="stylesheet" href="<?php echo base_url(); ?>plugins/datatables/themes/bootstrap/dataTables.bootstrap.css">
  <!-- END PLUGINS CSS -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/chosen/chosen.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/selectize/dist/css/selectize.bootstrap3.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/multiselect/css/multi-select.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/pnikolov-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/minicolors/jquery.minicolors.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/datepicker/css/datepicker.css">

    <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugins/swal/sweetalert.css">

  <!-- BEGIN SHORTCUT AND TOUCH ICONS -->
  <link rel="shortcut icon" href="<?php echo base_url() ?>img/icons/favicon.ico">
  <link rel="apple-touch-icon" href="<?php echo base_url() ?>img/icons/apple-touch-icon.png">
  <!-- END SHORTCUT AND TOUCH ICONS -->
</head>
<body style="overflow:hidden">

   
<input type="hidden" value="<?php echo base_url() ?>" id="base_url">
<input type="hidden"  id="search2">
<input type="hidden"  id="campo">
<input type="hidden"  id="filtrog" value='<?php echo $valg ?>'>
<input type="hidden" id="order" value="id_movil">
<input type="hidden" id="corder" value="id_movil">   
<input type="hidden" id="orderby" value="asc">
<input type="hidden" id="idapp" value="<?php echo $app_ID; ?>">
  
  <div class="content" style="padding:0 5px 0 5px">
    <div class="page-header full-content header-tabs sticky fixed bg-indigo" style="width: 100%;left: 40px">
      <div class="row">
        <div class="col-xs-10">
          <h1 style="font-size: 25px;">Gesti&oacute;n de Cartera<small></small></h1>
        </div><!--.col-->
        <div class="col-xs-2 menu" data-grupo="<?php echo $valg ?>" style="cursor:pointer">
          <ol class="breadcrumb">
            <li><a href="#"><i class="ion-android-menu"></i></a></li>
            <li><a href="#">Men&uacute;</a></li>
          </ol>
        </div><!--.col-->
      </div><!--.row-->
    </div><!--.page-header-->

    <div class="row"  style="margin-top: 110px;">
      
      <div class="col-md-12">

        <input type="hidden" value="<?php echo base_url() ?>" id="base_url">
        <div class="content" style="padding:0 5px 0 5px">
          <div class="row">
            <div class="col-md-12">
              <div class="panel">
                <div class="panel-heading">
                  <div class="panel-title"><h4>Cartera</h4></div>
                </div><!--.panel-heading-->
                <div class="panel-body">

                  <table class="display datatables-crud" id="tableUser">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Tipo</th>
                        <th>Número</th>
                        <th>Fecha</th>
                        <th style="text-align: center;">Plazo</th>
                        <th>Vencimiento</th>
                        <th>Documento</th>
                        <th>Nombre</th>
                        <th>Movil</th>
                        <th>Días de Mora</th>
                        <th style="text-align: center;">Valor</th>
                        <th style="text-align: center;">Abono</th>
                        <th style="text-align: center;">Saldo</th>
                        <th style="text-align: center;">Cartera</th>
                      </tr>
                    </thead>

                    <tbody>
                     <?php 
                       if($planilla){
                        foreach ($planilla->result() as $array) {?>
                      <tr>
                        <td style="word-break: break-all;"><?php echo $array->id; ?></td>
                        <td style="word-break: break-all;"><?php echo $array->tipo; ?></td>
                        <td style="word-break: break-all;"><?php echo $array->numero; ?></td>
                        <td style="word-break: break-all;"><?php echo $array->fecha; ?></td>
                        <td style="word-break: break-all;text-align: center;"><?php echo $array->plazo; ?></td>
                        <td style="word-break: break-all;"><?php echo $array->vencimiento; ?></td>
                        <td style="word-break: break-all;"><?php echo $array->documento; ?></td>
                        <td style="word-break: break-all;"><?php echo $array->nombre; ?></td>
                        <td style="word-break: break-all;text-align: center;"><?php echo $array->movil; ?></td>
                        <td style="word-break: break-all;text-align: center;"><?php echo $array->mora; ?></td>
                        <td style="word-break: break-all;text-align: right;"><?php echo "$".number_format($array->valor, 0); ?></td>
                        <td style="word-break: break-all;text-align: right;"><?php echo "$".number_format($array->abono, 0); ?></td>
                        <td style="word-break: break-all;text-align: right;"><?php echo "$".number_format($array->saldo, 0); ?></td>
                        <td style="word-break: break-all;text-align: center;"><?php echo $array->cartera; ?></td>
                      </tr>
                      <?php 
                          }
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

      <!-- =========================head tipodoc================== -->
      <!-- =========================body tipodoc================== -->
      <div style="position:fixed;bottom:30px;right:30px;z-index:100;">
      <?php 
        if($crear=="si"){
      ?>
      <a class="btn btn-floating btn-red show-on-hover ">
        <i class="ion-android-arrow-up"></i>
        <ul class="to-top">
          <li  >
           <i class="ion-android-upload btn btn-floating btn-red abre_edit" 
              style="margin-left: -7px !important;" data-toggle="modal"  
               data-target="#add_edit_planilla" data-vars="<?php echo base_url() ?>sart.php/sistemasart/add_edit_planilla?tipo=nuevo&menu=planilla">
           </i>
          </li>
          
          <!-- <li  >
           <i class="fa fa-taxi btn btn-floating btn-red abre_mod_global " data-capa='taxi_modal'
              style="margin-left: -1px !important;padding: 10px;" data-toggle="modal"  
              data-target="#modaluser" data-vars="<?php //echo base_url() ?>sart.php/sistemasart/taximodal?tipo=nuevo&app_ID=<?php //echo $app_ID; ?>">
           </i>
          </li> -->

        </ul>
      </a>
      <?php 
        }
      ?>
      </div>
      
       </div><!--.col-md-12-->
    </div><!--.row-->

    
  </div><!--.content-->

  <button class="btn btn-default toastr-notify hide grabaok" data-toastr-title="" data-toastr-type="success"
      data-toastr-notification="Solicitud grabada con Exito!!!!!" data-toastr-close-others="true"></button>
<!--     <button class="btn btn-default toastr-notify  grabaerror" data-toastr-title="" data-toastr-type="error"
        data-toastr-notification="Error al grabar!!!!!"></button>  -->
    <button class="btn btn-default toastr-notify hide grabaerror" data-toastr-close-others="true" data-toastr-type="error"
    data-toastr-notification="" data-toastr-position="toast-top-right"></button>

  <div class="modal fade full-height from-right" id="panel-modal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Nueva Solicitud de Documento</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12">

              <div class="panel">
                <div class="panel-body">
                  <form action="#" class="form-horizontal" id="adddoc">
                    <div class="form-content">
                      <div class="form-group">
                        <label class="control-label col-md-5">Nombre del documento</label>
                        <div class="col-md-6">
                          <div class="inputer inputer-green">
                            <div class="input-wrapper">
                              <input type="text"  name="ndoc" id="ndoc" class="form-control">
                              <input type="hidden" name="id_proc" id="id_proc" value="<?php //echo $id_proc ?>" >
                            </div>
                          </div>
                        </div>
                      </div><!--.form-group-->
                      <div class="form-group">
                        <label class="control-label col-md-5">Detalle</label>
                        <div class="col-md-6">
                          <div class="inputer inputer-green">
                            <div class="input-wrapper">
                              <textarea name="detallen" class="form-control"></textarea>
                            </div>
                          </div>
                        </div>
                      </div><!--.form-group-->
                      <div class="form-group">
                        <label class="control-label col-md-5">Solicitante</label>
                        <div class="col-md-6">
                          <div class="inputer inputer-green">
                            <div class="input-wrapper">
                              <input type="text" name="solicita" class="form-control">
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
          <button type="button" class="btn btn-flat btn-red btn-ripple cancelaform" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-flat btn-green btn-ripple guardanuevo" >Grabar</button>
        </div>
      </div>
    </div>
  </div><!--.modal-->
  <div class="modal fade full-height from-left" id="add_edit_planilla" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" id="edit_modal">
      </div>
     </div>
  </div><!--.modal-->
    <div class="modal fade full-height from-left" id="borrar_doc" tabindex="-1" role="dialog" aria-hidden="true">
     <div class="modal-dialog">
        <div class="modal-content " id="borrar_modal">
        </div>
       </div>
    </div><!--.modal--> 

  <div class="modal fade full-scream" id="modaluser" style="overflow-y: hidden;" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content " id="user_modal" style="overflow:hidden">
      </div>
    </div>
  </div><!--.modal-->
  
  <!-- BEGIN GLOBAL AND THEME VENDORS -->
  <script src="<?php echo base_url() ?>js/global-vendors.js"></script>
  <!-- END GLOBAL AND THEME VENDORS -->

  <!-- BEGIN PLUGINS AREA -->
  <!-- END PLUGINS AREA -->

  <!-- PLUGINS INITIALIZATION AND SETTINGS -->
  <script src="<?php echo base_url() ?>scripts/user-pages.js"></script>
  <!-- END PLUGINS INITIALIZATION AND SETTINGS -->

  <!-- PLEASURE Initializer perfect-scrollbar.css -->
  <script src="<?php echo base_url() ?>js/pleasure.js"></script>
  <!-- ADMIN 1 Layout Functions -->
  <script src="<?php echo base_url() ?>js/layout.js"></script>
  <script src="<?php echo base_url() ?>scripts/forms-select.js"></script>
  <script src="<?php echo base_url() ?>scripts/forms-tools.js"></script>
  <script src="<?php echo base_url() ?>scripts/forms-pickers.js"></script>
  <script src="<?php echo base_url() ?>js/funciones.js"></script>
  <script src="<?php echo base_url() ?>plugins/modernizr/modernizr.min.js"></script>
  <script src="<?php echo base_url() ?>plugins/scroll/js/perfect-scrollbar.jquery.js"></script>
  <script src="<?php echo base_url() ?>plugins/scroll/js/perfect-scrollbar.js"></script>
  <script src="<?php echo base_url() ?>plugins/chosen/chosen.jquery.min.js"></script>
  <script src="<?php echo base_url() ?>plugins/selectize/dist/js/standalone/selectize.min.js"></script>
  <script src="<?php echo base_url() ?>plugins/multiselect/js/jquery.multi-select.js"></script>
  <script src="<?php echo base_url() ?>plugins/quicksearch/dist/jquery.quicksearch.min.js"></script>
  <script src="<?php echo base_url() ?>plugins/jquery.inputmask/dist/jquery.inputmask.bundle.js"></script>
  <script src="<?php echo base_url() ?>plugins/datepicker/js/bootstrap-datepicker.js"></script>

  <script src="<?php echo base_url() ?>plugins/jasny-bootstrap/dist/js/jasny-bootstrap.min.js"></script>
  <script src="<?php echo base_url() ?>plugins/datatables/media/js/jquery.dataTables.min.js"></script>
  <script src="<?php echo base_url() ?>scripts/tables-datatables-editor.js"></script>
  <script src="<?php echo base_url() ?>plugins/datatables/themes/bootstrap/dataTables.bootstrap.js"></script>
  <script src="<?php echo base_url() ?>plugins/swal/sweetalert.min.js"></script>
  
  <script>
    $(document).ready(function () {
      Pleasure.init();
      Layout.init();
      TablesDataTablesEditor.init();

      $("#dt-new").hide();
      $("#dt-deleteall").hide();

      $('.datatables-crud').dataTable({
        'columns': [{
          'orderable': false
          }, {
          'orderable': true
          }, {
          'orderable': true
          }, {
          'orderable': true
          }, {
          'orderable': false
          }, {
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': false
          },{
          'orderable': true
        }],
        /*'order': [
          [1, "asc"]
        ],*/
        'dom': '<"toolbar pull-left">frtip'
      });

    });
  </script>

</body>
</html>