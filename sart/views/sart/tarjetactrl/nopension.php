<?php 
if($condu){
  $dataprop = $condu->row();
  $nombre=$dataprop->nombres;
  $apellidos=$dataprop->apellidos;
  $id=$dataprop->codigo;
  $idcondu=$dataprop->id_conductor;

  $formato=$form->row();
}
?>

<div style="text-align:justify;margin-top:55px">
<strong><?php echo strtoupper ($nombre." ".$apellidos);?></strong>, Con Cedula de Ciudadanía # <strong><?php echo $id;?></strong>, <?php echo $formato->texto;?>
</div>