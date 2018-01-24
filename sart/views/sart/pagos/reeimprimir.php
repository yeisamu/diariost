<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 ?>
 <style type="text/css">
.modal.full-height .modal-content .modal-body {
     height: 92%; 
    max-height: inherit;
}
.modal .modal-content .modal-body {
    padding: 16px 24px;
    max-height: 500px;
    overflow: hidden;
}
 </style>
   	<div class="modal-header">
    		<h4 class="modal-title">Reeimprimir recibos</h4>
    </div>
    <div class="modal-body">
      <div class="row wet-asphalt">
      	<div class="col-md-12">
      		<div class="panel">
      			<div class="panel-heading">
      				<!--</div>.panel-heading-->
      			<div class="panel-body">
                <div class="row"  style="">
                  <div class="col-md-12">
                  <table class="table col-md-12 table-borderedx margin_0 bck_table border_r_0 border_l_0 restar_divx" style="">
                      <thead>
                          <tr>
                              <td class="col-xs-6 border_r_0 border_b_0" style="border-left:none !important;padding:0px 20px 0px 0px">
                                <!--   <div class="nav_header">
                                      <i class="fa fa-list-alt"></i> Total  
                                      <span id="cant_doc" class="gray">(0) </span>
                                  </div> -->
                                  <span id="campofilter">
                                    <input type="hidden" name="tabla" id="tabla" value="diarios">
                                    <input type="hidden" name="campoid" id="campoid" value="id_diario">
                                    <input type="hidden" name="campot" id="campot" value="total">
                                  </span>
                                  
                                  <div class="row example-row">
                                    <div class="col-md-9">
                                      <select class="selecter" id="tiporec">
                                        <option selected='selected' value="1">Diarios</option>
                                        <!-- <option value="2">Taller</option> -->
                                        <option value="3">Descuento</option>
                                      </select>
                                    </div><!--.col-md-9-->
                                  </div><!--.row-->
                              </td>
                              <td class="col-xs-6 border_l_0 border_b_0" style="padding:0px 20px 0px 0px">
                                   <div class="input-group">
                                    <span class="input-group-addon"><i class="ion-search"></i></span>
                                    <div class="inputer  inputer-indigo">
                                      <div class="input-wrapper">
                                        <input type="text" class="form-control" id="buscareemp" placeholder="Buscar">
                                          <span class="ion-android-close reseteareemp form-control-feedback cursor hide">
                                          </span>
                                      </div>
                                    </div>
                                   </div>
                              </td>
                          </tr>
                      </thead>
                  </table>
                    <div class="element_hide restar_div">
                      <table class="table table-condensed col-md-12x margin_0 bck_table" style="font-size: 13px;">
                        <tr>
                          <th  width="10%" style="padding-left: 5px;border-left: 1px solid #ddd;"></th>
                          <th  width="10%" style="padding-left: 5px;border-bottom: 1px solid #ddd;">#</th>
                          <th  width="20%" style="border: 1px solid #ddd;">
                            <!-- <div class="col-md-12 orderby" data-div="#busqueda_list" 
                            data-vars="?order=id_movil&tipo=list" data-control="listar_tabla"  data-value="id_movil" style="display: inline-table;cursor:pointer;"> -->
                              <span class="hidden-md hidden-sm" ><!-- <i class="fa fa-sort hidden-md hidden-sm"></i> --> Movil</span>
                              <span class="visible-md visible-sm" >M</span>
                           <!--  </div> -->
                          </th>
                          <th  width="20%" style="padding-left: 5px;border: 1px solid #ddd;">
                           <!-- <div class="col-md-12 popovertipodoc " data-toggle="popover" data-trigger="focus" data-popover-content="#a4"
                           data-placement="right" style="display: inline-table;cursor:pointer;"> -->
                             <span class="hidden-md hidden-sm" >Placa</span>
                             <span class="visible-md visible-sm" >P</span>
                           <!-- </div> -->
                          </th>
                          <th  width="20%" style="padding-left: 5px;border: 1px solid #ddd;">Fecha</th>
                          <th  width="20%" style="padding-left: 5px;border: 1px solid #ddd;">
                            <!-- <div class="col-md-12 orderby" data-div="#busqueda_list" 
                            data-vars="?order=pago_hasta&tipo=list" data-control="listar_tabla"  data-value="pago_hasta" style="display: inline-table;cursor:pointer;"> -->
                             <span class="" ><!-- <i class="fa fa-sort hidden-md hidden-sm"></i> --> Valor</span>
                            <!-- </div> -->
                          </th>
                      <!-- <th  width="1%" style="border-right: 1px solid #ddd;border-bottom: 1px solid #ddd;"></th> -->
                    </tr>
                  </table>
                  </div>
                  <div class="element_visible restar_div">
                      <table class="table table-condensed span12 table-bordered margin_0 bck_table">
                          <thead>
                              <tr style="border-bottom:none !important;">
                                  <td style="border-bottom:none !important;">#
                                      <i class="fa fa-angle-right gray"></i>Movil
                                      <i class="fa fa-angle-right gray"></i> Placa
                                      <i class="fa fa-angle-right gray"></i> Fecha 
                                      <i class="fa fa-angle-right gray"></i> Valor
                                  </td>
                              </tr>
                          </thead>
                      </table>
                  </div> 
                  <!-- =========================head tipodoc================== -->
                  <!-- =========================body tipodoc================== -->

                  <div class="scroll_recibo_busca scroll_div" data-class=".scroll_recibo_busca" style="position:relative">
                      <table class="table table-condensed bck_table margin_0 table-hover table_tr_selected" style="font-size: 12px;">
                          <tbody id="busqueda_rec">
                          </tbody>
                      </table>
                  </div>
                   </div><!--.col-md-12-->
                </div><!--.row-->

      			</div><!--.panel-body-->
      		</div><!--.panel-->
      	</div><!--.col-md-6-->
      </div><!--. wet-asphalt-->	
    </div>
  </div>
    
    	<!--div class="modal-footer">
    		<button type="button" class="btn btn-flat-primary" data-dismiss="modal">DISAGREE</button>
    		<button type="button" class="btn btn-flat-primary" data-dismiss="modal">AGREE</button>
    	</div-->
    <script>
     $(document).ready(function () {
        Pleasure.init();
        Layout.init();
         var win_height = window.innerHeight;
        var resta =win_height-195;
        //console.log(win_height);
       var vg=$('#filtrog').val();
        if(vg!=''){
          var parini='?grupo='+vg+'&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID=<?php echo $app_ID?>';
        }else{
          var parini='?tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID=<?php echo $app_ID?>';
        }
        //console.log(resta);
        $('.scroll_recibo_busca').height(resta+'px');
        $('.scroll_recibo_busca').perfectScrollbar({
           
            wheelPropagation: false,
            minScrollbarLength: 100,
            useBothWheelAxes: false,
            useKeyboard: true,
            suppressScrollX: true
        }); 
             queue_load_all('#busqueda_rec',parini,'detalle_reeimprime');

     $('.scroll_recibo_busca').scroll(function() {
         if($('.scroll_recibo_busca').is(':visible')){
             
             if($(this)[0].scrollHeight - $(this).scrollTop() == $(this).outerHeight()) {
                 if (parseFloat(sgcapp.page) >= parseFloat(sgcapp.pages)) {
                     //========================
                 }else{
                      var vg=$('#filtrog').val();
                      if(vg!=''){
                        var parini='&grupo='+vg+'&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID=<?php echo $app_ID?>';
                      }else{
                        var parini='&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID=<?php echo $app_ID?>'
                      }
                     sgcapp.page = parseFloat(sgcapp.page) + 1;
                     var params = '<?php echo base_url() ?>sart.php/sistemasart/detalle_reeimprime?page='+sgcapp.page+parini+'&search='+$('#buscareemp').val();
                     $.ajax({
                         url: params,
                         type: "POST",
                         async: true,
                         cache: false,
                         success: function( result ) {
                             $('#busqueda_rec').append(result);
                         }
                     });
                 }
             }
         }
     });

	     $(window).resize(function() {
	        var win_height = window.innerHeight;
          var resta =win_height-195;
          $('.scroll_recibo_busca').height(resta+'px');
          $('.scroll_recibo_busca').perfectScrollbar('update');
	     });	
       });
     </script> 