<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal-header">
    <h4 class="modal-title">Documentos Vencidos</h4>
</div>
<div class="modal-body">
    <div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="table-responsive">
                            <table class="display table" id="tcTable">
                                <thead>
                                    <tr>
                                        <th>Movil/conductor</th>
                                        <th>Documento</th>
                                        <th>Fecha vencimiento</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                 if($docsvehi){
                                    foreach($docsvehi->result() as $value){
                            ?>
                            <tr>
                                <td><?php echo $value->id_movil?></td>
                                <td><?php echo $value->descripcion?></td>
                                <td><?php echo $value->fecha_ven?></td>
                                <td></td>
                            </tr>
                            <?php 
                                    }
                                }
                                    if($docsv){
                                        foreach($docsv->result() as $value){
                                ?>
                                <tr>
                                    <td><?php echo $value->id_movil?></td>
                                    <td><?php echo $value->documento?></td>
                                    <td><?php echo $value->fecha_vence?></td>
                                    <td></td>
                                </tr>
                                <?php 
                                        }
                                    }
                                 if($doccondu){
                                        foreach($doccondu->result() as $value){
                                ?>
                                <tr>
                                    <td><?php echo $value->id_movil?></td>
                                    <td><?php echo $value->documento?></td>
                                    <td><?php echo $value->fecha_vence?></td>
                                    <td></td>
                                </tr>
                                <?php 
                                        }
                                    }
                                ?>
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
		sart.tablaTc=$('#tcTable').DataTable({
			//"bProcessing": true,
		//	"bServerSide": true,
		//	"sAjaxSource": '<?php echo base_url() ?>sart.php/sistemasart/datatarjeta?id=<?php //echo $id; ?>',
			"columnDefs": [
				{  targets: [3],orderable:false},
                {  "width": "10%",targets: [0]},
				{  "width": "25%",targets: [1]},
			], 
			"order": [[0, 'asc']],
			"createdRow": function ( row, data, index ) {
				row.setAttribute( 'data-iditem',data[0] );
				row.setAttribute( 'data-capa','');
				row.setAttribute( 'data-toggle','');
				row.setAttribute( 'data-target','' );
				row.setAttribute( 'data-vars','');
			},
			"aLengthMenu": [
					[5,10,15,25,50,100,-1], 
					[5,10,15,25,50,100,"Todos"]
				], 
			"iDisplayLength": 25,
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
		   var url=$('#base_url').val();
		   var iditem=$(this).parent().parent().data('iditem');
		   urltc = url+'sart.php/sistemasart/pdf?ntarjeta='+iditem;
           window.open(urltc,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');  
		 }).on('click', '.cerrarTc', function(e){
			e.preventDefault();
			var idTc=$(this).parent().parent().data('iditem');
			var url=$('#base_url').val();
			$('#modal_sm').modal('show');
			
			return false;
		 })

	});
</script>