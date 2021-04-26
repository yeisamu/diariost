<?php 
$numlic='';
$cat='';
$vencelic='';
$firmauser='';

 if($user){
	$datauser = $user->row();
     $firmauser=$datauser->firma;
   }
 if($tarjeta){

  $datatarjeta = $tarjeta->row();

 }

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>S.A.R.T</title>

	<meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

	<!-- BEGIN CORE CSS -->
	<link rel="stylesheet" href="<?php echo base_url() ?>css/admin1.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>css/elements.css">
	<!-- END CORE CSS -->

	<!-- BEGIN PLUGINS CSS -->
	<link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-table/dist/bootstrap-table.min.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>plugins/scroll/css/perfect-scrollbar.css">
	<link rel="stylesheet" href="<?php echo base_url() ?>css/plugins.css">
	<!-- END PLUGINS CSS -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/chosen/chosen.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/selectize/dist/css/selectize.bootstrap3.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/multiselect/css/multi-select.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/pnikolov-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/minicolors/jquery.minicolors.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/datepicker/css/datepicker.css">

	<style type="text/css">
		.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
		    border: none !important;
		    font-size: 14px;
		    padding: 10px;
		}
		.altofil {
			height: 60px;
		}
		body{
			font-size: 15px;
		}
		.table-bordered{
    		border: none !important;
		}
	</style>
 </head>
<body>
<div style="float: left; width: 48%;">
       
</div>

   <div style="float: right; width: 48%">
   	<table class="table table-bordered"  style="font-size: 22px;">
	   <tr>
			<td width="30%"  style="height:1mm;padding:10mm 0 0 5mm;border: 0px none black;color:#FFF">&nbsp;fecha ref</td>
			
			<td width="30%" style="height:1mm;padding:10mm 0 0 5mm;border: 0px none black;color:#FFF">&nbsp;AÑO</td>
			<td width="40%" style="height:1mm;padding:10mm 0 0 5mm;border: 0px none black;color:#FFF">&nbsp;FIRMA </td>
		</tr>
		<?php 
		$altof=8;
		if($datatarjeta->planilla>10){
			$altof=12.5;
		}
		if($datatarjeta->planilla >8 || $datatarjeta->planilla <= 10  ){
			$altof=12;
		}
		for($i=0;$i<13;$i++){ 
			if(($i+1)==$datatarjeta->planilla){
				$fecharef=date('d-m-Y',strtotime($datatarjeta->fecha_elab));
				$fechavig=date('d-m-Y',strtotime($datatarjeta->fecha_vigencia));
				?>
				<tr>
					<td class="altofil" style="height:8mm;padding:3mm 0 5mm 2mm;border: 0px none black;width:30mm" ><?php echo $fecharef;?></td>
					<td class="altofil" style="height:8mm;padding:3mm 0 5mm 2mm;border: 0px none black;width:30mm" ><?php echo $fechavig;?></td>
					<td class="altofil" style="height:8mm;padding:3mm 0 5mm 2mm;border: 0px none black;width:40mm">
					<?php if($firmauser!=''){ ?>	
						<img src="uploads/firmas/<?php echo $firmauser;?>" width="100px" height="8mm">
					<?php } ?>
					</td>
				</tr>
				<?php }else{ ?>
				    <tr>
						<td class="altofil" style="height:<?php echo $altof; ?>mm;padding:3mm 0 0 5mm;border: 0px none black" >&nbsp;</td>
						<td class="altofil" style="height:<?php echo $altof; ?>mm;padding:3mm 0 0 5mm;border: 0px none black" >&nbsp;</td>
						<td class="altofil" style="height:<?php echo $altof; ?>mm;padding:3mm 0 0 5mm;border: 0px none black">&nbsp;</td>
    			    </tr>
				<?php } ?>
		<?php } ?>	
	</table>  
    </div>

</body>
</html>