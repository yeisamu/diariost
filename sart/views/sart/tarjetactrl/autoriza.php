<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal-header">
    <h4 class="modal-title">Funcion especial</h4>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 ">
                            <form action="#" class="form-horizontal" id="frmAutFe">
                                <div class="form-content">
                                    <div class="form-group">
                                        <label class="control-label col-md-6">Usuario</label>
                                        <div class="col-md-6">
                                            <div class="inputer">
                                                <div class="input-wrapper">
                                                    <input type="text" name="user" id="user" class="form-control obligatorio">
                                                </div>
                                            </div>
                                        </div>
                                    </div><!--.form-group-->

                                    <div class="form-group">
                                        <label class="control-label col-md-6">Contraseña</label>
                                        <div class="col-md-6">
                                            <div class="inputer">
                                                <div class="input-wrapper">
                                                    <input type="password" name="contra" id="contra" class="form-control obligatorio">
                                                </div>
                                            </div>
                                        </div>
                                    </div><!--.form-group-->
                                    <div class="form-group">
                                        <label class="control-label col-md-6">Fecha</label>
                                        <div class="col-md-6 divfechax input-group" >
                                            <div class="inputer inputer-indigo " style="margin-top:0px;">
                                                <div class="input-wrapper divfecha">
                                                    <input type="text" name="fauto"  class="form-control bootstrap-daterangepicker-basicx obligatorio" value="<?php echo date('d-m-Y');?>" id="fauto" style="cursor:pointer">
                                                </div>
                                            </div>  
                                        </div>
                                    </div><!--.form-group-->
							    </div>
						    </form>
                        </div><!--.col-md-12-->
                    </div><!--.row-->
                </div><!--.panel-body-->
            </div><!--.panel-->
        </div><!--.col-md-12-->
    </div><!--.row--> 
</div><!--.body modal--> 
<div class="modal-footer">
    <button type="button" class="btn btn-flat btn-red btn-ripple cancelaFe" data-dismiss="modal">Cancelar</button>
    <button type="button" class="btn btn-flat btn-info btn-ripple hide grabandoFe" ><i class="fa fa-refresh fa-spin"></i> Grabando...</button>
    <button type="button" class="btn btn-flat btn-indigo btn-ripple guardaFe "  >Grabar</button>
</div> 
<script>
	$(document).ready(function () {
		Pleasure.init();
		Layout.init();
        $('.dropdown-menu').css('z-index','9999');
        var data= $('.divfecha input').datepicker({
            format: "dd-mm-yyyy",
            language: "es",
            autoclose: true
        }).on('changeDate', function(ev) {
            $(this).datepicker('hide');
        }).data('datepicker');
	});
</script>