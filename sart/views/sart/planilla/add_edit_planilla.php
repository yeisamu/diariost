<?php
defined('BASEPATH') OR exit('No direct script access allowed');

?>
  <style type="text/css">
      .dropdown-menu {
        z-index:9999;
      }
  </style>

    <div class="modal-header">
      <h4 class="modal-title">Importar Planilla Cartera</h4>
    </div>

    <div class="modal-body">
      <div class="row">
        <div class="col-md-12">

          <div class="panel">
            <div class="panel-body">
              <form action="#" class="form-horizontal" id="addeditplan" enctype="multipart/form-data">
                
                <div class="form-content">

                  <div class="inputer inputer-indigo">
                    <div class="input-wrapper">
                      <input type="hidden"  name="id_usr" value="<?php //echo $id; ?>" id="id_usr" class="form-control">
                    </div>
                  </div>

                  <div class="fileinput fileinput-new" data-provides="fileinput">
                    <span class="btn btn-default btn-file">
                      <span class="fileinput-new">Seleccionar archivo</span>
                      <span class="fileinput-exists">Cambiar</span>
                      <input accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" type="file" name="planilla" id="iptPlan">
                    </span>
                    <span class="fileinput-filename"></span>
                    <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>
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
      <button type="button" class="btn btn-flat btn-indigo btn-ripple loadplan" data-menu="<?php echo $menu;?>" >Grabar</button>
    </div>
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