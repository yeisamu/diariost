<?php
defined('BASEPATH') OR exit('No direct script access allowed');
  //print_r($iTotal);
header("Content-Type: text/html;charset=utf-8"); 
    if($proc){
            foreach ($proc->result() as $detalle) {
               //  echo $detalle->codigo
           ?>
          <tr>
            <td width="5%" style="text-align: center;border-left: 1px solid #f0f0f0;border-bottom: 1px solid #f0f0f0;">
               <i class="fa fa-pencil   hover_s  tooltip_vu abre_edit " style="cursor:pointer"
               data-placement="left" title="Modificar"  data-toggle="modal" data-target="#edit_doc"
               data-vars="<?php echo base_url() ?>sgc.php/sistemasgc/editardoc?id_maestro=<?php echo $detalle->id_maestro ?>"></i>&nbsp;
               <i class="fa fa-trash   hover_s  tooltip_vu abre_del " style="cursor:pointer"
               data-placement="left" title="Borrar"  data-toggle="modal" data-target="#borrar_doc"
               data-vars="<?php echo base_url() ?>sgc.php/sistemasgc/borrardoc?id_maestro=<?php echo $detalle->id_maestro ?>"></i>
               &nbsp;
               <i class="fa fa-file-text   hover_s  tooltip_vu abre_mod_global " style="cursor:pointer"
               data-placement="left" title="Historial"  data-toggle="modal" data-target="#modalhistory" data-capa='histo_modal'
               data-vars="<?php echo base_url() ?>sgc.php/sistemasgc/histodoc?id_maestro=<?php echo $detalle->id_maestro ?>"></i>

            </td>
            <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;"><?php echo $detalle->codigo ?> </td>
            <td  width="10%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->tipo_doc ?></td>
            <td  width="18%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->nombre ?></td>
            <td  width="8%" style="word-break: break-all;text-align: center;border: 1px solid #f0f0f0; "><?php echo $detalle->version ?></td>
            <td  width="8%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->f_edicion ?></td>
            <td  width="8%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->origen ?></td>
            <td  width="12%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->ubicacion ?></td>
            <td  width="9%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->medio ?></td>
            <!--td  width="10%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->elaboro ?></td>
            <td  width="8%" style="word-break: break-all;border: 1px solid #f0f0f0;"><?php echo $detalle->reviso ?></td>
            <td  width="8%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;"><?php echo $detalle->aprobo ?></td-->
            <td  width="10%" style="word-break: break-all;border-bottom: 1px solid #f0f0f0;"><?php echo $detalle->proceso ?></td>
            <td width="1%" style="text-align: center;border-right: 1px solid #f0f0f0;border-bottom: 1px solid #f0f0f0;">
               <!--i class="fa fa-pencil   hover_s  tooltip_vu abre_edit " style="cursor:pointer"
               data-placement="left" title="Modificar"  data-toggle="modal" data-target="#edit_doc"
               data-vars="<?php echo base_url() ?>sgc.php/sistemasgc/editardoc?id_maestro=<?php echo $detalle->id_maestro ?>"></i-->
            </td>
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
     sart.page  = '<?php echo $page; ?>';
     sart.pages = '<?php echo $pages; ?>';
     $('#cant_doc').html('(<?php echo $iTotal; ?>) Documentos');
  </script> 