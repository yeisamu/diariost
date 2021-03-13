<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal-header">
    <h4 class="modal-title">Gesti&oacute;n de Notificaciones</h4>
</div>
<div class="modal-body">
    <div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                       <table class=" table">
                        <tr>
                            <td class="ui-jqgrid-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ">
                            <table >
                        <tr>
                            <td >Tipo de Registro</td>
                            <td><select  name="tipomultas" id="tipomultas" class="ui-widget-content ui-corner-all" >
                                            <option value="" selected="selected" >Seleccione Tipo</option>
                                            <option value="0"  >Sin Multas</option>
                                            <option value="1" >Con Multas</option>
                                            <option value="2" >Multas Con Convenio</option> 
                                    </select>
                            </td>
                        </tr>
                        </table>

                            </td>
                        </tr>
                        <tr>
                            <td class="ui-jqgrid-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ">
                            
                                <div id="convenio" >
                            
                            <table >
                            <tr>
                                <td>Parte #</td>
                                <td >Infracci&oacute;n</td>
                                <td >Entidad </td>
                                </tr>
                                
                            <tr>
                                <td><input type="text" id="comparendocon" name="comparendocon" size="5" class="ui-widget-content ui-corner-all"  /></td>
                                <td><input type="text" id="infraccioncon" name="infraccioncon" size="7" class="ui-widget-content ui-corner-all"  /></td>
                                        <td class="ui-widget-content"><select  name="epscon" id="epscon" class="ui-widget-content ui-corner-all" >
                                <option value="">Seleccione Entidad </option>
                                <?php /*$sql="select * from entidad_salud";
                                        $query=mysql_query($sql);
                                        while($row=mysql_fetch_array($query)){
                                        ?>
                                        <option value="<?php echo $row['id_eps']?>" ><?php echo $row['eps']?></option>
                                        
                                        <?php
                                        }*/
                                ?></select>		 </td>
                            </tr>
                            
                            <tr>
                            <td >Fecha </td>
                                <td>Valor</td>
                                <td >Convenio</td>
                            </tr>
                            <tr>
                                <td><input type="text" id="fecha_partecon" name="fecha_partecon" size="10" class="ui-widget-content ui-corner-all"  /></td>
                                <td><input type="text" id="valorpartecon" name="valorpartecon" size="10" class="ui-widget-content ui-corner-all"  /></td>
                                <td><input type="text" id="nconvenio" name="nconvenio" size="10" class="ui-widget-content ui-corner-all"  /></td>
                            </tr>
                            </table>
                            </div>
                            
                            
                            <div id="conmulta" >
                            
                            <table >
                            <tr>
                                <td >Parte#</td>
                                <td >Infracci&oacute;n</td>
                                <td >Entidad </td>
                                <td >Fecha </td>
                                <td >Valor</td>
                            </tr>
                            <tr>
                                <td><input type="text" id="comparendo" name="comparendo" size="5" class="ui-widget-content ui-corner-all"  /></td>
                                <td><input type="text" id="infraccion" name="infraccion" size="7" class="ui-widget-content ui-corner-all"  /></td>
                                        <td class="ui-widget-content"><select  name="eps" id="eps" class="ui-widget-content ui-corner-all" >
                                <option value="">Seleccione Entidad </option>
                                <?php /*$sql="select * from entidad_salud";
                                        $query=mysql_query($sql);
                                        while($row=mysql_fetch_array($query)){
                                        ?>
                                        <option value="<?php echo $row['id_eps']?>" ><?php echo $row['eps']?></option>
                                        
                                        <?php
                                        }*/
                                ?></select>		 </td>

                                <td><input type="text" id="fecha_parte" name="fecha_parte" size="10" class="ui-widget-content ui-corner-all"  /></td>
                                <td><input type="text" id="valorparte" name="valorparte" size="10" class="ui-widget-content ui-corner-all"  /></td>
                            </tr>
                            </table>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="ui-jqgrid-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ">
                            <table  class="ui-corner-all">
                            <tr class="ui-jqgrid-titlebar ui-widget-header ui-corner-top  ">
                                <td ><div align="center">Observaciones </div></td>
                            </tr>
                            <tr>
                                <td class="ui-widget-content">
                                <div align="center">
                                    <textarea name="observacionesimit" id="observacionesimit" cols="60" rows="3"></textarea>
                                    </div></td>
                            </tr>
                            </table>
                            </td>
                        </tr>
                        <tr>
                            <td><table>
                            <tr id="Act_Buttons">
                                <td class="EditButton"><div align="center"><a class="fm-button ui-state-default ui-corner-all fm-button-icon-left" onclick="tipo_multa()">Guardar<span class="ui-icon ui-icon-disk"></span></a></div></td>
                                <td class="EditButton"><div align="center"><a class="fm-button ui-state-default ui-corner-all fm-button-icon-left" onclick="javascript:jQuery('#regsimit').dialog( 'close' );">Salir<span class="ui-icon ui-icon-close"></span></a></div></td>
                            </tr>
                            </table></td>
                        </tr>
                        </table>
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