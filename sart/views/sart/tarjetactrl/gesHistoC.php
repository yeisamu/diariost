<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal-header">
    <h4 class="modal-title">Historial Conductor</h4>
</div>
<div class="modal-body">
    <div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="table-responsive">
                            <table class="display" id="notitable">
                                <thead>
                                    <tr>
                                        <th>idHistoCondu</th>
                                        <th>Movil</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Fin</th>
                                        <th>Tarjeta #</th>
                                        <th>Doc. referencia</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>  
                    </div><!--.col-md-12-->
                </div><!--.row-->
            </div><!--.panel-body-->
        </div><!--.panel-->
    </div><!--.col-md-12-->
    </div><!--.row--> 
</div><!--.body modal--> 
<div class="modal-footer">
    <button type="button" class="btn btn-flat btn-success btn-ripple closegestarea" data-dismiss="modal">Cerrar</button>
</div> 
<script>
	$(document).ready(function () {
		Pleasure.init();
		Layout.init();
		sart.tablanoti=$('#notitable').DataTable({
			"bProcessing": true,
			"bServerSide": true,
			"sAjaxSource": '<?php echo base_url() ?>sart.php/sistemasart/dataHistoCondu',
			"columnDefs": [
				{  targets: [0],visible: false},
				{  "width": "10%",targets: [1]},
				{  "width": "20%",targets: [2]},
				{  "width": "20%",targets: [3]},
				{  "width": "10%",targets: [4]},
				{  "width": "20%",targets: [5]}


			], 
			"order": [[0, 'desc']],
			"createdRow": function ( row, data, index ) {
				row.setAttribute( 'data-iditem',data[0] );
				row.setAttribute( 'data-capa','');
				row.setAttribute( 'data-toggle','');
				row.setAttribute( 'data-target','' );
				row.setAttribute( 'data-vars','<?php echo base_url() ?>sart.php/sistemasart/editarcondu?tipo=edit&id_condu='+data[0] );
			},
			"aLengthMenu": [
					[5,10,15,25,50,100,-1], 
					[5,10,15,25,50,100,"Todos"]
				], 
			"iDisplayLength": 5,
			 "language": {
				 "search":"Buscar",
				 "lengthMenu": "Mostar _MENU_ registros",
				 "zeroRecords": "Lo sentimos, no encontramos lo que estas buscando",
				 "info": "Mostrando página _PAGE_ de _PAGES_",
				 "infoEmpty": "Registros no encontrados",
				 "sLoadingRecords": "Por favor espera - Cargando...",
				 "infoFiltered": "(Filtrado en _MAX_ registros totales)",
				 "scrollY":        "250px",
				 "scrollCollapse": true,
				 "sProcessing":     "Procesando...",
				 "paginate": {
					 "first":      "Primero",
					 "last":       "Ultimo",
					 "next":       "Sig",
					 "previous":   "Atras"
				 },
			  }
			});
		 $('#notitable').on('click', '.editaC', function(e) {
		   var div=$(this).data('div');
		   var iditem=$(this).data('iditem');
		   var status=$(this).data('data-status');
		   var control=$(this).data('vars');
		   var ini=$(this).data('ini');
		   $(this).addClass('table-success').siblings().removeClass('table-success');
		   $('#modal_medio').modal('show');
		   queue_load_all('global_medio',ini,'abreinicio');
		 }).on('click', '.abredocs', function(e){
			e.preventDefault();
			var control=$(this).parent().parent().data('iditem');
			var url=$('#base_url').val();
			$.ajax({
			   url: url+'sart.php/sistemasart/tramitanoti?id='+control,
			   type: 'POST',
			   data: {},
			   dataType: 'json',
			   cache: false,
			   contentType: false,
			   processData: false
			}).done(function(data){
				if(data.validacion == 'ok'){ 
                    $('.grabaok' ).data('toastr-notification', data.msn);
                    $('.grabaok').click();
                    sart.tablanoti.ajax.url(`${url}sart.php/sistemasart/datanoti`).load();
                }else{
                    $('.grabaerror' ).data('toastr-notification',data.msn);
                    $('.grabaerror').click();
                }
			});
			return false;
		 })

	});
</script>