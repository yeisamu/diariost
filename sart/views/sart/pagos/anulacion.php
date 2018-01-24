<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 ?>

          <div class="modal-header">
            <h4 class="modal-title">Anulaci&oacute;n de recibo</h4>
          </div>
          <div class="modal-body">
          <form id='anulaform'>
            <input type='hidden' name="id" value="<?php echo $id ?>">
            <input type='hidden' name="tabla" value="<?php echo $tabla ?>">
            <div class= "inputer iputer-indigo" style="margin-bottom: 20px;">
              <div class="input-wrapper"> 
               <textarea class="form-control js-auto-size" rows="1" name="concepto_anula" placeholder="Motivo de la anulaci&oacute;n"></textarea>
               </div>
             </div> 

          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-flat btn-default cancelaanula" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-flat btn-primary guardanula" >Anular</button>
          </div>
        </div><!--.modal-content-->
      </div><!--.modal-dialog-->