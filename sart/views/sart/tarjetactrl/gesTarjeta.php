<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal-header">
    <h4 class="modal-title">Gesti&oacute;n de Tarjetas de control</h4>
</div>
<div class="modal-body">
    <div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="table-responsive">
                            <table class="display" id="tcTable">
                                <thead>
                                    <tr>
                                        <th># Tarjeta Control</th>
                                        <th>Conductor</th>
                                        <th>Movil</th>
                                        <th>Vigencia</th>
                                        <th>Estado Vigencia</th>
                                        <th>Estado TC</th>
                                        <th>Acciones</th>
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
    <div style="position:fixed;bottom:60px;right:30px;z-index:100;">
			<a class="btn btn-floating btn-red show-on-hover abre_mod_global " data-capa='global_lg'
			   data-toggle="modal"  data-target="#modal_lg" 
			   data-vars="<?php echo base_url() ?>sart.php/sistemasart/gesTc?tipo=nuevo&id=<?php echo $id; ?>">
				<i class="ion-document-text "></i>
			</a>
	</div>
</div><!--.body modal--> 
<div class="modal-footer">
    <button type="button" class="btn btn-flat btn-success btn-ripple closegestarea" data-dismiss="modal">Cerrar</button>
</div> 
<script>
	$(document).ready(function () {
		Pleasure.init();
		Layout.init();
		sart.tablaTc=$('#tcTable').DataTable({
			"bProcessing": true,
			"bServerSide": true,
			"sAjaxSource": '<?php echo base_url() ?>sart.php/sistemasart/datatarjeta?id=<?php echo $id; ?>',
			"columnDefs": [
				{  targets: [4],orderable:false},
				{  targets: [5],orderable:false},
				{  targets: [6],orderable:false},
                {  "width": "10%",targets: [0]},
				{  "width": "25%",targets: [1]},
			], 
			"order": [[0, 'desc']],
			"createdRow": function ( row, data, index ) {
				row.setAttribute( 'data-iditem',data[0] );
				row.setAttribute( 'data-capa','global_lg');
				row.setAttribute( 'data-toggle','modal');
				row.setAttribute( 'data-target','#modal_lg' );
				row.setAttribute( 'data-vars','<?php echo base_url() ?>sart.php/sistemasart/gesTc?tipo=edit&&id=<?php echo $id; ?>&idTc='+data[0]);
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
		 $('#tcTable').on('click', '.printarjeta', function(e) {
			e.preventDefault();
		   var url=$('#base_url').val();
		   var iditem=$(this).parent().parent().data('iditem');
		   urltc = url+'sart.php/sistemasart/pdf?ntarjeta='+iditem;
           window.open(urltc,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');  
		   return false;
		}).on('click', '.printarjetaAct', function(e) {
			e.preventDefault();
		   var url=$('#base_url').val();
		   var iditem=$(this).parent().parent().data('iditem');
		   urltc = url+'sart.php/sistemasart/pdfUpdateTc?ntarjeta='+iditem;
           window.open(urltc,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');  
		   return false;
		}).on('click', '.cerrarTc', function(e){
			e.preventDefault();
			var idTc=$(this).parent().parent().data('iditem');
			var url=$('#base_url').val();
			$('#modal_sm').modal('show');
			$('#global_sm').html('<div class="modal-header">\n\
										<h4 class="modal-title">Confirmaci&oacute;n</h4>\n\
									</div>\n\
									<div class="modal-body">\n\
										<div class="row">\n\
										<div class="col-md-12">\n\
											<div class="panel">\n\
												<div class="panel-body">\n\
												<form action="#" class="form-horizontal" id="frmTarjeta" enctype="multipart/form-data">\n\
													<h5>Desea cerrar esta Tarjeta de control?</h5>\n\
													<input type="hidden"  name="tarjeta" value="'+idTc+'" id="tarjeta" class="form-control">\n\
													<input type="hidden"  name="idconductor" value="<?php echo $id; ?>" id="idconductor" class="">\n\
													<input type="hidden"  name="tipo" value="cerrar" id="tipo" class="">\n\
												</div>\n\
												</form>\n\
											</div><!--.panel-->\n\
										</div><!--.col-md-12-->\n\
										</div><!--.row--> \n\
									</div><!--.body modal--> \n\
									<div class="modal-footer">\n\
										<button type="button" class="btn btn-flat btn-success btn-ripple cancelaformedit" data-dismiss="modal">Cancelar</button>\n\
										<button type="button" class="btn btn-flat btn-info btn-ripple hide grabando" ><i class="fa fa-refresh fa-spin"></i> Grabando...</button>\n\
    									<button type="button" class="btn btn-flat btn-indigo btn-ripple guardaTC "  >Grabar</button>\n\
									</div>');
			return false;
		 })

	});
</script>