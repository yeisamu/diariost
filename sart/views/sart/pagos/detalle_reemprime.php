<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Content-Type: text/html;charset=utf-8"); 
if($permisos){
  $dataper=$permisos->row();
  $leer=$dataper->leer;
  $borrar=$dataper->borrar;
  $editar=$dataper->editar;
  $crear=$dataper->crear;
}

    if($recibo){
            foreach ($recibo->result() as $detalle) {
               //  echo $detalle->codigo
              if($tabla=='diarios'){
                $desc=$detalle->descuento;
              }else{
                $desc=0;
              }
           ?>
          <tr>
            <td width="10%" style="text-align: center;border-left: 1px solid #f0f0f0;border-bottom: 1px solid #f0f0f0;">
               <i class="fa fa-print   hover_sx  tooltip_vu reprint " style="cursor:pointer"
                  data-placement="right" title="Imprimir"  data-toggle="tooltip" data-idmovil="<?php echo $detalle->id_movil ?>"
                  data-nrecibo="<?php echo $detalle->id ?>" data-tipor='<?php echo $tabla ?>' data-tabla="<?php echo $tabla ?>"></i>&nbsp;
              <?php if($borrar=='si'){
              ?>
               <i class="fa fa-trash   hover_sx  tooltip_vu call_modal  " style="cursor:pointer"
               data-placement="right" title="Borrar" data-toggle="modal" data-target="#modalanula" data-modal='#anula_modal'
               data-vars="<?php echo base_url() ?>sart.php/sistemasart/detaanularec?id=<?php echo $detalle->id ?>&tabla=<?php echo $tabla ?>"></i>
              <?php } ?>
            </td>
            <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;"><?php echo $detalle->id ?> </td>
            <td  width="20%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->id_movil ?></td>
            <td  width="20%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->placa ?></td>
            <td  width="20%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->fecha ?></td>
            <td  width="20%" style="word-break: break-all;text-align: center;border: 1px solid #f0f0f0; "><?php echo $detalle->total-$desc ?></td>
          </tr>
          <?php
            }
    }else{
      $page=0;
      $pages=0;
      $iTotal=0;
     ?>
        <tr>
            <td colspan="10"  style=""> No hay resultados para la busqueda</td>
            </td>
        </tr>    
     <?php
    }           
    ?>

  <script type="text/javascript">
     sgcapp.page  = '<?php echo $page; ?>';
     sgcapp.pages = '<?php echo $pages; ?>';
    // $('#cant_doc').html('(<?php echo $iTotal; ?>) Documentos');
  </script> 