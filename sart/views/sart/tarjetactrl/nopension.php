<?php 
if($condu){
  $dataprop = $condu->row();
  $nombre=$dataprop->nombres;
  $apellidos=$dataprop->apellidos;
  $id=$dataprop->codigo;
  $idcondu=$dataprop->id_conductor;
  $fecha_crea=$dataprop->fecha_crea;
  $formato=$form->row();
  
  $mes=array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");

  $dcrea=date('d',strtotime($fecha_crea));
  $mcrea=date('n',strtotime($fecha_crea));
  $acrea=date('Y',strtotime($fecha_crea));

  $dia=$dcrea;
  $mesact=$mes[$mcrea-1];
  $anioact=$acrea;
}
?>

<div style="text-align:justify;margin-top:55px">
<strong><?php echo strtoupper ($nombre." ".$apellidos);?></strong>, Con Cedula de Ciudadanía # <strong><?php echo $id;?></strong>, <?php echo $formato->texto;?>
</div>
<div style="text-align:justify;margin-top:60px">
<?php echo $formato->fila4." ".$dia." días del mes de ".$mesact." del año ".$anioact."."; ?>
</div>