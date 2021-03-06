<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal-header">
    <h4 class="modal-title">Gesti&oacute;n de Formatos Conductor</h4>
</div>
<div class="modal-body">
    <div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="panel">
                            <div class="panel-body without-padding">
                                <ul class="list-material">
                                    <li class="has-action-left has-action-right">
                                        <a href="<?php echo base_url() ?>sart.php/sistemasart/generaestadisticac?id=<?php echo $id;?>&formaid=Estadistica Conductor" class="visible" target="_blank">
                                            <div class="list-action-left">
                                                <i class="ion-document-text icon"></i>
                                            </div>
                                            <div class="list-content">
                                            <span class="title">Estadisticas Conductores</span>
                                                <span class="caption">Formato de estadistica para el conductor xxxxx</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="has-action-left has-action-right">
                                        <a href="<?php echo base_url() ?>sart.php/sistemasart/generanopension?id=<?php echo $id;?>&formaid=Sello no pension" class="visible" target="_blank">
                                            <div class="list-action-left">
                                                <i class="ion-document icon"></i>
                                            </div>
                                            <div class="list-content">
                                                <span class="title">Formato sello no pension</span>
                                                <span class="caption"></span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div><!--.panel-body-->
				</div><!--.panel-->
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

	});
	</script>