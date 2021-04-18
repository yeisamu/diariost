<?php 
if($condu){
  $dataprop = $condu->row();
  $nombre=$dataprop->nombres;
  $apellidos=$dataprop->apellidos;
  $id=$dataprop->codigo;
  $idcondu=$dataprop->id_conductor;
  $direccion=$dataprop->direccion;
  $telefono=$dataprop->telefono;
  $acudiente=$dataprop->acudiente;
  $telefonoa=$dataprop->telefonoa;
  $ispensionado=$dataprop->ispensionado;
  $rh=$dataprop->tipo_rh;
  $emailc=$dataprop->emailc;
  $experiencia=$dataprop->experiencia_laboral;
  $obs=$dataprop->observacion;
  $foto=$dataprop->foto;
  $lnace=$dataprop->lugarNace;
  $fecha_crea=$dataprop->fecha_crea;

  $dnace=date('d',strtotime($dataprop->fecha_nace));
  $mnace=date('n',strtotime($dataprop->fecha_nace));
  $anace=date('Y',strtotime($dataprop->fecha_nace));

  $mes=array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
  $fnace=$dnace."-".$mes[$mnace-1]."-".$anace;
  $formato=$form->row();
  $licencia=$docs->row();

  $dcrea=date('d',strtotime($fecha_crea));
  $mcrea=date('n',strtotime($fecha_crea));
  $acrea=date('Y',strtotime($fecha_crea));

  $dia=$dcrea;
  $mesact=$mes[$mcrea-1];
  $anioact=$acrea;
}
?>
    <div class="content">
        <div class="row">
            <div class="col-md-12" style="text-align: center;margin-top:50px">
                <h3 style="font-size: 24px"><strong>ESTADISTICA DE CONDUCTORES</h3>
            </div><!--.col-md-12-->
            <div>
                <table style="font-size: 16px">
                    <tr>
                        <td width="80%">
                            <table>
                                <tr>
                                    <td>
                                        <span>NOMBRE COMPLETO:   </span>
                                        <span><u><?php echo strtoupper($nombre) ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>APELLIDOS:   </span>
                                        <span><u><?php echo strtoupper($apellidos) ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>CEDULA DE CIUDADANIA:   </span>
                                        <span><u><?php echo $id ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>LUGAR DE NACIMIENTO:   </span>
                                        <span><u><?php echo strtoupper($lnace) ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>FECHA DE NACIMIENTO:   </span>
                                        <span><u><?php echo $fnace ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>DIRECCION:   </span>
                                        <span><u><?php echo strtoupper($direccion) ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>TELEFONO:  <u><?php echo $telefono ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>E-MAIL:  <u><?php echo $emailc ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>CATEGORIA DE LA LICENCIA:   </span>
                                        <span><u><?php echo strtoupper($licencia->numero) ?></u></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>EXPEDIDA EN:   </span>
                                        <span><u><?php echo strtoupper($licencia->categoria) ?></u></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="20%">
                            <img src="<?php echo base_url() ?>/fotos/<?php echo $foto ?>" width="150px" height="200px"  style="width: 150px; height: 200px; margin: 0;"/>
                        </td>
                    </tr> 
                </table>
                
            </div><!--.col-md-12-->
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <span>TIEMPO QUE SE HA DESEMPEÑADO CONDUCIENDO VEHICULOS DE SERVICIO PÚBLICO:</span>
                <div><?php echo strtoupper($expe) ?></div>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p style="text-align: justify;"><?php echo $formato->texto; ?></p>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p style="text-align: justify;"><?php echo $obs; ?></p>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p style="text-align: justify;"><?php echo $formato->fila2; ?></p>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p style="text-align: justify;"><?php echo $formato->fila3; ?></p>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p style="text-align: justify;"><?php echo $formato->fila4." ".$dia." días del mes de ".$mesact." del año ".$anioact."."; ?></p>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p>Atentamente.</p>
            </div>
            <div class="col-md-12" style="margin-top:20px;font-size: 16px">
                <p>CONDUCTOR</p>
            </div>
        </div><!--.row--> 
    </div><!--.body modal--> 