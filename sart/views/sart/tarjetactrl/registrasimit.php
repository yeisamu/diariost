<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if($simit){
	$datasimit = $simit->row();
	 $n_parte=$datasimit->n_parte;
	 $cod_infraccion=$datasimit->cod_infraccion;
	 $valor=$datasimit->valor;
	 $convenio=$datasimit->convenio;
	 $id_condu=$datasimit->id_conductor;
	 $fecha_parte=date('d-m-Y',strtotime($datasimit->fecha_parte));
	 if($datasimit->fecha_pago != null){
		 $fecha_pago=date('d-m-Y',strtotime($datasimit->fecha_pago));
	 }else{
		$fecha_pago='';
	 }
	 $clashide='';
   }else{ 
	 $n_parte="";
	 $cod_infraccion="";
	 $valor="";
	 $convenio="";  
	 $fecha_parte='';
	 $fecha_pago='';
	 $id_condu='';
	 $clashide='hide';
   }
?>
<style>
.dropdown-menu {
    z-index:9999 !important;
}	
</style>
<div class="modal-header">
    <h4 class="modal-title">Gesti&oacute;n de Comparendos</h4>
</div>
<div class="modal-body">
    <div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                    <form id="regsimit" class="form-horizontal">
							<div class="form-content">
								<div class="form-group">
									<label class="control-label col-md-6">Comparendo #</label>
									<div class="col-md-6">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="text" name="comparendo" value="<?php echo $n_parte;?>" class="form-control obligatorio">
                                                <input type="hidden" name="idcondu" id="id" value="<?php echo $id;?>"/>
												<input type="hidden" name="idconduL" id="idconduL" value="<?php echo $id_condu;?>"/>
                                                <input type="hidden" name="tipo" id="tipo" value="<?php echo $tipo;?>"/>
											</div>
										</div>
									</div>
								</div><!--.form-group-->

								<div class="form-group">
									<label class="control-label col-md-6">Infracción</label>
									<div class="col-md-6">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="text" name="infraccion" value="<?php echo $cod_infraccion;?>" id="infraccion" class="form-control obligatorio">
											</div>
										</div>
									</div>
								</div><!--.form-group-->

								<div class="form-group">
									<label class="control-label col-md-6">Fecha</label>
                                    <div class="col-md-6 divfechax input-group" >
                                        <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                                        <div class="inputer inputer-indigo " style="margin-top:0px;">
                                            <div class="input-wrapper divfecha">
                                            <input type="text" name="fcomparendo" readonly class="form-control bootstrap-daterangepicker-basicx obligatorio" value="<?php echo $fecha_parte?>" id="fcomparendo" style="cursor:pointer">
                                            </div>
                                        </div>  
                                    </div>
								</div><!--.form-group-->
                                <div class="form-group">
									<label class="control-label col-md-6">Valor $</label>
									<div class="col-md-6">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="number" name="valcompa" id="valcompa"  value="<?php echo $valor;?>"class="form-control obligatorio">
											</div>
										</div>
									</div>
								</div><!--.form-group-->
								<div class="form-group <?php echo $clashide;?>">
									<label class="control-label col-md-6">Convenio #</label>
									<div class="col-md-6">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="text" name="convenio" id="convenio" value="<?php echo $convenio;?>"class="form-control">
											</div>
										</div>
									</div>
								</div><!--.form-group-->  
								<div class="form-group <?php echo $clashide;?>">
									<label class="control-label col-md-6">Fecha Pago</label>
                                    <div class="col-md-6 divfechax input-group" >
                                        <span class="input-group-addon"><i class="ion-android-calendar"></i></span>
                                        <div class="inputer inputer-indigo " style="margin-top:0px;">
                                            <div class="input-wrapper divfecha">
                                            <input type="text" name="fpago"  class="form-control bootstrap-daterangepicker-basicx " value="<?php echo $fecha_pago?>" id="fpago" style="cursor:pointer">
                                            </div>
                                        </div>  
                                    </div>
								</div><!--.form-group-->
   
							</div><!--.form-content-->
						</form>
                    </div><!--.col-md-12-->
                </div><!--.row-->
            </div><!--.panel-body-->
        </div><!--.panel-->
    </div><!--.col-md-12-->
    </div><!--.row--> 
</div><!--.body modal--> 
<div class="modal-footer">
    <button type="button" class="btn btn-flat btn-red btn-ripple cancelaformedit" data-dismiss="modal">Cancelar</button>
    <button type="button" class="btn btn-flat btn-info btn-ripple hide grabando" ><i class="fa fa-refresh fa-spin"></i> Grabando...</button>
    <button type="button" class="btn btn-flat btn-indigo btn-ripple guardasimit" >Grabar</button>
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