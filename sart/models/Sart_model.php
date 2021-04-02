<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('America/Bogota');
class Sart_model extends CI_Model {

	function __construct(){
		$this->load->database(); // Carga el manejador de bases de datos
		
	}
    function countpro($where)
  {
    $this->db->select("count(*) as total");
   // $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
  //  $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
     
    if (isset($_REQUEST['search']) && $_REQUEST['search'] != '') {
       $search=$_REQUEST['search'];
       if($where!=''){
        $uno=" ";
       }else{
        $uno="1 ";
       }
          $where .= "$uno and (
                            propietario.id_prop like '%$search%' or
                            nombre like '%$search%' or
                            apellidos like '%$search%' or
                            concat_ws(' ',nombre,apellidos) like '%$search%' or
                            concat_ws(' ',apellidos,nombre) like '%$search%'
                                )";
   }
   if($where!=''){
      $this->db->where($where);
    }
    $query = $this->db->get('propietario');
      if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }  
  }

  function countmaestro($where)
  {
    $this->db->select("count(*) as total");
    $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
    $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
     
    if (isset($_REQUEST['search']) && $_REQUEST['search'] != '') {
       $search=$_REQUEST['search'];
       if($where!=''){
        $uno=" ";
       }else{
        $uno="1 ";
       }
          $where .= "$uno and (
                            id_movil like '%$search%' or
                            placa like '%$search%' or
                            modelo like '%$search%' or
                            clase like '%$search%' or
                            marca like '%$search%' or
                            grupo like '%$search%' or
                            propietario.id_prop like '%$search%' or
                            nombre like '%$search%' or
                            apellidos like '%$search%' or
                            concat_ws(' ',nombre,apellidos) like '%$search%' or
                            concat_ws(' ',apellidos,nombre) like '%$search%'
                                )";
   }
   if($where!=''){
      $this->db->where($where);
    }
    $query = $this->db->get('vehiculo');
      if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }  
  }
    function countrecibo($tabla,$filter,$campoid)
  {
    $where="$tabla.estado <> 'anulado'";
       if (is_array($filter)) {
           if(count($filter) > 0){
               foreach ($filter as $key => $value) {
                   $where .= " and $key = '$value'";
               }
           }
       }
       if (isset($_REQUEST['search'])  && $_REQUEST['search'] != '') {
          $search=$_REQUEST['search'];
          if($where!=''){
           $uno="";
          }else{
           $uno="1 ";
          }
             $where .= "and $campoid like '%$search%'";
      }

    $this->db->select("count(*) as total");
    $this->db->join('vehiculo', 'vehiculo.id_movil = '.$tabla.'.id_movil', 'left');
    if($where!=''){
     //$where.$where2;
     $this->db->where($where);
   }
   // $this->db->where($where); 
    $query = $this->db->get($tabla);
      if($query->num_rows() > 0){   
          return $query;
       }else{
            return false;
       }  
  }

    function getallprop($ini,$fin,$order,$where)
    {
      //$this->db->select(array("*, DATEDIFF(now(),pago_hasta) as mora"));
     // $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
     // $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
     
      if (isset($_REQUEST['search'])  && $_REQUEST['search'] != '') {
         $search=$_REQUEST['search'];
         if($where!=''){
          $uno=" ";
         }else{
          $uno="1 ";
         }
            $where .= "$uno  and (
                              propietario.id_prop like '%$search%' or
                              nombre like '%$search%' or
                              apellidos like '%$search%' or
                              concat_ws(' ',nombre,apellidos) like '%$search%' or
                              concat_ws(' ',apellidos,nombre) like '%$search%'
                                  )";
     }
     if($where!=''){
       //$where.$where2;
       $this->db->where($where);
     }
      //$this->db->where('estado', 'activo'); 
      $this->db->limit($fin,$ini);
      $this->db->order_by($order); 
      $query = $this->db->get('propietario');

          if($query->num_rows() > 0){
               
            return $query;
         }else{

              return false;
         }
         
    }
	function getallmaestro($ini,$fin,$order,$where)
	{
    $this->db->select(array("*, DATEDIFF(now(),pago_hasta) as mora"));
    $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
    $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
   
    if (isset($_REQUEST['search'])  && $_REQUEST['search'] != '') {
       $search=$_REQUEST['search'];
       if($where!=''){
        $uno=" ";
       }else{
        $uno="1 ";
       }
          $where .= "$uno  and (
                            id_movil like '%$search%' or
                            placa like '%$search%' or
                            modelo like '%$search%' or
                            clase like '%$search%' or
                            marca like '%$search%' or
                            grupo like '%$search%' or
                            propietario.id_prop like '%$search%' or
                            nombre like '%$search%' or
                            apellidos like '%$search%' or
                            concat_ws(' ',nombre,apellidos) like '%$search%' or
                            concat_ws(' ',apellidos,nombre) like '%$search%'
                                )";
   }
   if($where!=''){
     //$where.$where2;
     $this->db->where($where);
   }
    //$this->db->where('estado', 'activo'); 
    $this->db->limit($fin,$ini);
    $this->db->order_by($order); 
		$query = $this->db->get('vehiculo');

        if($query->num_rows() > 0){
             
        	return $query;
       }else{

       	    return false;
       }
       
	}
    function getreecibo($ini,$fin,$order,$campoid,$campot,$tabla,$filter)
    {
      if($tabla=='diarios'){
        $this->db->select($campoid." as id,vehiculo.id_movil,placa,fecha_pago as fecha,".$campot." as total,descuento");
      }else{
        $this->db->select($campoid." as id,vehiculo.id_movil,placa,fecha_pago as fecha,".$campot." as total");
      }
      
      $this->db->join('vehiculo', 'vehiculo.id_movil = '.$tabla.'.id_movil', 'left');
      $where=" $tabla.estado <> 'anulado'";
         if (is_array($filter)) {
             if(count($filter) > 0){
                 foreach ($filter as $key => $value) {
                     $where .= " and $key = '$value'";
                 }
             }
         }

      if (isset($_REQUEST['search'])  && $_REQUEST['search'] != '') {
         $search=$_REQUEST['search'];
         if($where!=''){
          $uno=" ";
         }else{
          $uno=" ";
         }
            $where .= "and $campoid like '%$search%' or ".$tabla.".id_movil like '%$search%' ";
     }
     if($where!=''){
       //$where.$where2;
       $this->db->where($where);
     }
      //$this->db->where('estado', 'activo'); 
      $this->db->limit($fin,$ini);
      $this->db->order_by($order); 
      $query = $this->db->get($tabla);

          if($query->num_rows() > 0){
               
            return $query;
         }else{

              return false;
         }
         
    }
  function getfilter($filter)
  {
    $this->db->select(array("*, DATEDIFF(now(),pago_hasta) as mora"));
    $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
    $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
    $where="";
        if (is_array($filter)) {
            if(count($filter) > 0){
                foreach ($filter as $key => $value) {
                    $where .= " and $key = '$value'";
                }
            }
        }
    if($where!=''){
      $this->db->where(' 1 '.$where);
    }
    
    $query = $this->db->get('vehiculo');

        if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }
       
  }
  function getfilterdocs($filter,$filter_adv)
  {
    $this->db->select(array("*, DATEDIFF(now(),pago_hasta) as mora"));
    $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
    $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
    $this->db->join('veh_doc', 'veh_doc.id_movil = vehiculo.id_movil', 'left');
    $where="";
        if (is_array($filter)) {
            if(count($filter) > 0){
                foreach ($filter as $key => $value) {
                    $where .= " and $key = '$value'";
                }
            }
        }
        if (is_array($filter_adv)) {
            if(count($filter_adv) > 0){
                foreach ($filter_adv as $key => $value) {
                    $where .= " and $value ";
                }
            }
        }
    if($where!=''){
      $this->db->where(' 1 '.$where);
    }
    $this->db->group_by("vehiculo.id_movil"); 
    $query = $this->db->get('vehiculo');

        if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }
       
  }
  function getfiltermov($filter_adv,$filter)
  {
    $this->db->select(array("*, DATEDIFF(now(),pago_hasta) as mora,vehiculo.id_movil as id_movil"));
    $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
    $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
    $this->db->join('movimiento_diarios', 'movimiento_diarios.id_movil = vehiculo.id_movil', 'left');
    $where="";
        if (is_array($filter)) {
            if(count($filter) > 0){
                foreach ($filter as $key => $value) {
                    $where .= " and $key = '$value'";
                }
            }
        }
        if (is_array($filter_adv)) {
            if(count($filter_adv) > 0){
                foreach ($filter_adv as $key => $value) {
                    $where .= " and $value ";
                }
            }
        }
    if($where!=''){
      $this->db->where(' 1 '.$where);
    }
    $this->db->group_by("vehiculo.id_movil"); 
    $query = $this->db->get('vehiculo');

        if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }
       
  }

  function datosvehi($filter,$filter_adv,$fin)
  {
    if($fin!=''){
      $this->db->select(array("*,documentos_v.`id_documento`,datediff(fecha_ven,'$fin') as diff"),false);
    }else{
      $this->db->select(array("*,documentos_v.`id_documento`,datediff(fecha_ven,now()) as diff"));
    }
    
    $this->db->join('documentos_v ', 'documentos_v.id_documento=veh_doc.id_documento', 'left');
    $where="1";
        if (is_array($filter)) {
            if(count($filter) > 0){
                foreach ($filter as $key => $value) {
                    $where .= " and $key = '$value'";
                }
            }
        }
        if (is_array($filter_adv)) {
            if(count($filter_adv) > 0){
                foreach ($filter_adv as $key => $value) {
                    $where .= " and $value ";
                }
            }
        }
    $this->db->where($where);
	
    $query = $this->db->get('veh_doc');
        if($query->num_rows() > 0){
          return $query;
       }else{

            return false;
       }
       
  }

  function getallsol($ini,$fin)
  {
    $this->db->join('procesos', 'procesos.id_proceso = detalle_cambio.id_proceso', 'left');
    $this->db->where('revisado', 'no'); 
    $this->db->limit($fin,$ini);
    $this->db->order_by("fecha_solicita", "desc"); 
    $query = $this->db->get('detalle_cambio');

        if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }
       
  }
 

 function getsolicitud()
  {
    //$this->db->join('procesos', 'procesos.id_proceso = maestro.id_proceso', 'left');
    $this->db->where('revisado', 'no'); 
    //$this->db->limit($fin,$ini);
    //$this->db->order_by("proceso", "asc"); 
    $query = $this->db->get('detalle_cambio');

        if($query->num_rows() > 0){
             
          return $query->num_rows();
       }else{

            return 0;
       }
       
  }


  function getproceso()
  {
    $query = $this->db->get('procesos');

        if($query->num_rows() > 0){
             
          return $query;
       }else{

            return false;
       }
       
  }

  function getcampo($campo,$tabla)
  {
    $this->db->distinct();
    $this->db->select($campo);
    $this->db->order_by($campo, "asc"); 
    $query = $this->db->get($tabla);
 
      if($query->num_rows() > 0){  
          return $query;
       }else{
          return false;
       } 
  }

  function selectall($campo,$tabla)
  {
   // $this->db->distinct();
  //  $this->db->select($campo);
    $this->db->order_by($campo, "asc"); 
    $query = $this->db->get($tabla);
 
      if($query->num_rows() > 0){  
          return $query;
       }else{
          return false;
       } 
  }



	function getmaestro($id)
	{
		$this->db->where('id_maestro', $id); //clausula where id_maestro = $id entregado como argumento a la funcion  
		$query = $this->db->get('maestro');
      if($query->num_rows() > 0){      
        	return $query;
       }else{
       	    return false;
       }  
	}

  function getdatos($filter,$tabla,$campos)
  {
    
    if($campos!=''){
      $this->db->select(array($campos));
    }
     $where="1";
    if (is_array($filter)|| $filter!='') {
        if(count($filter) > 0){
            foreach ($filter as $key => $value) {
                $where .= " and $key = '$value'";
            }
        }
    }
    if($where!="1"){
      $this->db->where($where);
    }
    $query = $this->db->get($tabla);
      if($query->num_rows() > 0){      
          return $query;
       }else{
            return false;
       }  
  }

  function listar($filter,$filter_adv,$tabla,$campos,$orderby)
  {
    $where='';
    if($campos!=''){
      $this->db->select(array($campos));
    }
    
        if (is_array($filter)|| $filter!='') {

            if(count($filter) > 0){
                foreach ($filter as $key => $value) {
                    $where .= " and $key = '$value'";
                }
            }
        }
        if (is_array($filter_adv)) {
            if(count($filter_adv) > 0){
                foreach ($filter_adv as $key => $value) {
                    $where .= " and $value ";
                }
            }
        }
    if($orderby!=''){
      $this->db->order_by($orderby); 
    }
    if($where!=''){
      $wheres='1';
     $this->db->where($wheres.$where);
    }
    $query = $this->db->get($tabla);
      if($query->num_rows() > 0){      
          return $query;
       }else{
            return false;
       }  
  }
  function getdatosjoinfull($filter,$filter_adv,$tabla,$tabla2,$join,$dir,$campos,$orderby)
  {
     $where='';
     if($campos!=''){
       $this->db->select(array($campos),false);
     }
     
         if (is_array($filter)|| $filter!='') {

             if(count($filter) > 0){
                 foreach ($filter as $key => $value) {
                     $where .= " and $key = '$value'";
                 }
             }
         }
         if (is_array($filter_adv)) {
             if(count($filter_adv) > 0){
                 foreach ($filter_adv as $key => $value) {
                     $where .= " and $value ";
                 }
             }
         }
     if($orderby!=''){
       $this->db->order_by($orderby); 
     }
     if($where!=''){
       $wheres='1';
      $this->db->where($wheres.$where);
     }
    $this->db->join($tabla2,$join,$dir);
    $query = $this->db->get($tabla);
      if($query->num_rows() > 0){      
          return $query;
       }else{
            return false;
       }  
  }
  function buslike($elem,$tabla)
  {
  	 $query  =   "SET @serial := 0";
     $this->db->query($query);
     $this->db->select(array("trim(id_prop) as id_prop,concat_ws(' ',trim(id_prop),trim(nombre),trim(apellidos)) as nombre, @serial := @serial+1 AS `nfila`"));
          $where = "1 and (
                        propietario.id_prop like '%$elem%' or
                        nombre like '%$elem%' or
                        apellidos like '%$elem%' or
                        concat_ws(' ',nombre,apellidos) like '%$elem%' or
                        concat_ws(' ',apellidos,nombre) like '%$elem%'
                            )";
    $this->db->where($where);
    $this->db->limit(10,0);
    return  $query = $this->db->get($tabla)->result();
  }

  function getdatosjoin($filter,$tabla,$tabla2,$join,$dir)
  {
     $where="1";
        if (is_array($filter)) {
            if(count($filter) > 0){
                foreach ($filter as $key => $value) {
                    $where .= " and $key = '$value'";
                }
            }
        }

    
    $this->db->join($tabla2,$join,$dir);
    $this->db->where($where);
    $query = $this->db->get($tabla);
      if($query->num_rows() > 0){      
          return $query;
       }else{
            return false;
       }  
  }
  
	function putmaestro($data)
	{
      $this->db->insert('maestro',$data);

	}

	function deletenotif($id)
	{
      $this->db->delete('novedad_diario',array('id_nov'=>$id)); //comando para borrar el registro con el id correspondiente
      $nr = $this->db->affected_rows();
      if ($nr > 0){  //Para saber si el borrado fue exitoso.
           return true;
       }else{
      	return false;
      }

	}

	function updatemaestro($data)
	{
     $this->db->where('maestro_id', $data['maestro_id']);  //localiza la maestro a actualizar
     $this->db->update('maestro', $data); //realiza la actualizacion 
     if ($this->db->affected_rows() > 0){  //Para saber si la actualizaci162n fue exitoso.
           return TRUE; // retorna verdadero si fue exitosa
       }else{
      	return FALSE; //retorna falso si no se realizo
      }

	}


function busqueda()
  {
      $search =$_REQUEST['search'];
      $this->db->select(array("*, DATEDIFF(now(),pago_hasta) as mora"));
      $this->db->join('marca', 'marca.id_marca = vehiculo.id_marca', 'left');
      $this->db->join('propietario', 'propietario.id_prop = vehiculo.id_prop', 'left');
	    $where = "1 and (
                        id_movil like '%$search%' or
                        placa like '%$search%' or
                        modelo like '%$search%' or
                        clase like '%$search%' or
                        marca like '%$search%' or
                        grupo like '%$search%' or
                        propietario.id_prop like '%$search%' or
                        nombre like '%$search%' or
                        apellidos like '%$search%' or
                        concat_ws(' ',nombre,apellidos) like '%$search%' or
                        concat_ws(' ',apellidos,nombre) like '%$search%'
                            )";
      if(isset($_REQUEST['grupo'])){
        $valfg=$_REQUEST['grupo'];
        if($valfg!=''){
          $where.=" and grupo='".$valfg."'";
        }
      }
    $order=$_REQUEST['order'];
    $by=$_REQUEST['by'];
    $orderby="$order $by ";
    $this->db->order_by($orderby); 
	  $this->db->where($where); 
  /*    $this->db->like('nombre',$search); 
      $this->db->like('proceso',$search); 
      $this->db->like('codigo',$search); */
      $query = $this->db->get('vehiculo');
       if($query->num_rows() > 0){   
          return $query;
       }else{
            return false;
       }
  }

  function busquedasol()
  {
        $search =$_REQUEST['search'];
        $this->db->join('procesos', 'procesos.id_proceso = detalle_cambio.id_proceso', 'left');
        $this->db->where('revisado', 'no');
        $this->db->like('nombre',$search); 
        $this->db->like('codigo',$search); 
        $this->db->like('detalle_cambio',$search); 
        $this->db->like('solicita',$search); 
         
        $this->db->order_by("fecha_solicita", "desc"); 
        $query = $this->db->get('detalle_cambio');

       if($query->num_rows() > 0){   
          return $query;
       }else{
            return false;
       }
  }

  function filtro()
  {
      $campo =$_REQUEST['campo'];
      $valor =$_REQUEST['valor'];
      $this->db->join('procesos', 'procesos.id_proceso = maestro.id_proceso', 'left');
      $this->db->join('tipo_doc', 'tipo_doc.id_tipo_doc = maestro.id_tipo_doc', 'left');
      $this->db->where($campo,$valor);
      $this->db->where('estado', 'activo'); 
      $query = $this->db->get('maestro');
       if($query->num_rows() > 0){
          return $query;
       }else{
            return false;
       }
  }

    function filtrosol()
  {
      $campo =$_REQUEST['campo'];
      $valor =$_REQUEST['valor'];
      $this->db->join('procesos', 'procesos.id_proceso = detalle_cambio.id_proceso', 'left');
      $this->db->where($campo,$valor);
      $this->db->where('revisado', 'no'); 
      $query = $this->db->get('detalle_cambio');
       if($query->num_rows() > 0){
          return $query;
       }else{
            return false;
       }
  }
    function inserta_nvo()
  {
     
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        // $ndoc=$_REQUEST['ndoc'];
        // $detallen=$_REQUEST['detallen'];
        // $solicita=$_REQUEST['solicita'];
        // $id_proc=$_REQUEST['id_proc'];
        $hoy=date('Y-m-d');
        $data2 =array(
          'nombre'			=>$ndoc,
          'detalle_cambio'	=>$detallen,
          'solicita'		=>$solicita,
          'fecha_solicita'	=>$hoy,
          'id_proceso'		=>$id_proc,
          'tipo_solicitud'	=>'nuevo',
          'revisado'		=>'no'
        );
      $this->db->insert('detalle_cambio',$data2);
  }
    function edita_doc()
  {
        $ndoc=$_REQUEST['ndocedit'];
        $detallen=$_REQUEST['detallenedit'];
        $solicita=$_REQUEST['solicitaedit'];
        $id=$_REQUEST['id'];
        $codigo=$_REQUEST['codigoedit'];
        $id_proc=$_REQUEST['id_proc'];
        $nombreant=$_REQUEST['nombreant'];
        $hoy=date('Y-m-d');
        if($ndoc==""){
        	$ndoc=$nombreant;
        }
        $data2 =array(
          'nombre'			=>$ndoc,
          'detalle_cambio'	=>$detallen,
          'solicita'		=>$solicita,
          'id_maestro'		=>$id,
          'id_proceso'		=>$id_proc,
          'codigo'			=>$codigo,
          'fecha_solicita'	=>$hoy,
          'tipo_solicitud'	=>'editar',
          'revisado'		=>'no'
        );
        $this->db->insert('detalle_cambio',$data2);
  }
    function borrar_doc()
  {
        $ndoc=$_REQUEST['ndocdel'];
        $detallen=$_REQUEST['detalledel'];
        $solicita=$_REQUEST['solicitadel'];
        $id=$_REQUEST['iddel'];
        $codigo=$_REQUEST['codigodel'];
        $id_proc=$_REQUEST['id_proc'];
        $hoy=date('Y-m-d');
        $data2 =array(
          'nombre'			=>$ndoc,
          'detalle_cambio'	=>$detallen,
          'solicita'		=>$solicita,
          'id_maestro'		=>$id,
          'codigo'			=>$codigo,
          'id_proceso'		=>$id_proc,
          'fecha_solicita'	=>$hoy,
          'tipo_solicitud'	=>'borrar',
          'revisado'		=>'no'
        );
        $this->db->insert('detalle_cambio',$data2);
  }
    function inserta_prop()
  {
       date_default_timezone_set('America/Bogota');
     
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

        $hoy=date('Y-m-d');
        $fexp=date('Y-m-d',strtotime($fexpdoc));
        $fnace=date('Y-m-d',strtotime($fechaing));
        $yaexiste=false;
        $this->db->trans_begin();
        if($tipo=='nuevo'){
        	$this->db->where('id_prop',$idp); 
            $query = $this->db->get('propietario');
            if($query->num_rows() > 0){
            	 $datam = $query->row();
		         $codigom=$datam->id_prop;
    					if($idp==trim($codigom)){
    						$yaexiste=true;
    					}
            }
           
        	
        }
      if(!$yaexiste){  
	      switch ($tipo) {
	         case 'nuevo':

			                $data2 =array(
                            'id_prop'       => $idp,
                            'nombre'        => $nombreprop,
                            'apellidos'     => $apellprop,
                            'telefono'      => $telprop,
                            'email'         => $emailprop,
                            'direccion'     => $dirprop,
                            'ciudad_nac'    => $cityprop,                            
                            'ciudad'         => $cityprop,
                            'estado_prop'   => $estado_prop,
                            'fecha_nac'     => $fnace,
                            'escondu'       => $escondu,
                            'fecha_exp'     => $fexp
                   ); 

           $queries=$this->db->insert('propietario',$data2);

           if($escondu=='si'){
              $data =array(
                            'codigo'       => $idp,
                            'nombres'        => $nombreprop,
                            'apellidos'     => $apellprop,
                            'telefono'      => $telprop,
                            'direccion'     => $dirprop,
                            'fecha_nace'     => $fnace,
                            'est_civil'       => '',
                            'tipo_rh'     => ''
                   ); 

            $queries=$this->db->insert('conductor',$data);
            $dicon=$this->db->insert_id();

            $sqlondoc=$this->db->get('documento');
            if($sqlondoc->num_rows() > 0){  
              foreach($sqlondoc->result() as $valdocs){
                $fexp='0000-00-00';
                $fven=$hoy;
                $valuedocs = array('id_doc'     => $valdocs->id_doc,
                                    'id_conductor' => $dicon,
                                    'fecha_ant'    => $fexp,
                                    'fecha_vence'  => $fven,
                                    'categoria'    =>'',
                                    'numero'       => '');
                  $this->db->insert('con_doc',$valuedocs);
              }
            }
           }
			  break;
	     	  case 'edit':

			        	   $data2 =array(
                            'nombre'        => $nombreprop,
                            'apellidos'     => $apellprop,
                            'telefono'      => $telprop,
                            'email'         => $emailprop,
                            'direccion'     => $dirprop,
                            'ciudad_nac'    => $cityprop,
                            'estado_prop'   => $estado_prop,
                            'ciudad'         => $cityprop,

                            'fecha_nac'     => $fnace,
                            'escondu'       => $escondu,
                            'fecha_exp'     => $fexp
			        	   ); 

			     $this->db->where('id_prop', $idp);  //localiza la maestro a actualizar
			     $queries=$this->db->update('propietario',$data2);

           if($escondu=='si'){
              $data =array(
                            'codigo'       => $idp,
                            'nombres'        => $nombreprop,
                            'apellidos'     => $apellprop,
                            'telefono'      => $telprop,
                            'direccion'     => $dirprop,
                            'fecha_nace'     => $fnace,
                            'est_civil'       => '',
                            'tipo_rh'     => ''
                   ); 

              $queries=$this->db->insert('conductor',$data);
              $dicon=$this->db->insert_id();
              $sqlondoc=$this->db->get('documento');
              if($sqlondoc->num_rows() > 0){  
                foreach($sqlondoc->result() as $valdocs){
                  $fexp='0000-00-00';
                  $fven=$hoy;
                  $valuedocs = array('id_doc'     => $valdocs->id_doc,
                                      'id_conductor' => $dicon,
                                      'fecha_ant'    => $fexp,
                                      'fecha_vence'  => $fven,
                                      'categoria'    =>'',
                                      'numero'       => '');
                    $this->db->insert('con_doc',$valuedocs);
                }
              }
           }else{
            $this->db->where('codigo',$idp);
            $datacon=$this->db->get('conductor')->row();
            $this->db->delete('conductor',array('id_conductor'=>$datacon->id_conductor)); 
            $this->db->delete('con_doc',array('id_conductor'=>$datacon->id_conductor)); 
           }
	    	  break;
	   }
	   
//$this->db->affected_rows()>0

      if ($this->db->trans_status() === FALSE)
      {
          $this->db->trans_rollback();
          return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
      }
      else
      {
          $this->db->trans_commit();
          return $resp=array('guarda'=>'ok');
      }

     /*if($queries){
     	return $resp=array('guarda'=>'ok');
     }else{
     	return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
     }*/
     
   }else{
   	 return $resp=array('guarda'=>'error','motivo'=>'found','idprop'=>$idp);
   }  

  }

///aqui se modifico
      function inserta_mov()
    {
         date_default_timezone_set('America/Bogota');
       
          foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

          $hoy=date('Y-m-d');
          $yaexiste=false;
          if($tipo=='nuevo'){
            $this->db->where('id_movil',$idmovil); 
              $query = $this->db->get('vehiculo');
              if($query->num_rows() > 0){
                 $datam = $query->row();
                 $codigom=$datam->id_movil;
                if($idmovil==trim($codigom)){
                  $yaexiste=true;
                }
              }
             
            
          }
        $fechaing=date('Y-m-d',strtotime($fechaing));
        $fcontrato=date('Y-m-d',strtotime($fechacont));
        if(!$yaexiste){  
          switch ($tipo) {

             case 'nuevo':
             $this->db->trans_begin();
                  $data2 =array(
                          'id_movil'      => $idmovil,
                          'placa'         => $placa,
                          'modelo'        => $modelo,
                          'grupo'         => $grupo,
                          'id_marca'      => $impmarca,
                          'clase'         => $clase,
                          'referencia'    => $linea,
                          'tipo'          => $tipoc,
                          'combustible'   => $gas,
                          'motor'         => $motor,
                          'serie'         => $chasis,
                          'pago_hasta'    => $fechaing,
                          'dtaller'       => 0,
                          'color'         => '',                                   
                                   'poliza'         => 0,
                                   'dtaller'         => 0,
                          'radio'         => '',
                          'id_prop'       => $id_propietario,
                          'estado'        => $estadomovil,
                          'managerid'     => $id_adm,
                          'cilindraje'     => $cilindra,
                          'fcontrato'     => $fcontrato); 

            $queries=$this->db->insert('vehiculo',$data2);
                  if ( !empty($idoc) && is_array($idoc) ) { 
                     for ( $i=0;$i<4;$i++) { 
                        $fexp='0000-00-00';
                        $fven='0000-00-00';
                      switch ($i) {
                        case 0:
                         if(!empty($fexp0)){
                           $fexp=date('Y-m-d',strtotime($fexp0));
                         }
                         if(!empty($fven0)){
                           
                           $fven=date('Y-m-d',strtotime($fven0));
                         }
                          break;
                        case 1:
                         if(!empty($fexp1)){
                           $fexp=date('Y-m-d',strtotime($fexp1));
                         }
                          if(!empty($fven1)){
                           $fven=date('Y-m-d',strtotime($fven1));
                         }
                          break;
                        case 2:
                         if(!empty($fexp2)){
                           $fexp=date('Y-m-d',strtotime($fexp2));
                         }
                          if(!empty($fven2)){
                           $fven=date('Y-m-d',strtotime($fven2));
                         }
                          break;
                        case 3:
                         if(!empty($fexp3)){
                           $fven=date('Y-m-d',strtotime($fven3));
                         }
                          if(!empty($fven3)){
                           $fven=date('Y-m-d',strtotime($fven3));
                         }
                          break;
                        case 4:
                         if(!empty($fexp4)){
                           $fexp=date('Y-m-d',strtotime($fexp4));
                         }
                         if(!empty($fven4)){
                           $fven=date('Y-m-d',strtotime($fven4));
                         }
                          break;

                      }

                      
                      $valuedocs = array('id_movil'      => $idmovil,
                                       'id_documento'    => $idoc[$i],
                                       'fecha_exp'       => $fexp,
                                       'fecha_ven'       => $fven,
                                       'numero'          => $numerodoc[$i]);
                      $this->db->insert('veh_doc',$valuedocs);
                     }
                  }
                  if ($this->db->trans_status() === FALSE)
                  {
                      $this->db->trans_rollback();
                  }
                  else
                  {
                      $this->db->trans_commit();
                  }
          break;
            case 'edit':

                          $data2 =array(
                                  'placa'         => $placa,
                                  'modelo'        => $modelo,
                                  'grupo'         => $grupo,
                                  'id_marca'      => $impmarca,
                                  'clase'         => $clase,
                                  'referencia'    => $linea,
                                  'tipo'          => $tipoc,
                                  'combustible'   => $gas,
                                  'motor'         => $motor,
                                  'serie'         => $chasis,                                 
                                   'color'         => '',                                   
                                   'poliza'         => 0,
                                   'dtaller'         => 0,
                                  'pago_hasta'    => $fechaing,
                                  'radio'         => '',
                                  'id_prop'       => $id_propietario,
                                  'estado'        => $estadomovil,
                                  'managerid'     => $id_adm,
                                  'cilindraje'     => $cilindra,
                                  'fcontrato'     => $fcontrato); 
                    $this->db->where('id_movil', $idmovil);  //localiza la maestro a actualizar
                    $queries=$this->db->update('vehiculo',$data2);
                          if ( !empty($idoc) && is_array($idoc) ) { 
                             for ( $i=0;$i<4;$i++) { 
                                $fexp='0000-00-00';
                                $fven='0000-00-00';
                              switch ($i) {
                                case 0:
                                 if(!empty($fexp0)){
                                   $fexp=date('Y-m-d',strtotime($fexp0));
                                 }
                                 if(!empty($fven0)){
                                   
                                   $fven=date('Y-m-d',strtotime($fven0));
                                 }
                                  break;
                                case 1:
                                 if(!empty($fexp1)){
                                   $fexp=date('Y-m-d',strtotime($fexp1));
                                 }
                                  if(!empty($fven1)){
                                   $fven=date('Y-m-d',strtotime($fven1));
                                 }
                                  break;
                                case 2:
                                 if(!empty($fexp2)){
                                   $fexp=date('Y-m-d',strtotime($fexp2));
                                 }
                                  if(!empty($fven2)){
                                   $fven=date('Y-m-d',strtotime($fven2));
                                 }
                                  break;
                                case 3:
                                 if(!empty($fexp3)){
                                   $fven=date('Y-m-d',strtotime($fven3));
                                 }
                                  if(!empty($fven3)){
                                   $fven=date('Y-m-d',strtotime($fven3));
                                 }
                                  break;
                                // case 4:
                                //  if(!empty($fexp4)){
                                //    $fexp=date('Y-m-d',strtotime($fexp4));
                                //  }
                                //  if(!empty($fven4)){
                                //    $fven=date('Y-m-d',strtotime($fven4));
                                //  }
                                //   break;

                              }

                              
                              $valuedocs = array('id_movil'      => $idmovil,
                                               'id_documento'    => $idoc[$i],
                                               'fecha_exp'       => $fexp,
                                               'fecha_ven'       => $fven,
                                               'numero'          => $numerodoc[$i]);
                              $whereup='id_movil="'.$idmovil.'" and id_documento="'.$idoc[$i].'"';
                              $this->db->where($whereup);
                              $this->db->update('veh_doc',$valuedocs);
                             // $this->db->insert('veh_doc',$valuedocs);
                             }
                          }
                          if ($estadomovil==0) {
                                  $data2 =array(
                                          'placa'         => '',
                                          'modelo'        => '',
                                          'id_marca'      => '',
                                          'clase'         => '',
                                          'referencia'    => '',
                                          'tipo'          => '',
                                          'combustible'   => '',
                                          'motor'         => '',
                                          'serie'         => '',
                                          'pago_hasta'    => '',
                                          'dtaller'       => '',
                                          'radio'         => 'si',
                                          'id_prop'       => '',
                                          'estado'        => $estadomovil,
                                          'managerid'     => '',
                                          'fcontrato'     => '',
                                          'cilindraje'     => '',
                                          'ultimo_pago'   => ''); 
                            $this->db->where('id_movil', $idmovil);  //localiza la maestro a actualizar
                            $queries=$this->db->update('vehiculo',$data2);
                            $valuedocs = array('fecha_exp'       => '0000-00-00',
                                             'fecha_ven'       => '0000-00-00',
                                             'numero'          => '');
                            $whereup='id_movil="'.$idmovil.'"';
                            $this->db->where($whereup);
                            $this->db->update('veh_doc',$valuedocs);
			    $this->db->select('max(id_mov_diarios),id_movil,admin,radio,taller,pagos_dia,recibo_num,concepto,total,fecha_create,saldo_hasta',false);
			   // $this->db->select_max('id_mov_diarios');
			    $this->db->where('id_movil', $idmovil);
			    $result = $this->db->get('movimiento_diarios');
			    $datos=$result->row();
			    $valuedes=array(
    				'id_movil' => $datos->id_movil,
    				'admin' => $datos->admin,
    				'radio' => $datos->radio,
    				'taller' => $datos->taller,
    				'diarios' => $datos->pagos_dia,
    				'recibo' => $datos->recibo_num,
    				'concepto' => $datos->concepto,
    				'total' => $datos->total,
    				'fecha_pago' => $datos->fecha_create,
    				'pago_hasta' => $datos->saldo_hasta,);
    			   $this->db->insert('movil_desvinculados',$valuedes);
                          }

          
            break;
       }
       
  //$this->db->affected_rows()>0

       if($queries){
        return $resp=array('guarda'=>'ok');
       }else{
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
       }
       
     }else{
       return $resp=array('guarda'=>'error','motivo'=>'found','idmovil'=>$idmovil);
     }  

    }

      function inserta_diario()
    {
        date_default_timezone_set('America/Bogota');
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        $hoy=date('Y-m-d H:i:s');

        $fechadiario = strtotime ( '+'.$cuota.' month' , strtotime ( $phasta ) ) ;
        $fechadiario = date ( 'Y-m-d' , $fechadiario );
        if($descampo=='activo'){
          $desc='si';
        }else{
          $desc='no';
        }
  $this->db->trans_begin();
	$this->db->where('id_movil', $id_movil); 
        $query = $this->db->get('vehiculo');
	$datamov=$query->row();
	$grupoemp=$datamov->grupo;
        if($tipof=='diarios'){
          $ttaller=0;
		$wherecon='empresa="'.$grupoemp.'" and motivo="DI"';
		$this->db->where($wherecon); 
       		$sqlcon = $this->db->get('consecutivo');
		$datacon=$sqlcon->row();
		$conse=$datacon->consecutivo;
		$nconse=$conse+1;
	
		 $valuecon = array('consecutivo'  => $nconse);
            	 $this->db->where($wherecon);
            	 $this->db->update('consecutivo',$valuecon);

          $data2 =array(
	    'id_diario'	    =>$nconse,	
            'id_movil'      =>$id_movil,
            'pagos_dia'     =>$cuota,
            'admin'         =>$vadmint,
            'fecha_pago'    =>$hoy,
            'aporte'        =>$vdiaaporte*$cuota,
            'radio'         =>$vradit,
            'total'         =>$pagarnf,
            'estado'        =>'activo',
            'desc'          =>$desc,
            'descuento'     =>$descaplicado,
            'id_descuento'     =>$id_desc
          );
          $queries1= $this->db->insert('diarios',$data2);
          $iddiario=$nconse;

          if($descampo=='activo'){
            $valuedt = array( 'estado'  => 'asignado');
            $whereupm='id_movil="'.$id_movil.'"';
            $this->db->where($whereupm);
            $this->db->update('pago_descuento',$valuedt);
          }

          //aportes
              $data_a =array(
                'id_movil'      =>$id_movil,
                'fecha_aporte'  =>$hoy,
                'nrec'          =>$nconse,
                'aporte'        =>$vdiaaporte*$cuota,
                'estado'        =>'activo'
              );
              $queries2= $this->db->insert('aportes',$data_a);
        }else{
          $dtsaldo=$ndtaller-$cuota;
	  	$wherecon='empresa="'.$grupoemp.'" and motivo="T"';
		$this->db->where($wherecon); 
       		$sqlcon = $this->db->get('consecutivo');
		$datacon=$sqlcon->row();
		$conse=$datacon->consecutivo;
		$nconse=$conse+1;
	
		 $valuecon = array('consecutivo'  => $nconse);
            	 $this->db->where($wherecon);
            	 $this->db->update('consecutivo',$valuecon);

          $data2 =array(
	    'id_ptaller'    =>$nconse,
            'id_movil'      =>$id_movil,
            'pagos_dia'     =>$cuota,
            'saldo'         =>$dtsaldo,
            'fecha_pago'    =>$hoy,
            'vdia'          =>$vdiataller,
            'total'         =>$pagarnf,
            'estado'        =>'activo'
          );
          $ttaller=$vdiataller*$cuota;
          $queries1= $this->db->insert('pago_taller',$data2);
          $iddiario=$nconse;

           $valuedt = array( 'dtaller'  => $dtsaldo);
           $whereupm='id_movil="'.$id_movil.'"';
           $this->db->where($whereupm);
           $this->db->update('vehiculo',$valuedt);
        }
        $data1 =array(
            'recibo_num'    =>$iddiario,
            'id_movil'      =>$id_movil,
            'pagos_dia'     =>$cuota,
            'concepto'      =>$tipof,
            'admin'         =>$vadmint,
            'fecha_create'  =>$hoy,
            'radio'         =>$vradit,
            'taller'        =>$ttaller,
            'aporte'        =>$vdiaaporte,
            'saldo_hasta'   =>$fechadiario,
            'total'         =>$pagarnf
          );
       $queries= $this->db->insert('movimiento_diarios',$data1);
       $id_mov=$this->db->insert_id();

       $valuedocs = array( 'pago_hasta'  => $fechadiario,'ultimo_pago'=>$hoy);
       $whereup='id_movil="'.$id_movil.'"';
       $this->db->where($whereup);
       $actu=$this->db->update('vehiculo',$valuedocs);


       if ($this->db->trans_status() === FALSE || !$queries || !$queries1 || !$queries2 || !$actu)
         {     $this->db->trans_rollback();
               return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
         }
         else
         {
             $this->db->trans_commit();
             return $resp=array('guarda'=>'ok','nrecibo'=>$iddiario,'tipor'=>$tipof);
         }

    }
      function ndiarios($campo,$tabla)
    {
      $this->db->select("max(".$campo.") as id");
      $query = $this->db->get($tabla);
        if($query->num_rows() > 0){   
            return $query;
         }else{
              return false;
         }  
    }
      function inserta_descuento()
    {
        date_default_timezone_set('America/Bogota');
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        $hoy=date('Y-m-d H:i:s');
        if(!isset($vdiatotal2)){
          $vdiatotal2=0;
        }
        if(!isset($v_descuento2)){
          $v_descuento2=0;
        }
         $this->db->trans_begin();

	        $this->db->where('id_movil', $id_movild); 
      		$query = $this->db->get('vehiculo');
		$datamov=$query->row();
		$grupoemp=$datamov->grupo;
          	$ttaller=0;
	  	$wherecon='empresa="'.$grupoemp.'" and motivo="DE"';
		$this->db->where($wherecon); 
       		$sqlcon = $this->db->get('consecutivo');
		$datacon=$sqlcon->row();
		$conse=$datacon->consecutivo;
		$nconse=$conse+1;
	
		 $valuecon = array('consecutivo'  => $nconse);
            	 $this->db->where($wherecon);
            	 $this->db->update('consecutivo',$valuecon);

          $data2 =array(
	    'id_descuento'     =>$nconse,
            'id_movil'         =>$id_movild,
            'diarios_mora'     =>$tmora,
            'vt_admin'         =>$vdiatotal1,
            'porcen_admin'     =>$v_descuento1,
            'vt_radio'         =>$vdiatotal2,
            'porcen_radio'     =>$v_descuento2,
            'fecha_pago'       =>$hoy,
            'vtdescuento'      =>$vtotalconctext,
            'concepto_desc'    =>$concepto_descuento,
            'estado'      =>'activo'
          );
          $vadmv=($vdiatotal1-($vdiatotal1*($v_descuento1/100)))*-1;
          $vrdv=($vdiatotal2-$v_descuento2)*-1;
          $queries1= $this->db->insert('pago_descuento',$data2);
          $iddesc=$nconse;
          $data1 =array(
            'recibo_num'    =>$iddesc,
            'id_movil'      =>$id_movild,
            'pagos_dia'     =>0,
            'concepto'      =>'descuento',
            'admin'         =>$vdiatotal1,
            'fecha_create'  =>$hoy,
            'radio'         =>$vrdv,
            'taller'         =>0,
            'total'         =>($vtotalconctext*-1)
          );
       $queries= $this->db->insert('movimiento_diarios',$data1);
       $id_mov=$this->db->insert_id();
       if ($this->db->trans_status() === FALSE || !$queries || !$queries1)
         {     $this->db->trans_rollback();
               return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
         }
         else
         {
             $this->db->trans_commit();
             return $resp=array('guarda'=>'ok','nrecibo'=>$iddesc);
         }

       //  if($queries && $queries1){
       //  return $resp=array('guarda'=>'ok','nrecibo'=>$iddesc);
       // }else{
       //  return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
       // }
    }
       function anula_rec()
     {
            $hoy=date('Y-m-d H:i:s');
           foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
         $this->db->trans_begin();

             if($tabla=='diarios'){
                $this->db->where('id_diario',$id); 
                $query = $this->db->get('diarios');
                $datar=$query->row();
                $id_des=$datar->id_descuento;
                $id_movil=$datar->id_movil;
                $cuota=$datar->pagos_dia;
                $vadmint=($datar->admin)* -1;
                $vradit=($datar->radio)* -1;
                $vaporte=($datar->aporte)* -1;
                $pagarnf=($datar->total)* -1;
                if($id_des<>NULL){
                  $data =array(
                   'modifica_user'  =>$_COOKIE['user_ID'],
                   'date_mod'       =>$hoy,
                   'motivo_anula'   =>$concepto_anula,
                   'estado'    =>'activo'
                  );
                  $this->db->where('id_descuento', $id_des);  //localiza la maestro a actualizar
                  $actu=$this->db->update('pago_descuento', $data); //realiza la actualizacion 
                }
                $data1 =array(
                 'modifica_user'  =>$_COOKIE['user_ID'],
                 'date_mod'       =>$hoy,
                 'motivo_anula'   =>$concepto_anula,
                 'estado'    =>'anulado'
                );
                $this->db->where('id_diario', $id);  //localiza la maestro a actualizar
                $actu=$this->db->update('diarios', $data1); //realiza la actualizacion 
                //actualizar tabla de vehiculo para retornar la fecha de pago
                $this->db->where('id_movil',$id_movil); 
                $querymov = $this->db->get('vehiculo');
                $datam=$querymov->row();
                $phastan=$datam->pago_hasta;
                $fechadiario = strtotime ( '-'.$cuota.' month' , strtotime ( $phastan ) ) ;
                $fechadiario = date ( 'Y-m-d' , $fechadiario );

                $datam =array('pago_hasta'       =>$fechadiario);
                $this->db->where('id_movil', $id_movil);  //localiza la maestro a actualizar
                $actum=$this->db->update('vehiculo', $datam); //realiza la actualizacion 

                $data2 =array(
                    'recibo_num'    =>$id,
                    'id_movil'      =>$id_movil,
                    'pagos_dia'     =>$cuota,
                    'concepto'      =>'anulado',
                    'admin'         =>$vadmint,
                    'fecha_create'  =>$hoy,
                    'radio'         =>$vradit,
                    'aporte'         =>$vaporte,
                    'taller'         =>0,
                    'saldo_hasta'   =>$fechadiario,
                    'total'         =>$pagarnf
                  );
               $actu2= $this->db->insert('movimiento_diarios',$data2);
               $actu3=$this->db->delete('aportes',array('nrec'=>$id)); //comando para borrar el registro con el id correspondiente


             // $id=
             }
             if($tabla=='pago_taller'){
              //$camposmov="id_ptaller as id ";
               $this->db->where('id_ptaller',$id); 
               $query = $this->db->get('pago_taller');
               $datar=$query->row();

               $id_movil=$datar->id_movil;
               $cuota=$datar->pagos_dia;

               $pagarnf=($datar->total)* -1;

                $data1 =array(
                 'modifica_user'  =>$_COOKIE['user_ID'],
                 'date_mod'       =>$hoy,
                 'motivo_anula'   =>$concepto_anula,
                 'estado'    =>'anulado'
                );
                $this->db->where('id_ptaller', $id);  //localiza la maestro a actualizar
                $actu=$this->db->update('pago_taller', $data1); //realiza la actualizacion 


                $this->db->where('id_movil',$id_movil); 
                $querymov = $this->db->get('vehiculo');
                $datam=$querymov->row();
                $phastan=$datam->pago_hasta;
                $dtallerold=$datam->dtaller;
                $nctaller=$dtallerold+$cuota;
                $fechadiario = strtotime ( '-'.$cuota.' day' , strtotime ( $phastan ) ) ;
                $fechadiario = date ( 'Y-m-d' , $fechadiario );

                $datam =array('pago_hasta'  =>$fechadiario,'dtaller'  =>$nctaller);
                $this->db->where('id_movil', $id_movil);  //localiza la maestro a actualizar
                $actum=$this->db->update('vehiculo', $datam); //realiza la actualizacion 

                $data2 =array(
                    'recibo_num'    =>$id,
                    'id_movil'      =>$id_movil,
                    'pagos_dia'     =>$cuota,
                    'concepto'      =>'anulado',
                    'admin'         =>0,
                    'fecha_create'  =>$hoy,
                    'radio'         =>0,
                    'taller'         =>$pagarnf,
                    'saldo_hasta'   =>$fechadiario,
                    'total'         =>$pagarnf
                  );
               $actu2= $this->db->insert('movimiento_diarios',$data2);
              
             }
             if($tabla=='pago_descuento'){
               $this->db->where('id_descuento',$id); 
               $query = $this->db->get('pago_descuento');
               $datar=$query->row();
               $estado=$datar->estado;
               $id_movil=$datar->id_movil;
               if($estado=='asignado'){
                 return $resp=array('guarda'=>'error','motivo'=>'Descuento ya fue asignado');
               }else{
                $data =array(
                 'modifica_user'  =>$_COOKIE['user_ID'],
                 'date_mod'       =>$hoy,
                 'motivo_anula'   =>$concepto_anula,
                 'estado'    =>'anulado'
                );
                $this->db->where('id_descuento', $id);  //localiza la maestro a actualizar
                $actu=$this->db->update($tabla, $data); //realiza la actualizacion 
                $actu2=$this->db->delete('movimiento_diarios',array('recibo_num'=>$id,'concepto'=>'descuento')); //comando para borrar el registro con el id correspondiente
                $actu3=true;
              }
             }
             if ($this->db->trans_status() === FALSE || !$actu || !$actu2 || !$actu3)
               {     $this->db->trans_rollback();
                     return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
               }
               else
               {
                   $this->db->trans_commit();
              return $resp=array('guarda'=>'ok','idmovil'=>$id_movil,'tabla'=>$tabla,'nrecibo'=>$id);
               }
             //  if($actu && $actu2){
             //  return $resp=array('guarda'=>'ok','idmovil'=>$id_movil,'tabla'=>$tabla,'nrecibo'=>$id);
             // }else{
             //  return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
             // }
            
     }

  function guarda_valor()
    {
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
     if($admin!=''){   
       $wherecon='id_con_pago=1';
       $valuecon = array('valor'  => $admin);
        $this->db->where($wherecon);
        $queries= $this->db->update('concepto_pago',$valuecon);
     }
      if($aportes!=''){   
       $wherecon='id_con_pago=4';
       $valuecon = array('valor'  => $aportes);
        $this->db->where($wherecon);
       $queries= $this->db->update('concepto_pago',$valuecon);
     }
     // if($taller!=''){   
     //   $wherecon='id_con_pago=3';
     //   $valuecon = array('valor'  => $taller);
     //   $this->db->where($wherecon);
     //   $queries= $this->db->update('concepto_pago',$valuecon);
     // }

        if($queries){
        return $resp=array('guarda'=>'ok');
       }else{
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
       }
    }
     function asigna_dias()
    {
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
          $valuedt = array( 'dtaller'  => $diast);
          $queries=  $this->db->update('vehiculo',$valuedt);

       if($queries){
        return $resp=array('guarda'=>'ok');
       }else{
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
       }
    }
     function asigna_fecha()
    {
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
          $fexp=date('Y-m-d',strtotime($fbloqueo));

          $valuedt = array( 'fbloqueo'  => $fexp);
          $queries=  $this->db->update('info_sistema',$valuedt);

       if($queries){
        return $resp=array('guarda'=>'ok');
       }else{
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
       }
    }

	public function GetData($filter,$filter_adv,$join,$tabla,$conf) {
      foreach ($_REQUEST as $var => $val){
          $$var = $this->db->escape_str($val);
      } 
      try {
	        $aColumns = $conf['aColumns'];
	        $aColumns2 = $conf['aColumns2'];
			    $aColumns1 = $conf['aColumns1'];
			    $aColumnsunion = $conf['aColumnsunion'];
          $sWhere = "";
			    $sWhereunion="";
           // print_r($filter);
	        if (is_array($filter)) {
	        	 $sWhere="where  1 ";
              if(count($filter) > 0){
                  foreach ($filter as $key => $value) {
                      $sWhere .= " and $key = '$value'";
                  }
              }
	        }
	        if (is_array($filter_adv)) {
              if(count($filter_adv) > 0){
                  foreach ($filter_adv as $key => $value) {
                      $sWhere .= " AND $value ";
                  }
              }
	        }
           
          /*
           * Paging
          */
          	$sLimit = "";
          	if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' ){
              $sLimit = " LIMIT ".intval( $_GET['iDisplayStart'] ).", ".
                        intval( $_GET['iDisplayLength'] );
          	}
          	$sOrder = "";
	        if ( isset( $_GET['iSortCol_0'] ) ){
              $sOrder = " ORDER BY  ";
              //  $sOrder.=" enm_reasignada DESC, ";
              for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ ){
                  if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" ){
                      $sOrder .= "".$aColumns1[ intval( $_GET['iSortCol_'.$i] ) ]." ".
                          ($_GET['sSortDir_'.$i]==='asc' ? 'ASC' : 'DESC') .", ";
                  }
              }
           
              $sOrder = substr_replace( $sOrder, "", -2 );
              if ( $sOrder == " ORDER BY" ) {
                  $sOrder = "";
              }
	        }
	        
	        if ( isset($sSearch) && $sSearch != "" ) {
          	 
              //$sWhere .= "AND (";
			  if ( $sWhere == "" ) {
                      $sWhere .= "WHERE 1 and(";
                  } else {
                      $sWhere .= " AND (";
                  }
              for ( $i=0 ; $i<count($aColumns) ; $i++ ) {
                  $sWhere .= " ".$aColumns[$i]." LIKE '%".( $sSearch )."%' OR ";
              }
              $sWhere = substr_replace( $sWhere, "", -3 );
              $sWhere .= ')';
			  
              if($conf['union'] != ''){
                $sWhereunion .= " AND (";
                for ( $i=0 ; $i<count($aColumnsunion) ; $i++ ) {
                    $sWhereunion .= " ".$aColumnsunion[$i]." LIKE '%".( $sSearch )."%' OR ";
                }
                $sWhereunion = substr_replace( $sWhereunion, "", -3 );
                $sWhereunion .= ')';
              }
			  
	        }
           
	          /* Individual column filtering */
	        for ( $i=0 ; $i<count($aColumns) ; $i++ ) {
              if ( isset($_GET['bSearchable_'.$i]) && $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' ) {
                  if ( $sWhere == "" ) {
                      $sWhere .= " 1";
                  } else {
                      $sWhere .= " AND ";
                  }
                  $sWhere .= "`".$aColumns[$i]."` LIKE '%". $this->db->escape_str($_GET['sSearch_'.$i])."%' ";
              }
	        }
	        $joinstring='';
          	if (is_array($join)|| $join!='') {
		 		if(count($join) > 0){			
		 			foreach ($join as $key => $value) {
		 				$joinstring.=' LEFT JOIN '.$key.' ON '.$value;
		 			}
		 		}
            }
			$sql="SELECT ";
			foreach($aColumns2 as $key => $value){ $updateArray[$key] = $value; };
		    $sql .= implode(',',$updateArray);
	  		$query = $this->db->query($sql." FROM ".$tabla.$joinstring."  ".$sWhere.$conf['union'].$sWhereunion.$sOrder.$sLimit);
          	if (is_array($join)|| $join!='') {
		 		if(count($join) > 0){			
		 			foreach ($join as $key => $value) {
		 				$this->db->join($key,$value,'left');
		 			}
		 		}
            }
			$query2 = $this->db->query($sql." FROM ".$tabla.$joinstring."  ".$sWhere.$conf['union'].$sWhereunion);
			
			//echo $this->db->last_query();
  			$rResult2=$this->db->query("SELECT FOUND_ROWS() as reg")->row();
			//echo $this->db->last_query();
  			 $iFilteredTotal =$rResult2->reg;
  			$output = array(
		        "sEcho" => intval($_GET['sEcho']),
		        "iTotalRecords" => $iFilteredTotal,
		        "iTotalDisplayRecords" => $iFilteredTotal,
		        "aaData" => array()
			);

  		  	if($query->num_rows() > 0){      
            foreach($query->result() as $aRow) {
                  $row = array();
                foreach($conf['rows'] as $key =>$valueRow){
                  $row[] =$aRow->$valueRow;
                }
                foreach($conf['opt'] as $key =>$valueOpt){
                  $row[] =$valueOpt;
                }
                $class_row = 'cursor abre_mod_global';
                      $row["DT_RowClass"] = $class_row;
                      $output['aaData'][] = $row;
            }
  		  	}        
        } catch (PDOException $e) {
           echo "Error en la Consulta de llamado ajax() GetData, error: " . $e->getMessage();
        }
           
       return $output;   
 }//fin funcion
  function inserta_condu()
  {
        date_default_timezone_set('America/Bogota');
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        //$estudios         = filter_var($_REQUEST['estudios'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
        $expe         = filter_var($_REQUEST['expe'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
        $obs         = filter_var($_REQUEST['obs'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
        $hoy=date('Y-m-d');
        $yaexiste=false;
        $this->db->trans_begin();
        $fnace=date('Y-m-d',strtotime($fechanace));
        if($tipo=='nuevo'){
          $this->db->where('codigo',$idp); 
            $query = $this->db->get('conductor');
            if($query->num_rows() > 0){
              $datam = $query->row();
            $codigom=$datam->codigo;
              if($idp==trim($codigom)){
                $yaexiste=true;
              }
            }   
        }
      if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){ 
          $file = $_FILES['archivo']['name'];
          $ext = end((explode(".",$file)));
      if(!$yaexiste){  
        switch ($tipo) {
          case 'nuevo': 
              if(!is_dir("fotos/"))
                mkdir("fotos/", 0777);
              if ($file && move_uploaded_file($_FILES['archivo']['tmp_name'],"fotos/".$idp.'.'.$ext)){   
                      $data2 =array(
                            'codigo'              => $idp,
                            'nombres'             => $nombreprop,
                            'apellidos'           => $apellprop,
                            'telefono'            => $telprop,
                            'tipo_rh'             => $rh,
                            'direccion'           => $dirprop,
                            'acudiente'           => $acudiente,
                            'fecha_nace'          => $fnace,
                            'lugarNace'           => $lugarnace,
                            'telefonoa'           => $telacu,
                            'emailc'              => $emailc,
                            'observacion'         => $obs,
                            'experiencia_laboral' => $expe,
                            'ispensionado'        => $pensionado,
                            'foto'                => $idp.'.'.$ext
                    ); 
              }else{
                      $data2 =array(
                          'codigo'              => $idp,
                          'nombres'             => $nombreprop,
                          'apellidos'           => $apellprop,
                          'telefono'            => $telprop,
                          'tipo_rh'             => $rh,
                          'direccion'           => $dirprop,
                          'acudiente'           => $acudiente,
                          'fecha_nace'          => $fnace,
                          'lugarNace'           => $lugarnace,
                          'telefonoa'           => $telacu,
                          'emailc'              => $emailc,
                          'observacion'         => $obs,
                          'experiencia_laboral' => $expe,
                          'ispensionado'        => $pensionado
                    ); 
              }


              $queries=$this->db->insert('conductor',$data2);
              $id_cond=$this->db->insert_id();
              if ( !empty($idoc) && is_array($idoc) ) { 
                    for ( $i=0;$i<count($idoc);$i++) { 
                   $fexp='0000-00-00';
                   $fven='0000-00-00';
                   if(!empty($_REQUEST['fexp'.$i])){
                    $fexp=date('Y-m-d',strtotime($_REQUEST['fexp'.$i]));
                  }
                  if(!empty($_REQUEST['fven'.$i])){
                    $fven=date('Y-m-d',strtotime($_REQUEST['fven'.$i]));
                  }
                 $valuedocs = array('id_doc'     => $idoc[$i],
                                  'id_conductor' => $id_cond,
                                  'fecha_ant'    => $fexp,
                                  'fecha_vence'  => $fven,
                                  'categoria'    =>$info[$i],
                                  'numero'       => $numerodoc[$i]);
                 $this->db->insert('con_doc',$valuedocs);
                }
             }
        break;
          case 'edit':
              if ($file){
                if (file_exists($file)) {
                   unlink("fotos/".$idp.'.'.$ext);
                }   
              }

              if ($file && move_uploaded_file($_FILES['archivo']['tmp_name'],"fotos/".$idp.'.'.$ext)){ 
                  $data2 =array(
                            'codigo'              => $idp,
                            'nombres'             => $nombreprop,
                            'apellidos'           => $apellprop,
                            'telefono'            => $telprop,
                            'tipo_rh'             => $rh,
                            'direccion'           => $dirprop,
                            'acudiente'           => $acudiente,
                            'fecha_nace'          => $fnace,
                            'lugarNace'           => $lugarnace,
                            'telefonoa'           => $telacu,
                            'emailc'              => $emailc,
                            'observacion'         => $obs,
                            'experiencia_laboral' => $expe,
                            'ispensionado'        => $pensionado,
                            'foto'                => $idp.'.'.$ext,
                            'fecha_crea'          =>date('Y-m-d')
                  ); 
              }else{
                      $data2 =array(
                            'codigo'              => $idp,
                            'nombres'             => $nombreprop,
                            'apellidos'           => $apellprop,
                            'telefono'            => $telprop,
                            'tipo_rh'             => $rh,
                            'direccion'           => $dirprop,
                            'acudiente'           => $acudiente,
                            'fecha_nace'          => $fnace,
                            'lugarNace'           => $lugarnace,
                            'telefonoa'           => $telacu,
                            'emailc'              => $emailc,
                            'ispensionado'        => $pensionado,
                            'observacion'         => $obs,
                            'experiencia_laboral' => $expe,
                            'fecha_crea'          =>date('Y-m-d')
                    ); 
              }

          $this->db->where('codigo', $idp);  //localiza la maestro a actualizar
          $queries=$this->db->update('conductor',$data2);
          if ( !empty($idoc) && is_array($idoc) ) { 
            for ( $i=0;$i<count($idoc);$i++) { 
               $fexp='0000-00-00';
               $fven='0000-00-00';
               if(!empty($_REQUEST['fexp'.$i])){
                $fexp=date('Y-m-d',strtotime($_REQUEST['fexp'.$i]));
              }
              if(!empty($_REQUEST['fven'.$i])){
                $fven=date('Y-m-d',strtotime($_REQUEST['fven'.$i]));
              }
             $valuedocs = array('id_doc'    => $idoc[$i],
                              'fecha_ant'       => $fexp,
                              'fecha_vence'       => $fven,
                              'categoria'       =>$info[$i],
                              'numero'          => $numerodoc[$i]);
             $whereup='id_conductor="'.$id_condu.'" and id_doc="'.$idoc[$i].'"';
             $this->db->where($whereup);
             $this->db->update('con_doc',$valuedocs);

             if($notif[$i]=='si'){
               $valnotif=array(
                'id_movil' => $id_condu, 
                'fecha' => date('Y-m-d h:i:s'),
                'pago_hasta_n' => $fven,
                'novedad' =>'Pago de Aplicativo GHOST - '.$conduc[0],
                'control' =>1 
               );
               $this->db->insert('novedad_diario',$valnotif);
             }
            }
         }

          break;
    }
    
    if ($this->db->trans_status() === FALSE)
    {
        $this->db->trans_rollback();
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
    }
    else
    {
        $this->db->trans_commit();
        return $resp=array('guarda'=>'ok');
    }
    }else{
      return $resp=array('guarda'=>'error','motivo'=>'found','idprop'=>$idp);
    } 

  }
  }//fin funcion
  function addModSimit()
  {
        date_default_timezone_set('America/Bogota');
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        $fechacomp=date('Y-m-d',strtotime($fcomparendo));
        if($fpago != ''){
          $estado='Pago';
          $fechapago=date('Y-m-d',strtotime($fpago));
        }else{
          $estado='Activa';
          $fechapago=null;
        }
        $this->db->trans_begin();
        switch ($tipo) {
          case 'nuevo': 
            $idlista=$idcondu;
                  $data2 =array(
                        'id_conductor'        => $idcondu,
                        'n_parte'             => $comparendo,
                        'cod_infraccion'      => $infraccion,
                        'id_eps'              => null,
                        'valor'               => $valcompa,
                        'fecha_parte'         => $fechacomp,
                        'fecha_pago'          => null,
                        'convenio'            => $convenio,
                        'observacion'         => null,
                        'estado'              => 'Activa'
                ); 

              $queries=$this->db->insert('simit',$data2);
          break;
          case 'edit':
            $idlista=$idconduL;
            $data2 =array(
              'n_parte'             => $comparendo,
              'cod_infraccion'      => $infraccion,
              'id_eps'              => null,
              'valor'               => $valcompa,
              'fecha_parte'         => $fechacomp,
              'fecha_pago'          => $fechapago,
              'convenio'            => $convenio,
              'observacion'         => null,
              'estado'              => $estado
            );    
            $this->db->where('id_simit', $idcondu);  //localiza la maestro a actualizar
            $queries=$this->db->update('simit',$data2);

          break;
        }
    
    if ($this->db->trans_status() === FALSE)
    {
        $this->db->trans_rollback();
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
    }
    else
    {
        $this->db->trans_commit();
        return $resp=array('guarda'=>'ok','id'=>$idlista);
    }

  }//fin funcion
  function addModTc()
  {
        date_default_timezone_set('America/Bogota');
        foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        $hoy=date('Y-m-d');
        switch ($tipo) {
          case 'nuevo': 
            $this->db->trans_begin();
            $fplazoa=date('Y-m-d H:i:s',strtotime('+32 hour',strtotime($fechavig)));
            $fvigencia=date('Y-m-d H:i:s',strtotime($fechavig));
            $data2 =array(
                    'tarjeta'             =>$tarjeta,
                    'id_conductor'        => $idconductor,
                    'id_movil'            => $idmovil,
                    'id_empresa'          => 1,
                    'fecha_vigencia'      => $fvigencia,
                    'fecha_plazo_a'       => $fplazoa,
                    'fecha_elab'          => $hoy,
                    'id_doc_ref'          => $docref,
                    'estado'              => 1,
                    'planilla'            => 1
            ); 
            $queries=$this->db->insert('tarjeta_control',$data2);
            $idtc = $this->db->insert_id();
          break;
          case 'edit':
            $this->db->trans_begin();
            $data2 =array(
              'n_parte'             => $comparendo,
              'cod_infraccion'      => $infraccion,
              'id_eps'              => null,
              'valor'               => $valcompa,
              'fecha_parte'         => $fechacomp,
              'fecha_pago'          => $fechapago,
              'convenio'            => $convenio,
              'observacion'         => null,
              'estado'              => $estado
            );    
            $this->db->where('id_simit', $idcondu);  //localiza la maestro a actualizar
            $queries=$this->db->update('simit',$data2);
            
          break;
          case 'cerrar':
            $this->db->trans_begin();
            $data2 =array('estado'=> 2);    
            $this->db->where('id_tarjeta', $tarjeta);  //localiza la maestro a actualizar
            $queries=$this->db->update('tarjeta_control',$data2);
            $idtc = '';
          break;
        }
    
    if ($this->db->trans_status() === FALSE)
    {
        $this->db->trans_rollback();
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
    }
    else
    {
        $this->db->trans_commit();
        return $resp=array('guarda'=>'ok','id'=>$idconductor,'tipo'=>$tipo,'idTc'=>$idtc);
    }

  }//fin funcion
  /* Cambios jcano */ 
  function save_edit_user(){

    //echo $id_usr;

    date_default_timezone_set('America/Bogota');
     
    foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

    $hoy=date('Y-m-d');
    $yaexiste=false;
    
    if($tipo=='nuevo'){
        
        $this->db->where('documento',$docuser); 
        $query = $this->db->get('acc_usuario');
        
        if($query->num_rows() > 0){
          
          $datauser = $query->row();
          $codigouser = $datauser->documento;
          
          if($docuser == trim($codigouser)){
            $yaexiste=true;
          }

        }
    }   
    
    //echo $yaexiste; 
    if(!$yaexiste){  
      
      switch ($tipo) {
        
        case 'nuevo':

          $this->db->trans_begin();

          $data2 =array(
                //'id_usr'        => '',
                'nombre'        => $nomuser,
                'email'         => $emailuser,
                'phone'         => $teluser,             
                'tipo_doc'      => $seltipodoc,
                'documento'     => $docuser,                            
                'login'         => $aliasuser,
                'clave'         => md5($passuser),
                'admin'         => $esadmin,
                'estado'        => $estado_user
          ); 

        $queries=$this->db->insert('acc_usuario',$data2);

        $idU = $this->db->insert_id();

        $this->db->where('tipo', 'mvc'); 
        $qOption = $this->db->get('acc_opcion');

        foreach($qOption->result() as $row) {

          $dataOption =array(
                //'id_usr'        => '',
                'id_usr'        => $idU,
                'id_opcion'     => $row->id_opcion,
                'permiso'       => 0,             
                'leer'          => 'no',
                'borrar'        => 'no',                            
                'crear'         => 'no',
                'editar'        => 'no'
          );

          $queryOption = $this->db->insert('acc_permiso',$dataOption);

        }

        if ($this->db->trans_status() === FALSE || !$queries || !$queryOption)
         {     $this->db->trans_rollback();
           return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
         }
         else
         {
           $this->db->trans_commit();
           return $resp=array('guarda'=>'ok');
         }

        break;

        case 'edit':

          $data2 =array(
            //'id_usr'        => '',
            'nombre'        => $nomuser,
            'email'         => $emailuser,
            'phone'         => $teluser,             
            'tipo_doc'      => $seltipodoc,
            'documento'     => $docuser,                            
            'login'         => $aliasuser,
            'clave'         => md5($passuser),
            'admin'         => $esadmin,
            'estado'        => $estado_user
          ); 

        $this->db->where('id_usr', $idp);  //localiza la maestro a actualizar
        $queries=$this->db->update('acc_usuario',$data2);

        break;
      }
     
//$this->db->affected_rows()>0

      if($queries){
        return $resp=array('guarda'=>'ok');
      }else{
        return $resp=array('guarda'=>'error','motivo'=>'Error al guardar');
      }
     
    }else{
      return $resp=array('guarda'=>'error','motivo'=>'found','idprop'=>$idp);
    }  

  }

  function save_change_status(){

    date_default_timezone_set('America/Bogota');
     
    foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

    if($permiso==1){

      $dtedit =array(
            'permiso' => 0 
      ); 

    }else{
      $dtedit =array(
            'permiso' => 1 
      ); 
    }

    $this->db->where('id_usr', $id_usr);  //localiza la maestro a actualizar
    $this->db->where('id_opcion', $id_opcion); 
    $queries=$this->db->update('acc_permiso',$dtedit);

    if($queries){
      return $resp=array('guarda'=>'ok');
    }else{
      return $resp=array('guarda'=>'error','motivo'=>'Error al cambiar permiso');
    }
      
  }

  function save_change_priv(){

    date_default_timezone_set('America/Bogota');
     
    foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

    if($valor=='si'){

      $dtedit =array(
            $campo => 'no' 
      ); 

    }else{
      $dtedit =array(
            $campo => 'si' 
      ); 
    }

    $this->db->where('id_usr', $id_usr);  //localiza la maestro a actualizar
    $this->db->where('id_opcion', $id_opcion); 
    $this->db->where('id_permiso', $permiso); 
    $queries=$this->db->update('acc_permiso',$dtedit);

    if($queries){
      return $resp=array('guarda'=>'ok');
    }else{
      return $resp=array('guarda'=>'error','motivo'=>'Error al cambiar permiso');
    }
      
  }

  public  function borrar_usr()
  {
    foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

    $this->db->trans_begin();    

    $this->db->where('id_usr', $id_usr); 
    $qOption = $this->db->get('acc_permiso');

    foreach($qOption->result() as $row) {

      $queryOption = $this->db->delete('acc_permiso',array('id_usr'=>$id_usr));

    }

    $queries = $this->db->delete('acc_usuario',array('id_usr'=>$id_usr));

    if($this->db->trans_status() === FALSE || !$queries || !$queryOption){     
        
        $this->db->trans_rollback();
        return $resp=array('guarda'=>'error','motivo'=>'Error al eliminar el usuario');

    }else{
      $this->db->trans_commit();
      return $resp=array('guarda'=>'ok');
    }

  }

  function save_sign(){

    date_default_timezone_set('America/Bogota');
     
    foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
    
    //$pathinfo   = pathinfo($_FILES["firma"]["name"]);
    $nombrefile = $_FILES['firma']['name'];
    //$filename   = $_FILES["firma"]["tmp_name"];

    /*echo "ruta".$pathinfo;
    echo "nombre".$nombrefile;
     echo "file".$filename;*/

    $dtsign =array(
      'firma' => $nombrefile
    );

    $this->db->where('id_usr', $id_usr);  //localiza la maestro a actualizar
    $queries=$this->db->update('acc_usuario',$dtsign);

    if($queries){
      return $resp=array('guarda'=>'ok');
    }else{
      return $resp=array('guarda'=>'error','motivo'=>'Error al registrar la firma');
    }

  }

  public  function borrar_file()
  {
    foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

    $path = FCPATH . "uploads/firmas/".$file;
    //FCPATH . "uploads/firmas/";
    //echo "ruta".$path;

    $dtsign =array(
      'firma' => ""
    );

    $this->db->where('id_usr', $id_usr); 
    $queries=$this->db->update('acc_usuario',$dtsign);

    if(unlink($path)){
      
      if($queries){  
        return $resp=array('elimina'=>'ok');
      }else{
        return $resp=array('elimina'=>'error','motivo'=>'Error al eliminar la firma');
      }

    }else{
      return $resp=array('elimina'=>'error','motivo'=>'Error al eliminar la firma');
    }

  }//fin funcion
}//fin modelo