<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('America/Bogota');
class Sistemasart extends CI_Controller {
	function __construct(){
			parent::__construct(); // Invoca el constructor de la clase base
		    $this->load->model('Sart_model'); //Carga el modelo de Ciudad, que contiene la interaccion con la base de datos
		    $this->load->helper('form'); //Carga del ayudante de formularios
			$this->load->helper('url'); //Carga del ayudante de formularios
			$this->load->helper('cookie');//ayudante de cookies
			$this->load->library('excel'); 
			$this->load->helper('number'); // Helper formato moneda
			//$this->load->library('pdf'); // Load library
			$this->load->library('ciqrcode');
			$this->load->library('email');
		}
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$data['grupo']= $this->Sart_model->getcampo('grupo','empresa');
		$this->load->view('sart/login/vis_login.php',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 

	}

	public function sing_up() {

	    $username = filter_var($_REQUEST['username'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
	    $password = filter_var($_REQUEST['password'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
	    $grupo=$_REQUEST['grupo'];
	    $msje='';
	    $paso = 1;
	    if(empty($username)){
	        $paso = 0;
	        $msje = 'Falta Usuario.';
	    }
	    if(empty($password)){
	        $paso = 0;
	        
	         $msje=$msje.'Falta Password.';
	    }
	    if($paso == 1){

	        $password=md5($password);
	        ################CONSULTA LOGIN########
	        $filter = array('login' => $username, 'clave' => $password);
	        $filter_adv = '';
	        $result = $this->Sart_model->getdatos($filter,'acc_usuario','');
	        ######################################
	        $loguear = 'no';
	        //echo $currentRow['id_usr'];
	        if(!$result){
	            $data['validacion'] = 'fail';
	            $data['msn'] = 'Usuario invalido!';
	            $loguear = 'no';
	        }else{
	        	$row = $result->row(); 
		        $id_usr=$row->id_usr;
	              $loguear = 'yes';
	            if($loguear == 'yes'){
	            //echo $currentRow['id_usr'];
	            	//$this->input->cookie('user_ID',  $id_usr);
	            	//$cookie2 = get_cookie('user_ID');
	            	//print_r(get_cookie('user_ID'));
	            	//$data['user_ID'] = get_cookie('user_ID');
	            	//if($grupo==''){
	            	 setcookie("user_ID", $id_usr);
	            	//}
	                $data['grupo'] =trim($grupo);
	                $data['validacion'] = 'ok';
	                $data['user_ID'] = $id_usr;
	                $data['msn'] = 'login successfull!';
	            }

	        }

	        

	    }else{
	        $data['validacion'] = 'fail';
	        $data['msn'] = $msje;
	    }
	    
	    echo json_encode($data);
	}
	public function log_out(){

	   // $user_ID = $_COOKIE['user_ID'];
	    setcookie("user_ID", "", time() - 3600, '');
	    $data['validacion'] = 'ok';
	    $data['msn'] = 'logout successfull!';
	    echo json_encode($data);
	}
	public function principal()
	{
		if(isset($_COOKIE['user_ID'])){
			if(isset($_REQUEST['g'])){
				$grupo=$_REQUEST['g'];
				$data['grupo'] = $grupo;
			}
			$id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
			//$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc');
			$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc', 'acc_permiso.permiso' => '1');
		    $filter_adv = '';
		    $join=array('acc_opcion'=>'acc_permiso.id_opcion=acc_opcion.id_opcion','acc_group_user'=>'acc_group_user.id_group=acc_permiso.id_group');
			$camposmov='*';
			$orderby='';
		    $permi = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'acc_permiso','',$join,'left',$camposmov,$orderby);
		    if($permi){
				$data['panel']=$permi;
				$dataG=$permi->row();
				echo $dataG->group_name;
				if(strpos($dataG->group_name,'Secretaría')){
					$filter = array('fecha' =>date('Y-m-d'));
					$filter_adv = '';
					$isnotif= $this->Sart_model->getdatos($filter,'noficacionVencidos','');
					if($isnotif){
						$data['notif'] = $isnotif->num_rows();
					}else{
						$data['notif'] = 0;
					}
				}else{
					$data['notif'] = 0;
				}		
				$this->load->view('sart/principal',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
			}else{
				$this->index();
			}


		}else{
			$this->index();
		}
	}

	public function muestra_tab_diario()
	{
			$search=$_REQUEST['search'];
			$campo=$_REQUEST['campo'];
			$filter_adv = '';
			if(isset($_REQUEST['grupo'])){
				$grupo=$_REQUEST['grupo'];
				$data['grupo'] = $grupo;
				$filter = array($campo => $search,'grupo'=>$grupo);
			}else{
			    $filter = array($campo => $search);
			}
				$camposmov="*, DATEDIFF(now(),pago_hasta) as mora";
				$querymov= $this->Sart_model->getdatos($filter,'vehiculo',$camposmov); 
				$data['movil']=$querymov;
				if($querymov){
					$rowmoc=$querymov->row();
					$id_propi=$rowmoc->id_prop;
				//	$id_mg=$rowmoc->managerid;
					$id_mov=$rowmoc->id_movil;
					$filter2 = array('id_prop' => $id_propi);
					$rowprop= $this->Sart_model->getdatos($filter2,'propietario','');
					$data['propietario']=$rowprop;

				/*	if($id_mg!=''){
						$filter2 = array('id_prop' => $id_mg);
						$rowprop= $this->Sart_model->getdatos($filter2,'propietario','');
						$data['manager']=$rowprop;
					}*/
				   $fil = array('id_movil' => $id_mov);
				   $data['docv'] = $this->Sart_model->datosvehi($fil,$filter_adv,''); 
				}	
				//$filter2 = array('id_prop' => $id_mg);

				$data['valores'] = $this->Sart_model->selectall('id_con_pago','concepto_pago'); 
				
			$this->load->view('sart/pagos/tab_pago',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	}
	public function propietario()
	{
	  if(isset($_COOKIE['user_ID'])){
			$app_ID=$_REQUEST['app_ID'];
	    	$data['app_ID'] = $app_ID;
		if(isset($_REQUEST['g'])){
			$grupo=$_REQUEST['g'];
			$data['gfijo'] = $grupo;
		}else{
		    $data['grupo']= $this->Sart_model->getcampo('grupo','empresa');
		}
	    $id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
		//$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc');
		$filter = array('acc_permiso.id_usr' => $id_user,'id_opcion' => $app_ID);
		$filter_adv = '';
		$data['permisos'] = $this->Sart_model->getdatos($filter,'acc_permiso',''); 
		$this->load->view('sart/movil/gesPropietario',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	  }else{
			$this->index();
	  }
	}
	   public function listar_tabla_prop()
		{
			$app_ID=$_REQUEST['app_ID'];
			$where='';
			$search2='';
			$campo='';
				// if(isset($_REQUEST['grupo'])){
				// 	$valfg=$_REQUEST['grupo'];
				// 	if($valfg!=''){
				// 		$where.=" 1 and grupo='".$valfg."'";
				// 	}
			 //    }
			    
			if(isset($_REQUEST['search1'])){
				$search=$_REQUEST['search1'];
				$where.=$campo."= '".$search2."'";
			}
			
			
			if(isset($_REQUEST['search2'])){
				$search2=$_REQUEST['search2'];
				$campo=$_REQUEST['campo'];
				$where.=$campo."='".$search2."'";
			}
			
			$order=$_REQUEST['order'];
			$by=$_REQUEST['by'];
			$orderby="$order $by ";
			$query = $this->Sart_model->countpro($where);
	        $row = $query->row(); 
			$iTotal   = $row->total;
			$items2   = ( isset($_REQUEST['items']) ) ? $_REQUEST['items'] : 30;
			$page2    = ( isset($_REQUEST['page']) ) ? $_REQUEST['page'] : 1;
			$pages    = ceil($iTotal / $items2);
			$pageTmp2 = $page2 - 1;
			$sLimit   = "LIMIT " . ($pageTmp2 * $items2) . ', ' . $items2;
			#=========paging=========
			$data = array(
			    "iTotal" => intval($iTotal),
			    "items"  => intval($items2),
			    "page"   => intval($page2),
			    "pages"  => intval($pages),
			    "aaData" => array()
			);
			if(isset($_REQUEST['search'])){
				$search=$_REQUEST['search'];
				$data['search'] = $search;
			}
			$data['app_ID'] = $app_ID;
	        $data['result'] = $this->Sart_model->getallprop(($pageTmp2 * $items2),$items2,$orderby,$where);
			$this->load->view('sart/movil/vis_tabla_prop',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
		}

	public function movil()
	{
	  if(isset($_COOKIE['user_ID'])){
			$app_ID=$_REQUEST['app_ID'];
	    	$data['app_ID'] = $app_ID;
		if(isset($_REQUEST['g'])){
			$grupo=$_REQUEST['g'];
			$data['gfijo'] = $grupo;
		}else{
		    $data['grupo']= $this->Sart_model->getcampo('grupo','empresa');
		}
		$id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
		//$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc');
		$filter = array('acc_permiso.id_usr' => $id_user,'id_opcion' => $app_ID);
		$filter_adv = '';
		$data['permisos'] = $this->Sart_model->getdatos($filter,'acc_permiso',''); 
		$this->load->view('sart/movil/gesmovil',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	  }else{
			$this->index();
	  }
	}


   public function listar_tabla()
	{
		$app_ID=$_REQUEST['app_ID'];
		$where='';
		$campo='';
		$search2='';
			if(isset($_REQUEST['grupo'])){
				$valfg=$_REQUEST['grupo'];
				if($valfg!=''){
					$where.=" 1 and grupo='".$valfg."'";
				}
		    }
		    
		if(isset($_REQUEST['search1'])){
			$search=$_REQUEST['search1'];
			$where.=$campo."= '".$search2."'";
		}
		
		
		if(isset($_REQUEST['search2'])){
			$search2=$_REQUEST['search2'];
			$campo=$_REQUEST['campo'];
			$where.=$campo."='".$search2."'";
		}
		
		$order=$_REQUEST['order'];
		$by=$_REQUEST['by'];
		$orderby="$order $by ";
		$query = $this->Sart_model->countmaestro($where);
        $row = $query->row(); 
		$iTotal   = $row->total;
		$items2   = ( isset($_REQUEST['items']) ) ? $_REQUEST['items'] : 30;
		$page2    = ( isset($_REQUEST['page']) ) ? $_REQUEST['page'] : 1;
		$pages    = ceil($iTotal / $items2);
		$pageTmp2 = $page2 - 1;
		$sLimit   = "LIMIT " . ($pageTmp2 * $items2) . ', ' . $items2;
		#=========paging=========
		$data = array(
		    "iTotal" => intval($iTotal),
		    "items"  => intval($items2),
		    "page"   => intval($page2),
		    "pages"  => intval($pages),
		    "aaData" => array()
		);
		if(isset($_REQUEST['search'])){
			$search=$_REQUEST['search'];
			$data['search'] = $search;
		}
		$data['app_ID'] = $app_ID;
        $data['result'] = $this->Sart_model->getallmaestro(($pageTmp2 * $items2),$items2,$orderby,$where);
		$this->load->view('sart/movil/vis_tabla_movil',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	}
		function taximodal(){ 
	       $tipo=$_REQUEST['tipo'];

	       if($tipo=='edit'){
 		   $idmovil=$_REQUEST['id_movil'];
	       $filter = array('id_movil' => $idmovil);
	       $filter_adv = '';
	       $querymov = $this->Sart_model->getdatos($filter,'vehiculo',''); 
	       $data['vehi']=$querymov;
	       $rowmoc=$querymov->row();
	       $id_propi=$rowmoc->id_prop;
	       $id_mg=$rowmoc->managerid;

	       $filter2 = array('id_prop' => $id_propi);
	       $rowprop= $this->Sart_model->getdatos($filter2,'propietario','');
	       if($rowprop){
		       $queryprop=$rowprop->row();
		       $data['propietario']=$queryprop->id_prop.' '.$queryprop->nombre.' '.$queryprop->apellidos;
		       $data['propnoedi']=$queryprop->nombre.' '.$queryprop->apellidos;
		       
		       if($id_mg!=''){
		       	   $filter2 = array('id_prop' => $id_mg);
			       $rowprop= $this->Sart_model->getdatos($filter2,'propietario','');
			       $queryprop=$rowprop->row();
			       $data['manager']=$queryprop->id_prop.' '.$queryprop->nombre.' '.$queryprop->apellidos;
			       $data['mananoedit']=$queryprop->nombre.' '.$queryprop->apellidos;
		       }
	       }

	       $data['docv'] = $this->Sart_model->datosvehi($filter,$filter_adv,''); 
		   //echo $this->db->last_query();
	       }else{
	       	 $data['docv'] = $this->Sart_model->selectall('id_docv','documentos_v'); 
			 //echo $this->db->last_query();
	       }
	       $data['marca']= $this->Sart_model->selectall('marca','marca');
	       $data['grupo']= $this->Sart_model->getcampo('grupo','empresa');
	       $data['tipo']=$tipo;
	       $id_user=$_COOKIE['user_ID'];
	       $addID=$_REQUEST['app_ID'];
		   $filter = array('acc_permiso.id_usr' => $id_user,'id_opcion' => $addID);
		   $filter_adv = '';
		   $data['permisos'] = $this->Sart_model->getdatos($filter,'acc_permiso',''); 
	       $this->load->view('sart/movil/vis_add_edit_movil',$data);
	    }

	function grabarprop(){
	     $resp=$this->Sart_model->inserta_prop(); // Envio de los datos a la base de datos 
	      if($resp['guarda']== 'ok'){
	      	 $respu['validacion'] = 'ok';
	         $respu['msn'] = ' Guardado con Exito!!';
	       }else{
	          $respu['validacion'] = 'fail';
	          $respu['msn'] = $resp['motivo'];
	          if($resp['motivo']=='found'){
	          	$respu['idprop'] = $resp['idprop'];
	          }
	      }
	                  //======================================
	            echo json_encode($respu);
	}

	
	function grabarmovil(){
	     $resp=$this->Sart_model->inserta_mov(); // Envio de los datos a la base de datos 
	      if($resp['guarda']== 'ok'){
	      	 $respu['validacion'] = 'ok';
	         $respu['msn'] = ' Guardado con Exito!!';
	       }else{
	          $respu['validacion'] = 'fail';
	          $respu['msn'] = $resp['motivo'];
	          if($resp['motivo']=='found'){
	          	$respu['idmovil'] = $resp['idmovil'];
	          }
	      }
	                  //======================================
	            echo json_encode($respu);
	}
	function editarprop(){ //Se toman los datos de la ciudad de la bases de datos
       $tipo=$_REQUEST['tipo'];
       $menu=$_REQUEST['menu'];
       $data['menu'] = $menu;
       if($tipo=='edit'){
           $id=$_REQUEST['id_prop'];
	       $filter = array('id_prop' => $id);
	       $filter_adv = '';
	       $data['prop'] = $this->Sart_model->getdatos($filter,'propietario',''); 
       }else{
       	$data['prop'] = false;
       }
       $data['tipo']=$tipo;
       $this->load->view('sart/movil/editaprop',$data);
    }
    public function diarios()
    {
      if(isset($_COOKIE['user_ID'])){	
    	if(isset($_REQUEST['g'])){
    		$grupo=$_REQUEST['g'];
    		$data['gfijo'] = $grupo;
    	}else{
    	    $data['grupo']= $this->Sart_model->getcampo('grupo','empresa');
    	}
    	
    	 $rowndia=$this->Sart_model->ndiarios('id_diario','diarios');
    	//print_r($rowndia);
    	if(!$rowndia){
    	$queryndia=$rowndia->row();	
    	$fdiario=$queryndia->id;
    	}else{
    	$fdiario=1;
    	}

    	$data['fact']= $fdiario;
    	// $rowndiat=$this->Sart_model->ndiarios('id_ptaller','pago_taller');
    	// $queryndiat=$rowndiat->row();
    	// $data['factaller']= $queryndiat->id;
    	$rowndesc=$this->Sart_model->ndiarios('id_descuento','pago_descuento');
    	if(!$rowndesc){
    	$queryndesc=$rowndesc->row();
    	$fdesc=$queryndesc->id;
    	}else{
    	$fdesc=1;
    	}
    	//$queryndesc=$rowndesc->row();
    	$data['factdesc']= $fdesc;
    	$data['app_ID'] = $_REQUEST['app_ID'];
    	$this->load->view('sart/pagos/pagos_tabla',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
      }else{
    		$this->index();
      }
    }
    function buscar()
	{
		$where='';
		$tipo=$_REQUEST['tipo'];
		$order=$_REQUEST['order'];
		$by=$_REQUEST['by'];
		$orderby="$order $by ";

		if($tipo=='list'){
		   $search=$_REQUEST['search'];

		  	if(isset($_REQUEST['grupo'])){
		  		$valfg=$_REQUEST['grupo'];
		  		if($valfg!=''){
		  			$where.="grupo='".$valfg."'";
		  		}
		      }
		   $result= $this->Sart_model->busqueda($orderby);   //invoca el metodo getCiudad de la clase modelo y pasa la info de la ciudad a una variable
		   $data['search'] = $search;
		}
		if($tipo=='filtro'){
			$search='';
		   $campo=$_REQUEST['campo'];
		   $valor=$_REQUEST['valor'];
		   	$filter = array($campo => $valor);
		    $filter_adv = '';
		    $join='acc_permiso.id_opcion=acc_opcion.id_opcion';
	        $result=  $this->Sart_model->getfilter($filter); 
		   // $result= $this->Sart_model->getdatos($filter,'vehiculo'); 
		   //$result= $this->Sart_model->filtro();   //invoca el metodo getCiudad de la clase modelo y pasa la info de la ciudad a una variable
		}
		if($result){
			$query = $result->num_rows();
			$cnt = $query;

			$iTotal   = $cnt;
			$items2   = ( isset($_REQUEST['items']) ) ? $_REQUEST['items'] : 30;
			$page2    = ( isset($_REQUEST['page']) ) ? $_REQUEST['page'] : 1;
			$pages    = ceil($iTotal / $items2);
			$pageTmp2 = $page2 - 1;
			$sLimit   = "LIMIT " . ($pageTmp2 * $items2) . ', ' . $items2;
			#=========paging=========
			
			$data = array(
			    "iTotal" => intval($iTotal),
			    "items"  => intval($items2),
			    "page"   => intval($page2),
			    "pages"  => intval($pages)
			);
	    }else{

	    	$data = array(
	    	    "iTotal" => 0,
	    	    "items"  => 0,
	    	    "page"   => 0,
	    	    "pages"  => 0
	    	);

	    }
	    $data['search'] = $search;
		$data['result'] = $result;
		$this->load->view('sart/movil/vis_tabla_movil',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	}
	    function buscarsol()
		{
			$tipo=$_REQUEST['tipo'];
			if($tipo=='list'){
			   $search=$_REQUEST['search'];
			   $result= $this->Sart_model->busquedasol($search);   //invoca el metodo getCiudad de la clase modelo y pasa la info de la ciudad a una variable
			}
			if($tipo=='filtro'){
			   $campo=$_REQUEST['campo'];
			   $valor=$_REQUEST['valor'];
			   $result= $this->Sart_model->filtrosol();   //invoca el metodo getCiudad de la clase modelo y pasa la info de la ciudad a una variable
			}
			if($result){
				$query = $result->num_rows();
				$cnt = $query;

				$iTotal   = $cnt;
				$items2   = ( isset($_REQUEST['items']) ) ? $_REQUEST['items'] : 30;
				$page2    = ( isset($_REQUEST['page']) ) ? $_REQUEST['page'] : 1;
				$pages    = ceil($iTotal / $items2);
				$pageTmp2 = $page2 - 1;
				$sLimit   = "LIMIT " . ($pageTmp2 * $items2) . ', ' . $items2;
				#=========paging=========
				$data = array(
				    "iTotal" => intval($iTotal),
				    "items"  => intval($items2),
				    "page"   => intval($page2),
				    "pages"  => intval($pages)
				);
		    }
			$data['solicitud'] = $result;
			$this->load->view('sgc/detalle_solicitud',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
		}
		
	    function grabareply(){ 	
	      $this->Sart_model->inserta_reply(); // Envio de los datos a la base de datos 
	    
	      if($this->db->affected_rows()>0 ){
	      	 $respu['validacion'] = 'ok';
	         $respu['msn'] = 'Respuesta Guardado con Exito!!';
	       }else{

	          $respu['validacion'] = 'fail';
	          $respu['msn'] = 'Error al Guardar';
	       }
	            echo json_encode($respu);
	    }
	    function buscacri(){
	        $id_prop=$_REQUEST['id_prop'];
	       // $filter = array('id_prop1' => $id_prop);
	        $respu = $this->Sart_model->buslike($id_prop,'propietario');
	      //  $data=$respu->row();
	        echo json_encode($respu);
	    }
	    function grabardiario(){
	      foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	      $paso=0;

	    
	      if(!empty($cuota)){
	      	if(!is_numeric($cuota)){
	      		 $respu['validacion'] = 'fail';
	             $respu['msn'] = 'La mensualidad debe ser númerico';
	             $paso = 1;
	      	}
	      	if($cuota < 0){
	      		 $respu['validacion'] = 'fail';
	             $respu['msn'] = 'La mensualidad debe ser mayor';
	             $paso = 1;
	            }
	      }

	       if(empty($pagarnf)){
	       	$respu['validacion'] = 'fail';
	       	$respu['msn'] = 'Falta el valor a pagar';
	       	$paso = 1;
	      }
	        if(empty($cuota)){
	      	$respu['validacion'] = 'fail';
	      	$respu['msn'] = 'Falta la mensualidad';
	      	$paso = 1;
	      }

	      if($paso==0){
	         $resp=$this->Sart_model->inserta_diario(); // Envio de los datos a la base de datos 
	          if($resp['guarda']== 'ok'){
	          	 $respu['validacion'] = 'ok';
	          	 $respu['idmovil'] = $id_movil;
	          	 $respu['nrecibo'] = $resp['nrecibo'];
	          	 $respu['tipor'] = $resp['tipor'];
	             $respu['msn'] = ' Guardado con Exito!!';
	           }else{
	              $respu['validacion'] = 'fail';
	              $respu['msn'] = $resp['motivo'];
	              if($resp['motivo']=='found'){
	              	$respu['idmovil'] = $resp['idmovil'];
	              }
	          }
	      }
	                      //======================================
	                echo json_encode($respu);
	    }

	    public function genera_recibo()
	    {
	    		$search=$_REQUEST['search'];
	    		$campo=$_REQUEST['campo'];
	    		$ndiario=$_REQUEST['ndiario'];
	    		$tipor=$_REQUEST['tipor'];
	    		$anula=$_REQUEST['anula'];
	    		$filter_adv = '';
	    		if(isset($_REQUEST['grupo'])){
	    			$grupo=$_REQUEST['grupo'];
	    			$data['grupo'] = $grupo;
	    			$filter = array($campo => $search,'grupo'=>$grupo);
	    		}else{
	    		    $filter = array($campo => $search);
	    		}
	    			$camposmov="*, DATEDIFF(now(),pago_hasta) as mora";
	    			$querymov= $this->Sart_model->getdatos($filter,'vehiculo',$camposmov); 
	    			$data['movil']=$querymov;
	    			if($querymov){
	    				$rowmoc=$querymov->row();
	    				$id_propi=$rowmoc->id_prop;
	    				$id_mov=$rowmoc->id_movil;
	    				$grupo=$rowmoc->grupo;
	    				$filter2 = array('id_prop' => $id_propi);
	    				$rowprop= $this->Sart_model->getdatos($filter2,'propietario','');
	    				$data['propietario']=$rowprop;

	    				$filter4 = array('grupo' => trim($grupo));
	    				$rowemp= $this->Sart_model->getdatos($filter4,'empresa','');
	    				$data['empresa']=$rowemp;

	    				// $filter3 = array('id_mov_diarios' => $ndiario);
	    				// $rowdiario= $this->Sart_model->getdatos($filter3,'movimiento_diarios','');
	    				// $data['diarios']=$rowdiario;
	    				if($tipor=='diarios'){
	    					//$camposmov="id_diario as id,*";
	    					$filter3 = array('id_diario' => $ndiario);
	    					$rowdiario= $this->Sart_model->getdatos($filter3,'diarios','');
	    					$data['diarios']=$rowdiario;
	    					$data['tellerdata']=false;
	    				}else{
	    					//$camposmov="id_ptaller as id ";
	    					$filter3 = array('id_ptaller' => $ndiario);
	    					$rowdiario= $this->Sart_model->getdatos($filter3,'pago_taller','');
	    					$data['tellerdata']=$rowdiario;
	    					$data['diarios']=false;
	    				}
	    				
	    				

	    			   $fil = array('id_movil' => $id_mov);
	    			   $data['docv'] = $this->Sart_model->datosvehi($fil,$filter_adv,''); 
	    			}	
	    			$data['valores'] = $this->Sart_model->selectall('id_con_pago','concepto_pago'); 
	    			$data['anula'] = $anula;
	    		$this->load->view('sart/pagos/imprimerecibo',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	    }
	    function grabardesc(){
	      foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	      $paso=0;
	      $filter3 = array('id_movil' => $id_movild,'estado' => 'activo');
	      $rowdiario= $this->Sart_model->getdatos($filter3,'pago_descuento','');
	      if($rowdiario)
	      	if($rowdiario->num_rows() > 0){
	      	     $respu['validacion'] = 'fail';
	             $respu['msn'] = 'EL movil '.$id_movild.' tiene un descuento sin asignar';
	             $paso = 1;
	     	 }
	      if(!empty($v_descuento1)){
	      	if(!is_numeric($v_descuento1)){
	      		 $respu['validacion'] = 'fail';
	             $respu['msn'] = 'El descuento debe ser númerico';
	             $paso = 1;
	      	}
	      	if($v_descuento1 < 0){
	      		 $respu['validacion'] = 'fail';
	             $respu['msn'] = 'El descuento debe ser mayor';
	             $paso = 1;
	            }
	      }
	      if(!empty($v_descuento2)){
	      	if(!is_numeric($v_descuento2)){
	      		 $respu['validacion'] = 'fail';
	             $respu['msn'] = 'El descuento debe ser númerico';
	             $paso = 1;
	      	}
	      	if($v_descuento2 < 0){
	      		 $respu['validacion'] = 'fail';
	             $respu['msn'] = 'El descuento debe ser mayor';
	             $paso = 1;
	            }
	      }
	       if(empty($vtotalconctext)){
	       	$respu['validacion'] = 'fail';
	       	$respu['msn'] = 'Falta el valor a pagar';
	       	$paso = 1;
	      }
	        if(empty($concepto_descuento)){
	      	$respu['validacion'] = 'fail';
	      	$respu['msn'] = 'Indique el concepto del descuento';
	      	$paso = 1;
	      }

	      if($paso==0){
	         $resp=$this->Sart_model->inserta_descuento(); // Envio de los datos a la base de datos 
	          if($resp['guarda']== 'ok'){
	          	 $respu['validacion'] = 'ok';
	          	 $respu['idmovil'] = $id_movild;
	          	 $respu['nrecibo'] = $resp['nrecibo'];
	             $respu['msn'] = ' Guardado con Exito!!';
	           }else{
	              $respu['validacion'] = 'fail';
	              $respu['msn'] = $resp['motivo'];
	              if($resp['motivo']=='found'){
	              	$respu['idmovil'] = $resp['idmovil'];


	              }



	          }
	          
	      }
	                      //======================================
	                echo json_encode($respu);
	    }
	    function traedesc(){
	       foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	        $filter3 = array('id_movil' => $id_movil,'estado' => 'activo');
	        $rowdesc= $this->Sart_model->getdatos($filter3,'pago_descuento','');
	        if($rowdesc){
	    		$rowd=$rowdesc->row();
	    		$valdesc=$rowd->vtdescuento;
	    		$id_desc=$rowd->id_descuento;
	    		$respu['id_desc'] = $id_desc;
	    	}else{
	    		$valdesc=0;
	    	}
	        $respu['valdesc'] = $valdesc;
	        
	        echo json_encode($respu);


	      }
	       public function genera_descuento()
	    {
	    		   $search=trim($_REQUEST['search']);
	    		   $campo=$_REQUEST['campo'];
	    		   $ndiario=$_REQUEST['ndiario'];
	    		   $anula=$_REQUEST['anula'];
	    		   $filter_adv='';
	    		if(isset($_REQUEST['grupo'])){
	    			$grupo=$_REQUEST['grupo'];
	    			$data['grupo'] = $grupo;
	    			$filter = array($campo => $search,'grupo'=>$grupo);
	    		}else{
	    		    $filter = array($campo => $search);
	    		}
	    			$camposmov="*, DATEDIFF(now(),pago_hasta) as mora";
	    			$querymov= $this->Sart_model->getdatos($filter,'vehiculo',$camposmov); 
	    			$data['movil']=$querymov;
	    			if($querymov){
	    				$rowmoc=$querymov->row();
	    				$id_propi=$rowmoc->id_prop;
	    				$id_mov=$rowmoc->id_movil;
	    				$grupo=$rowmoc->grupo;
	    				$filter2 = array('id_prop' => $id_propi);
	    				$rowprop= $this->Sart_model->getdatos($filter2,'propietario','');
	    				$data['propietario']=$rowprop;

	    				$filter4 = array('grupo' => trim($grupo));
	    				$rowemp= $this->Sart_model->getdatos($filter4,'empresa','');
	    				$data['empresa']=$rowemp;

	    				// $filter3 = array('id_mov_diarios' => $ndiario);
	    				// $rowdiario= $this->Sart_model->getdatos($filter3,'movimiento_diarios','');
	    				// $data['diarios']=$rowdiario;

	    				$filter3 = array('id_descuento' => $ndiario);
	    				$rowdiario= $this->Sart_model->getdatos($filter3,'pago_descuento','');
	    				$data['diarios']=$rowdiario;

	    			   $fil = array('id_movil' => $id_mov);
	    			   $data['docv'] = $this->Sart_model->datosvehi($fil,$filter_adv,''); 
	    			}	
	    			$data['valores'] = $this->Sart_model->selectall('id_con_pago','concepto_pago'); 
	    			$data['anula'] = $anula;
	    		$this->load->view('sart/pagos/imprimedescuento',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	    }
	    	function reeimprimir(){ //Se toman los datos de la ciudad de la bases de datos
	    		$addID=$_REQUEST['app_ID'];
	    		$data['app_ID'] = $addID;
	           $this->load->view('sart/pagos/reeimprimir',$data);
	        }
	           public function detalle_reeimprime()
	        	{
	        		  foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	        			if(isset($grupo)){
			    			//$grupo=$grupo;
			    			$data['grupo'] = $grupo;
			    			$filter = array('grupo'=>$grupo);
			    		}else{
			    		    $filter = '';
			    		}
	        		    
	        		$orderby=$campoid.' desc';
	        		
	        		$query = $this->Sart_model->countrecibo($tabla,$filter,$campoid);
	                $row = $query->row(); 
	        		$iTotal   = $row->total;
	        		$items2   = ( isset($_REQUEST['items']) ) ? $_REQUEST['items'] : 20;
	        		$page2    = ( isset($_REQUEST['page']) ) ? $_REQUEST['page'] : 1;
	        		$pages    = ceil($iTotal / $items2);
	        		$pageTmp2 = $page2 - 1;
	        		$sLimit   = "LIMIT " . ($pageTmp2 * $items2) . ', ' . $items2;
	        		#=========paging=========
	        		$data = array(
	        		    "iTotal" => intval($iTotal),
	        		    "items"  => intval($items2),
	        		    "page"   => intval($page2),
	        		    "pages"  => intval($pages),
	        		    "aaData" => array()
	        		);

	        		
	        		if(isset($_REQUEST['search'])){
	        			$search=$_REQUEST['search'];
	        			$data['search'] = $search;
	        		}
	        		$data['tabla'] = $tabla;
	                $data['recibo'] = $this->Sart_model->getreecibo(($pageTmp2 * $items2),$items2,$orderby,$campoid,$campot,$tabla,$filter);
	               //echo $this->db->last_query();
	                	$id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
	                	$addID=$_REQUEST['app_ID'];
	                    $filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc','acc_permiso.id_opcion' => $addID);
	                	$filter_adv = '';
	                	$join='acc_permiso.id_opcion=acc_opcion.id_opcion';
	                	$data['permisos'] = $this->Sart_model->getdatosjoin($filter,'acc_permiso','acc_opcion',$join,'left'); 

	        		$this->load->view('sart/pagos/detalle_reemprime',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	        	}

	        		function detaanularec(){ //Se toman los datos de la ciudad de la bases de datos
	        			$id=$_REQUEST['id'];
	        			$tabla=$_REQUEST['tabla'];
	        			$data['tabla'] = $tabla;
	        			$data['id'] = $id;
	        	        $this->load->view('sart/pagos/anulacion',$data);
	        	    }
	        		function anularec(){ 	
	        		 foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	        		 $paso=0;
	        		 if(empty($concepto_anula)){
	        		 	$respu['validacion'] = 'fail';
	        		 	$respu['msn'] = 'Falta el Motivo de anulacion';
	        		 	$paso = 1;
	        		 }
	        		  if($paso==0){
		        	      $resp= $this->Sart_model->anula_rec(); // Envio de los datos a la base de datos 
		        	      //  print_r($resp);
		        	      if($resp['guarda']=='ok'){
		        	      	 $respu['validacion'] = 'ok';
		        	         $respu['msn'] = ' Anulado con Exito!!';
		        	         $respu['tabla'] = $resp['tabla'];
		        	         $respu['idmovil'] = $resp['idmovil'];
		        	         $respu['nrecibo'] = $resp['nrecibo'];
		        	       }else{
		        	          $respu['validacion'] = 'fail';
		        	          $respu['msn'] = $resp['motivo'];
		        	       }
		        	    }
	        	            echo json_encode($respu);
	        	    }//fin de funcion
public	function genera_informe(){ //Se toman los datos de la ciudad de la bases de datos
	     	 foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	     	  $filter='';
	     	  $filter_adv ='';
	     	  $data['id_movil']='';
	     	  $data['fini']='';
	     	  $data['ffin']='';
		 	  $data['grup']='';	
	     	  if(isset($id_movil)){
	     	  		$filter = array('vehiculo.id_movil' => $id_movil);
	     	  		$data['id_movil']=$id_movil;
	     	  }
	     	  if(isset($_REQUEST['g'])){
	     	 	$grup=$_REQUEST['g'];
	     	 	$filter['vehiculo.grupo'] = $grup;
			$data['grup']=$grup;
	     	 }
	     	 if(isset($grupo)){
		     	 if($grupo!=''){
		     	 	$filter['trim(vehiculo.grupo)'] = $grupo;
				$data['grup']=$grupo;
		     	 }
		     }
	     	 switch ($informe) {
				case 'simit':
					if(isset($fini)){
					   $fini=date('Y-m-d',strtotime($fini));
					   $ffin=date('Y-m-d',strtotime($ffin));
					   $filter_adv = array('adv1' => " fecha_parte >= '$fini' and fecha_parte <='$ffin' ");
					   $data['fini']=$fini;
					   $data['ffin']=$ffin;
					}
					$orderby='';
					$filter='';
					$camposmov='concat_ws(" ",codigo,nombres,apellidos) as conductor,n_parte,valor,cod_infraccion,fecha_parte';
					$join='simit.id_conductor=conductor.id_conductor';
					$data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'simit','conductor',$join,'left',$camposmov,$orderby); 
				   break;
	     	 	case 'cuadre_caja':
	     	 	     if(isset($fini)){
	     	 	     	$fini=date('Y-m-d',strtotime($fini));
	     	 	     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	     	// if($fini==$ffin){
	     	 	     	// 	$filter_adv = array('adv1' => " fecha_create >= '$fini'  ");
	     	 	     	// }else{
	     	 	        $filter_adv = array('adv1' => " fecha_create >= '$fini' and fecha_create <='$ffin' ");
	     	 	       //}
	     	 	       $data['fini']=$fini;
	     	 	       $data['ffin']=$ffin;
	     	 	     }

	     	 	     $orderby='movimiento_diarios.id_movil asc';
	     	 	     $camposmov='movimiento_diarios.id_movil,movimiento_diarios.radio as radio,movimiento_diarios.pagos_dia,pagos_dia,movimiento_diarios.recibo_num,movimiento_diarios.fecha_create,movimiento_diarios.concepto,movimiento_diarios.admin,movimiento_diarios.taller,movimiento_diarios.total';
	     	 	     $join='vehiculo.id_movil=movimiento_diarios.id_movil';
	     	 	     $data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'movimiento_diarios','vehiculo',$join,'left',$camposmov,$orderby); 

	     	 		// $orderby='fecha_create asc';
	     	 		 //$data['mov'] = $this->Sart_model->listar($filter,$filter_adv,'movimiento_diarios','',$orderby) ; 
	     	 		break;
	     	 	case 'estado_cuenta':
	     	 	     $filter['estado']=1;
	     	 	     $filter_adv='';
	     	 	     if(isset($fini)){
	     	 	     	$fini=date('Y-m-d',strtotime($fini));
	     	 	     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	     	$camposmov="*, DATEDIFF('$ffin',pago_hasta) as mora";
	     	 	       $data['fini']=$fini;
	     	 	       $data['ffin']=$ffin;
	     	 	     }else{
	     	 	     	$camposmov="*, DATEDIFF(now(),pago_hasta) as mora";
	     	 	     }

	     	 	     
	     	 		 $orderby='id_movil asc';
	     	 		 $data['mov'] = $this->Sart_model->listar($filter,$filter_adv,'vehiculo',$camposmov,$orderby) ; 
	     	 		 $filter3 = array('id_con_pago' => 1);
	     	 		 $rowadmin= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valadm=$rowadmin->row();
	     	 		 $adm=$valadm->valor;
	     	 		 $data['admin'] = $adm; 
	     	 		 $filter3 = array('id_con_pago' => 2);
	     	 		 $rowradio= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valradio=$rowradio->row();
	     	 		 $radio=$valradio->valor;
	     	 		 $data['radio'] = $radio; 
	     	 		break;
	     	 	case 'estado_cuentafa':
	     	 	     $filter['estado']=1;
	     	 	     $filter_adv='';
	     	 	     if(isset($fini)){
	     	 	     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	     	$fini=date('Y-m-d',strtotime($fini));
	     	 	     	
	     	 	     	$camposmov="*, DATEDIFF('$ffin',pago_hasta) as mora";
	     	 	       $data['fini']=$fini;
	     	 	       $data['ffin']=$ffin;
	     	 	     }else{ 
	     	 	     	$camposmov="*, DATEDIFF(now(),pago_hasta) as mora";
	     	 	     }
	     	 		 $orderby='id_movil asc';
	     	 		 $datosv= $this->Sart_model->listar($filter,$filter_adv,'vehiculo',$camposmov,$orderby) ;
	     	 		 foreach ($datosv->result() as $valorv) {
	     	 		  	$this->db->select('sum(pagos_dia) as diarios');
	     	 	     	$this->db->where(' estado="activo" and date_format(fecha_pago,"%Y-%m-%d") >="'.$fini.'" and id_movil='.$valorv->id_movil);
	     	 	     	$consu=$this->db->get('diarios')->row();
	     	 	     	$data['sumpago'][$valorv->id_movil]=$consu;
	     	 		  } 
	     	 		 $data['mov'] =$datosv;
	     	 		 $filter3 = array('id_con_pago' => 1);
	     	 		 $rowadmin= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valadm=$rowadmin->row();
	     	 		 $adm=$valadm->valor;
	     	 		 $data['admin'] = $adm; 
	     	 		 $filter3 = array('id_con_pago' => 2);
	     	 		 $rowradio= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valradio=$rowradio->row();
	     	 		 $radio=$valradio->valor;
	     	 		 $data['radio'] = $radio; 
	     	 		break;	
	     	 	case 'taller':
	     	 	      $filter['pago_taller.estado']='activo';
	     	 	      if(isset($fini)){
	     	 	      	$fini=date('Y-m-d',strtotime($fini));
	     	 	      	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	      	if($fini==$ffin){
	     	 	      		$filter_adv = array('adv1' => " date_format(fecha_pago,'%Y-%m-%d') >= '$fini'  ");
	     	 	      	}else{
	     	 	         $filter_adv = array('adv1' => " date_format(fecha_pago,'%Y-%m-%d') >= '$fini' and date_format(fecha_pago,'%Y-%m-%d') <='$ffin' ");
	     	 	        }
	     	 	        $data['fini']=$fini;
	     	 	        $data['ffin']=$ffin;
	     	 	      }
	     	 	      if(isset($id_movil)){
	     	 	      	$filter = array('pago_taller.id_movil' => $id_movil);
	     	 	      	$data['id_movil']=$id_movil;
	     	 	      }
	     	 		 $orderby='pago_taller.id_movil asc';
	     	 		 $camposmov='pago_taller.id_movil,pago_taller.estado,pagos_dia,saldo,id_ptaller,radio,fecha_pago';
	     	 		 $join='pago_taller.id_movil=vehiculo.id_movil';
	     	 		 $data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'pago_taller','vehiculo',$join,'left',$camposmov,$orderby); 

	     	 		// $data['mov'] = $this->Sart_model->listar($filter,$filter_adv,'pago_taller','',$orderby) ; 
	     	 		 $filter3 = array('id_con_pago' => 1);
	     	 		 $rowadmin= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valadm=$rowadmin->row();
	     	 		 $adm=$valadm->valor;
	     	 		 $filter3 = array('id_con_pago' => 2);
	     	 		 $rowradio= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valradio=$rowradio->row();
	     	 		 $radio=$valradio->valor;
	     	 		 $filter3 = array('id_con_pago' => 3);
	     	 		 $rowradio= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valtaller=$rowradio->row();
	     	 		 $taller=$valtaller->valor;
	     	 		 $data['vtaller'] = $taller;
	     	 		 $data['conradio'] = $radio+$adm-$taller;
	     	 		 $data['sinradio'] = $adm-$taller;

	     	 		break;
	     	 	case 'diarios_movil':
	     	 	    // $filter='';
	     	 	     if(isset($fini)){
	     	 	     	$fini=date('Y-m-d',strtotime($fini));
	     	 	     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	     	// if($fini==$ffin){
	     	 	     	// 	$filter_adv = array('adv1' => " fecha_create >= '$fini'  ");
	     	 	     	// }else{
	     	 	        $filter_adv = array('adv1' => " fecha_create  between '$fini' and '$ffin' ");
	     	 	      // }
	     	 	       $data['fini']=$fini;
	     	 	       $data['ffin']=$ffin;
	     	 	     }
	     	 	     if(isset($id_movil)){
	     	 	     	$filter = array('vehiculo.id_movil' => $id_movil);
	     	 	     	$data['id_movil']=$id_movil;
	     	 	     }
	     	 	     $result=$this->Sart_model->getfiltermov($filter_adv,$filter); 
	     	 	     $data['movildata']=$result;
	     	 	     if($result)
	     	 	     foreach ($result ->result() as $value) {
	     	 	     	$orderby='fecha_create asc';
	     	 	     	$filter3 = array('id_movil' => $value->id_movil);
	     	 	     	$filter_adv=array('adv1' => " fecha_create  between '$fini' and '$ffin' ");
	     	 	     	$data['mov'][$value->id_movil] = $this->Sart_model->listar($filter3,$filter_adv,'movimiento_diarios','',$orderby) ; 
	     	 	     }//fin foreach
	     	 		 
	     	 		break;
	     	 	case 'docs_vencidos':
	     	 	     $hoy=date('Y-m-d');
	 		     $filter['estado']='1';
	     	 	     if(isset($fini)){
	     	 	     	$fini=date('Y-m-d',strtotime($fini));
	     	 	     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	        $filter_adv = array('adv1' => " fecha_ven  <= '$ffin' ");
	     	 	       $data['fini']=$fini;
	     	 	       $data['ffin']=$ffin;
	     	 	     }else{
	     	 	     	$ffin=$hoy;
	     	 	     	$filter_adv = array('adv1' => " fecha_ven <= '$hoy'  ");
	     	 	     }
	     	 		 if(isset($id_movil)){
	     	 		 	$filter = array('vehiculo.id_movil' => $id_movil);
	     	 		 	$data['id_movil']=$id_movil;
	     	 		 }
	     	 		 $result=$this->Sart_model->getfilterdocs($filter,$filter_adv) ; 
	     	 		 $data['movildata'] = $result;
	     	 		 if($result)
		     	 		 foreach ($result ->result() as $value) {
		     	 		 	$filter3 = array('veh_doc.id_movil' => $value->id_movil);
		     	 		 	$data['docv'][$value->id_movil] = $this->Sart_model->datosvehi($filter3,$filter_adv,$ffin); 
		     	 		 }//fin foreach
	     	 		break;
			case 'descuento':
	     	 	      $filter['pago_descuento.estado']='asignado';
	     	 	      if(isset($fini)){
	     	 	      	$fini=date('Y-m-d',strtotime($fini));
	     	 	      	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	      	if($fini==$ffin){
	     	 	      		$filter_adv = array('adv1' => " date_format(fecha_pago,'%Y-%m-%d') >= '$fini'  ");
	     	 	      	}else{
	     	 	         $filter_adv = array('adv1' => " date_format(fecha_pago,'%Y-%m-%d') >= '$fini' and date_format(fecha_pago,'%Y-%m-%d') <='$ffin' ");
	     	 	        }
	     	 	        $data['fini']=$fini;
	     	 	        $data['ffin']=$ffin;
	     	 	      }
	     	 	      if(isset($id_movil)){
	     	 	      	$filter = array('pago_taller.id_movil' => $id_movil);
	     	 	      	$data['id_movil']=$id_movil;
	     	 	      }
	     	 		 $orderby='pago_descuento.id_movil asc';
	     	 		 $camposmov='pago_descuento.id_movil,pago_descuento.estado,diarios_mora,vtdescuento,fecha_pago,id_descuento';
	     	 		 $join='pago_descuento.id_movil=vehiculo.id_movil';
	     	 		 $data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'pago_descuento','vehiculo',$join,'left',$camposmov,$orderby); 

	     	 		// $data['mov'] = $this->Sart_model->listar($filter,$filter_adv,'pago_taller','',$orderby) ; 
	     	 		 /*$filter3 = array('id_con_pago' => 1);
	     	 		 $rowadmin= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valadm=$rowadmin->row();
	     	 		 $adm=$valadm->valor;
	     	 		 $filter3 = array('id_con_pago' => 2);
	     	 		 $rowradio= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valradio=$rowradio->row();
	     	 		 $radio=$valradio->valor;
	     	 		 $filter3 = array('id_con_pago' => 3);
	     	 		 $rowradio= $this->Sart_model->getdatos($filter3,'concepto_pago','');
	     	 		 $valtaller=$rowradio->row();
	     	 		 $taller=$valtaller->valor;
	     	 		 $data['vtaller'] = $taller;
	     	 		 $data['conradio'] = $radio+$adm-$taller;
	     	 		 $data['sinradio'] = $adm-$taller;*/

	     	 		break;
	     	 		case 'desvinculados':
	     	 		     $filter_adv='';
	     	 		     $filter='';
	     	 		     if(isset($fini)){
	     	 		     	$fini=date('Y-m-d',strtotime($fini));
	     	 		     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 		     	
	     	 		       $data['fini']=$fini;
	     	 		       $data['ffin']=$ffin;
	     	 		      	if($fini==$ffin){
	     	 		      		$filter_adv = array('adv1' => " date_format(fecha_retiro,'%Y-%m-%d') >= '$fini'  ");
	     	 		      	}else{
	     	 		         $filter_adv = array('adv1' => " date_format(fecha_retiro,'%Y-%m-%d') >= '$fini' and date_format(fecha_retiro,'%Y-%m-%d') <='$ffin' ");
	     	 		        }
	     	 		     	
	     	 		     }
	     	 			 $camposmov="*";
	     	 		 $orderby='id_movil asc';
	     	 		 $data['mov'] = $this->Sart_model->listar($filter,$filter_adv,'movil_desvinculados',$camposmov,$orderby) ; 
	     	 			break;
					case 'histovehi':
						$filter_adv='';
						$filter='';
						if(isset($fini)){
							$fini=date('Y-m-d',strtotime($fini));
							$ffin=date('Y-m-d',strtotime($ffin));
							
							$data['fini']=$fini;
							$data['ffin']=$ffin;
								if($fini==$ffin){
									$filter_adv = array('adv1' => " date_format(fechaMod,'%Y-%m-%d') >= '$fini'  ");
								}else{
							$filter_adv = array('adv1' => " date_format(fechaMod,'%Y-%m-%d') >= '$fini' and date_format(fechaMod,'%Y-%m-%d') <='$ffin' ");
							}
							
						}
						if(isset($id_movil)){
	     	 	      		$filter = array('id_movil' => $id_movil);
	     	 	      		$data['id_movil']=$id_movil;
	     	 	        }

	     	    		$join=array('propietario'=>'propietario.id_prop=historial_movil.id_prop','marca'=>'marca.id_marca=historial_movil.id_marca');
						$camposmov="*,concat_ws(' ',nombre,apellidos) as propietario";
						$orderby='id_movil asc';
						$data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'historial_movil','',$join,'left',$camposmov,$orderby);
						//echo $this->db->last_query();
					break;
					case 'histocondu':
						$filter_adv='';
						$filter='';
						if(isset($fini)){
							$fini=date('Y-m-d',strtotime($fini));
							$ffin=date('Y-m-d',strtotime($ffin));
							
							$data['fini']=$fini;
							$data['ffin']=$ffin;
								if($fini==$ffin){
									$filter_adv = array('adv1' => " date_format(fechaInicioTC,'%Y-%m-%d') >= '$fini'  ");
								}else{
							$filter_adv = array('adv1' => " date_format(fechaInicioTC,'%Y-%m-%d') >= '$fini' and date_format(fechaFin,'%Y-%m-%d') <='$ffin' ");
							}
							
						}
						if(isset($id_movil)){
	     	 	      		$filter = array('idMovilHisto' => $id_movil);
	     	 	      		$data['id_movil']=$id_movil;
	     	 	        }

						$join =array('documento'=>'documento.id_doc=historico_conductor.docReferencia','documentos_v'=>'documentos_v.id_docv=historico_conductor.docReferencia','conductor'=>'conductor.id_conductor=historico_conductor.idCondu');
						$camposmov="idMovilHisto,fechaInicioTC,fechaFin,numTarjeta,concat_ws(' ',documento,descripcion) as docref,id_conductor,codigo,concat_ws(' ',nombres,apellidos) as conductor";
						$orderby='idCondu asc,idMovilHisto asc';
						$data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'historico_conductor','',$join,'left',$camposmov,$orderby);
						//echo $this->db->last_query();
					break;
					case 'suspendemovil':
						$filter_adv='';
						$filter='';
						if(isset($fini)){
							$fini=date('Y-m-d',strtotime($fini));
							$ffin=date('Y-m-d',strtotime($ffin));
							
							$data['fini']=$fini;
							$data['ffin']=$ffin;
								if($fini==$ffin){
									$filter_adv = array('adv1' => " date_format(fecha_vigencia,'%Y-%m-%d') <= '$fini'  ");
								}else{
									$filter_adv = array('adv1' => " date_format(fecha_vigencia,'%Y-%m-%d') <= '$fini'");
								}
							
						}
						if(isset($id_movil)){
	     	 	      		$filter = array('id_movil' => $id_movil);
	     	 	      		$data['id_movil']=$id_movil;
	     	 	        }
						$filter['estado']='1';
						$join =array('documento'=>'documento.id_doc=tarjeta_control.id_doc_ref','documentos_v'=>'documentos_v.id_docv=tarjeta_control.id_doc_ref','conductor'=>'conductor.id_conductor=tarjeta_control.id_conductor');
						$camposmov="id_movil,fecha_vigencia,fecha_plazo_a,concat_ws(' ',documento,descripcion) as docref,codigo,concat_ws(' ',nombres,apellidos) as conductor";
						$orderby='id_movil asc';
						$data['mov'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'tarjeta_control','',$join,'left',$camposmov,$orderby);
						//echo $this->db->last_query();
					break;
	     	 }
	     	   $data['informe'] =$informe;
	           $this->load->view('sart/informes/informe',$data);
	      }//fin de funcion
	      	
 public function informes()
	     {
	     	if(isset($_COOKIE['user_ID'])){
	     		if(isset($_REQUEST['g'])){
	     			$grupo=$_REQUEST['g'];
	     			$data['grupov'] = $grupo;
	     		}else{
	     			$data['grupov'] = '';
	     		}
				$id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
				//$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc');
				$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc', 'acc_permiso.permiso' => '1');
				$filter_adv = '';
				$join=array('acc_opcion'=>'acc_permiso.id_opcion=acc_opcion.id_opcion','acc_group_user'=>'acc_group_user.id_group=acc_permiso.id_group');
				$camposmov='*';
				$orderby='';
				$data['panel'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'acc_permiso','',$join,'left',$camposmov,$orderby);

	     		/*$id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
	     		$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc');
	     	    $filter_adv = '';
	     	    $join='acc_permiso.id_opcion=acc_opcion.id_opcion';
	     	    $data['panel'] = $this->Sart_model->getdatosjoin($filter,'acc_permiso','acc_opcion',$join,'left'); */
	     		$data['app_ID'] = $_REQUEST['app_ID'];
	     		$data['grupo']= $this->Sart_model->getcampo('grupo','empresa');
	     		$this->load->view('sart/informes/vis_informes',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	     	}else{
	     		$this->index();
	     	}
	     }//fin de funcion
	      public	function repoexcel(){ //Se toman los datos de la ciudad de la bases de datos
	      	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

	     	
		$hoy=date('Y-m-d');
	     	  $filter='';
	     	  $filter_adv ='';
	     	  $data['id_movil']='';
	     	  $data['fini']='';
	     	  $data['ffin']='';
		  $data['grup']='';	
	     	  if(isset($id_movil) && $id_movil !=''){
	     	  		$filter = array('vehiculo.id_movil' => $id_movil);
	     	  		$data['id_movil']=$id_movil;
	     	  }
	     	  if(isset($_REQUEST['g'])){
	     	 	$grup=$_REQUEST['g'];
	     	 	$filter['vehiculo.grupo'] = $grup;
			$data['grup']=$grup;
	     	 }
	     	 if(isset($grupo)){
		     	 if($grupo!=''){
		     	 	$filter['trim(vehiculo.grupo)'] = $grupo;
				$data['grup']=$grupo;
		     	 }
		     }
	      	  $filter['estado']='1';
	     	 	     if(isset($fini) && $fini!=''){
	     	 	     	$fini=date('Y-m-d',strtotime($fini));
	     	 	     	$ffin=date('Y-m-d',strtotime($ffin));
	     	 	        $filter_adv = array('adv1' => " fecha_ven <= '$ffin' ");
	     	 	       $data['fini']=$fini;
	     	 	       $data['ffin']=$ffin;
	     	 	     }else{
	     	 	     	$ffin=$hoy;
	     	 	     	$filter_adv = array('adv1' => " fecha_ven <= '$hoy'  ");
	     	 	     }
	     	 		 if(isset($id_movil)){
	     	 		 	//$filter = array('vehiculo.id_movil' => $id_movil);
	     	 		 	$data['id_movil']=$id_movil;
	     	 		 }
	     	 		 $result=$this->Sart_model->getfilterdocs($filter,$filter_adv) ; 
	     	 		  $data['movildata'] = $result;
//print_r($result);
	     	 		 if($result)
		     	 		 foreach ($result ->result() as $value) {
		     	 		 	$filter3 = array('veh_doc.id_movil' => $value->id_movil);
		     	 		 	$data['docv'][$value->id_movil] = $this->Sart_model->datosvehi($filter3,$filter_adv,$ffin); 
		     	 		 }//fin foreach
	      		
	              $this->load->view('sart/informes/excel',$data);
	          }//fin de funcion muestra_recibos
		 public function muestra_recibos()
	     {
	     	          
	 	$idmov=$_REQUEST['id_movil'];
	     	$filter = array('id_movil' => $idmov);
	     	$filter_adv = '';
	     	$join='';
	     	$query=$this->Sart_model->getdatos($filter,'vehiculo','');
		$dataem=$query->row();
		$empresa=$dataem->grupo; 

		$filter = array('empresa' => $empresa,'motivo'=>'DI');
	     	$filter_adv = '';
	     	$join='';
	     	$queryd=$this->Sart_model->getdatos($filter,'consecutivo','');
		$datad=$queryd->row();
		$respu['diario']=$datad->consecutivo; 
		
		
		$filter = array('empresa' => $empresa,'motivo'=>'DE');
	     	$filter_adv = '';
	     	$join='';
	     	$queryd=$this->Sart_model->getdatos($filter,'consecutivo','');
		$datad=$queryd->row();
		$respu['desc']=$datad->consecutivo;

		
		$filter = array('empresa' => $empresa,'motivo'=>'T');
	     	$filter_adv = '';
	     	$join='';
	     	$queryd=$this->Sart_model->getdatos($filter,'consecutivo','');
		$datad=$queryd->row();
		$respu['taller']=$datad->consecutivo;


		 echo json_encode($respu);

	     }//fin de funcion
	     /////nuevas
	     public function confi()
	    {
	    	if(isset($_REQUEST['g'])){
				$grupo=$_REQUEST['g'];
				$data['gfijo'] = $grupo;
			}
	    	if(isset($_COOKIE['user_ID'])){
	    		$id_user=$_COOKIE['user_ID'];//$_REQUEST['v'];
	    		$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc');
	    	    $filter_adv = '';
	    	    $join='acc_permiso.id_opcion=acc_opcion.id_opcion';
	    	    $data['panel'] = $this->Sart_model->getdatosjoin($filter,'acc_permiso','acc_opcion',$join,'left'); 
	    		$data['app_ID'] = $_REQUEST['app_ID'];
	    		$this->db->where('id_con_pago=1');
	    		$datoadm=$this->db->get('concepto_pago')->row();
	    		$data['adm'] = $datoadm->valor;

	    		$this->db->where('id_con_pago=4');
	    		$datoapo=$this->db->get('concepto_pago')->row();
	    		$data['apo'] = $datoapo->valor;

	    		//$this->db->where('id_con_pago=1');
	    		$datof=$this->db->get('info_sistema')->row();
	    		$data['fblo'] = $datof->fbloqueo;

	    		$this->load->view('sart/configuracion/confi',$data); //llama la vista y le entrega como argumento la variable con la info de la base  de datos 
	    	}else{
	    		$this->index();
	    	}
	    }//fin de funcion 
	    function guarda_valor(){
	       foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	        $resp= $this->Sart_model->guarda_valor(); // Envio de los datos a la base de datos 
	       if($resp['guarda']=='ok'){
	       	 $respu['validacion'] = 'ok';
	         $respu['msn'] = 'Valores actualizados con Exito!!';
	        }else{
	           $respu['validacion'] = 'fail';
	           $respu['msn'] = $resp['motivo'];
	        }
	        echo json_encode($respu);
	      }	//fin de funcion
	       function asigna_taller(){
	       foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	        $resp= $this->Sart_model->asigna_dias(); // Envio de los datos a la base de datos 
	       if($resp['guarda']=='ok'){
	       	 $respu['validacion'] = 'ok';
	         $respu['msn'] = 'Asignacion de dias de taller Exitosa!!';
	        }else{
	           $respu['validacion'] = 'fail';
	           $respu['msn'] = $resp['motivo'];
	        }
	        echo json_encode($respu);
	      }	//fin de funcion
	       function asigna_fecha(){
	       foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	        $resp= $this->Sart_model->asigna_fecha(); // Envio de los datos a la base de datos 
	       if($resp['guarda']=='ok'){
	       	 $respu['validacion'] = 'ok';
	         $respu['msn'] = 'Asignacion de Fecha de Bloqueo Exitosa!!';
	        }else{
	           $respu['validacion'] = 'fail';
	           $respu['msn'] = $resp['motivo'];
	        }
	        echo json_encode($respu);
	      }	//fin de funcion

		function pdf(){
	       foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

			$filter=array('grupo'=>'TA');
			$rowemp= $this->Sart_model->getdatos($filter,'empresa','');
	    	$data['empresa']=$rowemp;
	    	//$filter2=array('concepto'=>;
	    	$rowtarifa= $this->db->get('tarifas');
	       // echo $this->db->last_query();
	    	$data['tarifas']=$rowtarifa;
	    	$this->db->where('id_tarjeta='.$ntarjeta);
	    	$this->db->join('conductor as b','a.id_conductor=b.id_conductor','left');
	    	$this->db->join('vehiculo as c','a.id_movil=c.id_movil','left');
	    	$this->db->join('con_doc as d','b.id_conductor=d.id_conductor','left');
	    	$this->db->join('documento as e','e.id_doc=e.id_doc','left');
	    	$this->db->join('marca as f','c.id_marca=f.id_marca','left');
	    	$datatarj= $this->db->get('tarjeta_control as a');
			//echo $this->db->last_query();
	    	$data['tarjeta']=$datatarj;

	    	foreach ($datatarj->result() as  $value) {
	    		//print_r($value);
	    	  $this->db->where('id_movil='.$value->id_movil);
	    	  $veh_doc= $this->db->get('veh_doc');
	    	  $data['veh_doc'][$value->id_movil]=$veh_doc;
	    	//  print_r($veh_doc);
	    	}
			 $id_user = $_COOKIE['user_ID'];//$_REQUEST['v'];
			$filter = array('id_usr' => $id_user);
			$data['user'] = $this->Sart_model->getdatos($filter,'acc_usuario',''); 
			//echo $this->db->last_query();
			//$html = $this->load->view('sart/pagos/tarjeta_control',$data);
			$html = $this->load->view('sart/pagos/tarjeta_control',$data,TRUE);
			$name="tarjeta.pdf";
			$this->sma->generate_pdf($html, $name,'I',NULL,NULL,$ntarjeta,NULL);//($html, $name,'I');
        }//fin funcion	
		function pdfUpdateTc(){
			foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

			 //$filter2=array('concepto'=>;
			 $rowtarifa= $this->db->get('tarifas');
			// echo $this->db->last_query();
			 $data['tarifas']=$rowtarifa;
			 $this->db->where('id_tarjeta='.$ntarjeta);
			 $datatarj= $this->db->get('tarjeta_control as a');
			 //echo $this->db->last_query();
			 $data['tarjeta']=$datatarj;

			  $id_user = $_COOKIE['user_ID'];//$_REQUEST['v'];
			 $filter = array('id_usr' => $id_user);
			 $data['user'] = $this->Sart_model->getdatos($filter,'acc_usuario',''); 
			 //echo $this->db->last_query();
			 //$html = $this->load->view('sart/pagos/tarjeta_control',$data);
			 $html = $this->load->view('sart/pagos/tarjeta_control_actu',$data,TRUE);
			 $name="tarjeta.pdf";
			 $this->sma->generate_pdf($html, $name,'I',NULL,NULL,NULL,NULL);//($html, $name,'I');
		 }//fin funcion	
/*********************NUEVAS FUNCIONALIDADES JAVELASQUEZ************/
	public function tarjetacontrol()
	  {
		/*$filter='';
		$filter2 =array('adv1'=>'operador <> ""');
		$tabla="pc_operador";
		$join = array('pc_configuracion' => " pc_configuracion.id_configuracion=pc_operador.id_rol");
		$orderby='nom_operador asc';
		$result=$this->Operacion_model->selfilter('',$filter,$filter2,$join,$tabla,$orderby,'');	
		$data['result'] = $result;*/
		if(isset($_REQUEST['g'])){
			$grupo=$_REQUEST['g'];
			$data['valg'] = $grupo;
		}else{
			$data['valg'] = '';
		}
		$this->load->view('sart/tarjetactrl/tarjetactrol',$data);
	  }
	public function  datatramita(){
     	//$tipo=$_GET['tipo'];
		$conf=array();
		$conf['aColumns2']=array('id_conductor', 'codigo', 'concat_ws(" ",nombres,apellidos) as conductor', 'telefono');
		$conf['aColumns']=array('id_conductor', 'codigo', 'concat_ws(" ",nombres,apellidos)', 'telefono');
		$conf['aColumns1']=array('id_conductor', 'codigo', 'conductor', 'telefono');
		$conf['aColumnsunion']='';//array('id_prop','concat_ws(" ",nombre,apellidos)','telefono');
		$conf['rows']=array('id_conductor', 'codigo','conductor','telefono');
		$conf['opt']=array('<button type="button" class="btn btn-success abreGesTc">Admin</button>&nbsp;<button type="button" class="btn btn-info ion-clipboard verhisto"></button>','<button type="button" class="btn btn-warning abresimit">Registrar</button>','<button type="button" class="btn btn-indigo abredocs">Formatos</button>');
		$conf['union']='';//" UNION SELECT id_prop,id_prop,concat_ws(' ',nombre,apellidos) as conductor,telefono FROM propietario where escondu='si'";
     	$filter2 ='';
	  	$filteradv='';
	  	$tabla="conductor";
	  	$join ='';
     	$output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
     	echo json_encode($output);
     }
	 public function  datamovil(){
		//$tipo=$_GET['tipo'];
	   $conf=array();
	   $conf['aColumns2']=array('id_movil', 'placa','b.id_prop as docprop', 'concat_ws(" ",b.nombre,b.apellidos) as propi','b.direccion as dirprop','b.telefono as telprop','b.email as emailprop','concat_ws(" ",c.nombre,c.apellidos) as admin','c.id_prop','c.telefono as teladmin','obs');
	   $conf['aColumns']=array('id_movil', 'placa','b.id_prop', 'concat_ws(" ",b.nombre,b.apellidos)','b.direccion','b.telefono','b.email','concat_ws(" ",c.nombre,c.apellidos)','c.telefono','obs');
	   $conf['aColumns1']=array('id_movil', 'placa','b.id_prop', 'concat_ws(" ",b.nombre,b.apellidos)','b.direccion','b.telefono','b.email','concat_ws(" ",c.nombre,c.apellidos)','c.telefono','obs');
	   $conf['aColumnsunion']='';
	   $conf['rows']=array('id_movil', 'placa','docprop','propi','dirprop','telprop','emailprop','admin','teladmin','obs');
	   $conf['opt']=array('<button type="button" class="btn btn-success abreGesTc">Admin</button>','<button type="button" class="btn btn-warning abresimit">Registrar</button>','<button type="button" class="btn btn-indigo abredocs">Formatos</button>');
	   $conf['union']='';
		$filter2 ='';
		$filteradv='';
		$tabla="vehiculo";
		$join =array('propietario as b'=>'b.id_prop=vehiculo.id_prop','propietario as c'=>'c.id_prop=vehiculo.managerid');
		$output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
		echo json_encode($output);
	}
	 public function editarcondu(){ //Se toman los datos de la ciudad de la bases de datos
	   $tipo=$_REQUEST['tipo'];

	  
	   $data['entidades']= $this->Sart_model->selectall('eps','entidad_salud');
	   if($tipo=='edit'){
		   $id=$_REQUEST['id_condu'];
		   $filter = array('id_conductor' => $id);
		   $filter_adv = '';
		   $data['prop'] = $this->Sart_model->getdatos($filter,'conductor',''); 
		   $orderby='';
	   	   $camposmov='*,datediff(fecha_vence,now()) as diff';
	   	   $join='documento.id_doc=con_doc.id_doc';
	  	   $data['docs'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'documento','con_doc',$join,'left',$camposmov,$orderby); 
		   //echo $this->db->last_query();
	   }else{
		   $data['prop'] = false;
		   $filter = '';
		   $filter_adv = '';
		   $data['docs'] = $this->Sart_model->getdatos($filter,'documento',''); 
	   }
	   $data['tipo']=$tipo;
	   $this->load->view('sart/movil/editacondu',$data);
	}//fin funcion
	public function grabarcondu(){
		$resp=$this->Sart_model->inserta_condu(); // Envio de los datos a la base de datos 
		 if($resp['guarda']== 'ok'){
			  $respu['validacion'] = 'ok';
			$respu['msn'] = ' Guardado con Exito!!';
		  }else{
			 $respu['validacion'] = 'fail';
			 $respu['msn'] = $resp['motivo'];
			 if($resp['motivo']=='found'){
				 $respu['idprop'] = $resp['idprop'];
			 }
		 }
		//======================================
	   echo json_encode($respu);
   }//fin funcion
   public function notif(){
		$this->db->where('control=1');
		$query = $this->db->get('novedad_diario');
		if($query->num_rows() > 0){
			$objnot=$query->row();
			$respu['validacion'] = 'ok';
			$respu['msn'] = $objnot->novedad;
		}else{
			$respu['validacion'] = 'fail';
		}
		echo json_encode($respu);
	}//fin funcion
	public function gesnotif(){
		$filter = '';
		$filter_adv = '';
		$data['noti'] = $this->Sart_model->selectall('control','novedad_diario'); 
		$this->load->view('sart/tarjetactrl/gesnoti',$data);
	}//fin funcion
	public function  datanoti(){
	   $conf=array();
	   $conf['aColumns2']=array('id_nov', 'novedad', 'pago_hasta_n');
	   $conf['aColumns']=array('id_nov', 'novedad', 'pago_hasta_n');
	   $conf['aColumns1']=array('id_nov', 'novedad', 'pago_hasta_n');
	   $conf['aColumnsunion']='';
	   $conf['rows']=array('id_nov', 'novedad','pago_hasta_n');
	   $conf['opt']=array('<button type="button" class="btn btn-indigo abredocs">Registrar</button>');
	   $conf['union']="";

	   $filter2 ='';// array('id_operacion' => $dataoper->id_configuracion,'ispadre'=>'si');
	   $filteradv='';//array('cond1'=>'id_estado <> '.$datastatus->id_configuracion);
	   $tabla="novedad_diario";
       $join ='';
	   $output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
	   echo json_encode($output);
	}
	public function tramitanoti(){
		$id=$_REQUEST['id'];
		$resp=$this->Sart_model->deletenotif($id);
		if($resp){
			$output['validacion'] = 'ok';
			$output['msn'] = 'Registrado con exito';
		}else{
			$output['validacion'] = 'fail';
			$output['msn'] = 'Error al registrarN';
		}
		echo json_encode($output);
	}//fin funcion
	public function gestionformato()
	  {
		$id=$_REQUEST['id'];
		$data['id']=$id;
		$this->load->view('sart/tarjetactrl/gesformatos',$data);
	  }//fin funcion
	function generanopension(){
		 $id=$_REQUEST['id'];
		 $formaid=$_REQUEST['formaid'];
		 $filter = array('id_conductor' => $id);
		 $data['condu'] = $this->Sart_model->getdatos($filter,'conductor','');
		 $filter = array('formato' => $formaid);
		 $data['form'] = $this->Sart_model->getdatos($filter,'formatos',''); 
		 $html = $this->load->view('sart/tarjetactrl/nopension.php',$data,TRUE);
		 $name=$formaid.".pdf";
		 $this->sma->generate_pdf($html, $name,'I');
	 }//fin funcion
	 function generaestadisticac(){
		$id=$_REQUEST['id'];
		$totexp='';
		$yearact=date('Y');
		$formaid=$_REQUEST['formaid'];
		$filter = array('id_conductor' => $id);
		$condu=$this->Sart_model->getdatos($filter,'conductor','');
		$data['condu'] = $condu;
		$filter = array('formato' => $formaid);
		$data['form'] = $this->Sart_model->getdatos($filter,'formatos',''); 
		$orderby='';
		$filter = array('id_conductor' => $id,'documento'=>'LICENCIA DE CONDUCCION');
		$filter_adv='';
		$camposmov='*';
		$join='documento.id_doc=con_doc.id_doc';
	    $data['docs'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'documento','con_doc',$join,'left',$camposmov,$orderby); 
		if($condu){
			$dataprop = $condu->row();
			$experiencia=$dataprop->experiencia_laboral;
			$difexp=$yearact-$experiencia;
			$totexp=$this->numtoletras($difexp);
        
		}

        $data['expe']=$totexp;
		$html = $this->load->view('sart/tarjetactrl/estadisticac.php',$data,TRUE);
		$name=$formaid.".pdf";
		$this->sma->generate_pdf($html, $name,'I');
	}//fin funcion
	public function ges_simit()
	  {
		$id=$_REQUEST['id'];
		$data['id']=$id;
		$this->load->view('sart/tarjetactrl/gessimit',$data);
	  }//fin funcion
	  public function  datasimit(){
		$id=$_REQUEST['id'];
		$conf=array();
		$conf['aColumns2']=array('id_simit', 'n_parte', 'cod_infraccion','valor','fecha_parte','fecha_pago','convenio','estado');
		$conf['aColumns']=array('id_simit', 'n_parte', 'cod_infraccion','valor','fecha_parte','fecha_pago','convenio','estado');
		$conf['aColumns1']=array('id_simit', 'n_parte', 'cod_infraccion','valor','fecha_parte','fecha_pago','convenio','estado');
		$conf['aColumnsunion']='';
		$conf['rows']=array('id_simit', 'n_parte', 'cod_infraccion','valor','fecha_parte','fecha_pago','convenio','estado');
		$conf['opt']=array('<button type="button" class="btn btn-indigo actSimit">Actualizar</button>');
		$conf['union']="";
 
		$filter2 = array('id_conductor' => $id);
		$filteradv='';//array('cond1'=>'id_estado <> '.$datastatus->id_configuracion);
		$tabla="simit";
		$join ='';
		$output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
		echo json_encode($output);
	 }//fin funcion
	 public function add_simit()
	  {
		$id=$_REQUEST['id'];
		$tipo=$_REQUEST['tipo'];
		$data['id']=$id;
		if($tipo=='edit'){
			$filter = array('id_simit' => $id);
			$data['simit'] = $this->Sart_model->getdatos($filter,'simit',''); 	       
		}else{
			$data['simit'] = false;
		}

		$data['tipo']=$tipo;
		$this->load->view('sart/tarjetactrl/registrasimit',$data);
	  }//fin funcion
	  public function grabarsimit(){
		$resp=$this->Sart_model->addModSimit(); // Envio de los datos a la base de datos 
		 if($resp['guarda']== 'ok'){
			 $respu['validacion'] = 'ok';
			 $respu['id'] = $resp['id'];
			 $respu['msn'] = ' Guardado con Exito!!';
		  }else{
			 $respu['validacion'] = 'fail';
			 $respu['msn'] = $resp['motivo'];
		 }
		//======================================
	   echo json_encode($respu);
   }//fin funcion
   public function gesTarjeta()
   {
	 $id=$_REQUEST['id'];
	 $data['id']=$id;
	 $this->load->view('sart/tarjetactrl/gesTarjeta',$data);
   }//fin funcion
   public function  datatarjeta(){
	 $id=$_REQUEST['id'];
	 $conf=array();
	 $conf['aColumns2']=array('id_tarjeta','concat_ws(" ",nombres,apellidos) as conductor', 'id_movil','fecha_plazo_a','case estado when 1 then "Abierta" else "Cerrada" end as estado','if(`fecha_plazo_a`<DATE_FORMAT(now(),"%Y/%m/%d"),"Vencido","Vigente") as est_vig');
	 $conf['aColumns']=array('id_tarjeta', 'concat_ws(" ",nombres,apellidos) as conductor','id_movil','fecha_plazo_a','case estado when 1 then "Abierta" else "Cerrada" end as estado','if(`fecha_plazo_a`<DATE_FORMAT(now(),"%Y/%m/%d"),"Vencido","Vigente") as est_vig');
	 $conf['aColumns1']=array('id_tarjeta','concat_ws(" ",nombres,apellidos) as conductor', 'id_movil','fecha_plazo_a','case estado when 1 then "Abierta" else "Cerrada" end as estado','if(`fecha_plazo_a`<DATE_FORMAT(now(),"%Y/%m/%d"),"Vencido","Vigente") as est_vig');
	 $conf['aColumnsunion']='';
	 $conf['rows']=array('id_tarjeta','conductor', 'id_movil','fecha_plazo_a','est_vig','estado');
	 $conf['opt']=array('<button type="button" class="btn btn-success ion-android-print printarjetaAct"></button>&nbsp;<button type="button" class="btn btn-indigo ion-android-print printarjeta"></button>&nbsp;<button type="button" class="btn btn-danger  cerrarTc">Cerrar</button>');
	 $conf['union']="";

	 $filter2 = array('tarjeta_control.id_conductor' => $id);
	 $filteradv='';//array('cond1'=>'id_estado <> '.$datastatus->id_configuracion);
	 $tabla="tarjeta_control";
	 $join =array('conductor'=>'tarjeta_control.id_conductor=conductor.id_conductor');
	 $output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
	 echo json_encode($output);
  }//fin funcion
   public function gesTc(){ 
	$tipo=$_REQUEST['tipo'];
	if($tipo=='edit'){
		$id=$_REQUEST['id'];
		$idTc=$_REQUEST['idTc'];
		$filter = array('id_tarjeta' => $idTc);
		$filter_adv = '';
		$dataTc=$this->Sart_model->getdatos($filter,'tarjeta_control','')->row(); 

		$filter = array('id_conductor' => $dataTc->id_conductor);
		$filter_adv = '';
		$data['prop'] = $this->Sart_model->getdatos($filter,'conductor',''); 
		$orderby='';
		$camposmov='*,datediff(fecha_vence,now()) as diff';
		$join='documento.id_doc=con_doc.id_doc';
		$data['docs'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'documento','con_doc',$join,'left',$camposmov,$orderby);  

		$filter = array('id_movil' => $dataTc->id_movil);
		$data['movil'] = $this->Sart_model->getdatos($filter,'vehiculo',''); 	 
		$filter = array('id_movil' => $dataTc->id_movil);
		$orderby='';
		$camposmov='*,datediff(fecha_ven,now()) as diff';
		$join='documentos_v.id_docv=veh_doc.id_documento';
		$data['docsv'] = $this->Sart_model->getdatosjoinfull($filter,'','documentos_v','veh_doc',$join,'left',$camposmov,$orderby);   
		$data['tc']=$dataTc;	       

	}else{
		$id=$_REQUEST['id'];
		$filter = array('id_conductor' => $id);
		$filter_adv = '';
		$data['prop'] = $this->Sart_model->getdatos($filter,'conductor',''); 
		$orderby='';
		$camposmov='*,datediff(fecha_vence,now()) as diff';
		$join='documento.id_doc=con_doc.id_doc';
		$data['docs'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'documento','con_doc',$join,'left',$camposmov,$orderby);  
		$data['docsv'] ='';
		 // echo $this->db->last_query();
		  //print_r($data['docs']);
	}
	$data['tipo']=$tipo;
	$data['idcondu']=$id;
	$this->load->view('sart/tarjetactrl/tarjeta',$data);
 }//fin funcion
 public function grabarTc(){
	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	$resp=$this->Sart_model->addModTc(); // Envio de los datos a la base de datos 
	$meses = array(1=>'ENERO',2=> 'FEBRERO',3=> 'MARZO',4=> 'ABRIL',5=> 'MAYO',6=> 'JUNIO',7=> 'JULIO',8=> 'AGOSTO', 9=>'SEPTIEMBRE',10=> 'OCTUBRE',"11"=> 'NOVIEMBRE',12=> 'DICIEMBRE'); 
	 if($resp['guarda']== 'ok'){
		 $respu['validacion'] = 'ok';
		 $respu['id'] = $resp['id'];
		 $respu['tipo'] = $resp['tipo'];
		 $respu['ntc'] = $resp['idTc'];
		 if(isset($idmovil)){
			$filter = array('id_movil' => $idmovil);
			$orderby='';
			$camposmov='';
			$join='vehiculo.id_prop=propietario.id_prop';
			$result=  $this->Sart_model->getdatosjoinfull($filter,'','vehiculo','propietario',$join,'left',$camposmov,$orderby); 
			if($result){
				$rowd 		= $result->row();
				$emailProp 	= $rowd->email;
				$nombre		= $rowd->nombre." ".$rowd->apellidos;
			 }else{
				$emailProp 	= "";
			 }
			// print_r($rowd);
			 $join='vehiculo.managerid=propietario.id_prop';
			 $resultmger=  $this->Sart_model->getdatosjoinfull($filter,'','vehiculo','propietario',$join,'left',$camposmov,$orderby); 
			//echo $this->db->last_query();
			 if($resultmger){
				$rowmger 		= $resultmger->row();
				$emailmgr 	= $rowmger->email;
				$nombremger		= $rowmger->nombre." ".$rowmger->apellidos;
			 }else{
				$emailmgr 	= "";
			 }
		 }else{
			$result=false; 
			$emailProp 	= "";
			$emailmgr 	= "";
			$msjemail="";

		 }
		 
		// echo $this->db->last_query();

		 
        // print_r($rowmger);
		 switch ($tipo) {
			case 'nuevo': 
				$objeto='Creación de tarjeta de Control Coomocart';
				$fplazoa=date('d-m-Y H:i:s',strtotime('+32 hour',strtotime($fechavig)));
				$fvigencia=date('Y-m-d',strtotime($fechavig));

				$diaplazo=date('d',strtotime($fplazoa));
				$diavigm=date('d',strtotime($fvigencia));
				$mesvigm=$meses[date('n',strtotime($fechavig))];
				$anioplazo=date('Y H:i:s',strtotime($fplazoa));
				$aniovigm=date('Y',strtotime($fvigencia));

				$fmuestraplazo=$diaplazo." de ".$mesvigm." del ".$anioplazo;
				$fmuestravi=$diavigm." de ".$mesvigm." del ".$aniovigm;


				$message="Estimado ".$nombre.", la cooperativa Coomocart le informa que se cre&oacute; la tarjeta de control <strong>#".$resp['idTc']."</strong> para el movil <strong>".$idmovil."</strong>, la cual tiene una vigencia hasta el d&iacute;a <strong>".$fmuestraplazo."</strong> y est&aacute; condicionada por el documento <strong>".$nomdocRef."</strong> que vence en la fecha <strong>".$fmuestravi."</strong><div>Si tiene alguna inquietud con gusto ser&aacute; atendida.</div>";
				if($emailProp != ""){
					$enviarCorreo = $this->sendMail($emailProp,$nombre,$message,$objeto);
				}
				if($emailmgr != ""){
					$enviarCorreo = $this->sendMail($emailmgr,$nombremger,$message,$objeto);
				}
				if($enviarCorreo){
					$msjemail='correo enviado';
				}else{
					$msjemail='correo NO enviado';
				}
		  break;
		  case 'edit':
				$objeto='Actualización de tarjeta de Control Coomocart';
				$fplazoa=date('d-m-Y H:i:s',strtotime('+32 hour',strtotime($fechavig)));
				$fvigencia=date('Y-m-d',strtotime($fechavig));

				$diaplazo=date('d',strtotime($fplazoa));
				$diavigm=date('d',strtotime($fvigencia));
				$mesvigm=$meses[date('n',strtotime($fechavig))];
				$anioplazo=date('Y H:i:s',strtotime($fplazoa));
				$aniovigm=date('Y',strtotime($fvigencia));

				$fmuestraplazo=$diaplazo." de ".$mesvigm." del ".$anioplazo;
				$fmuestravi=$diavigm." de ".$mesvigm." del ".$aniovigm;

				$message="Estimado ".$nombre.", la cooperativa Coomocart le informa que se actualiz&oacute; la tarjeta de control <strong>#".$tarjeta."</strong> para el movil <strong>".$idmovil."</strong>, la cual tiene una vigencia hasta el d&iacute;a <strong>".$fmuestraplazo."</strong> y est&aacute; condicionada por el documento <strong>".$nomdocRef."</strong> que vence en la fecha <strong>".$fmuestravi."</strong><div>Si tiene alguna inquietud con gusto ser&aacute; atendida.</div>";
				if($emailProp != ""){
					$enviarCorreo = $this->sendMail($emailProp,$nombre,$message,$objeto);
				}
				if($emailmgr != ""){
					$enviarCorreomger = $this->sendMail($emailmgr,$nombremger,$message,$objeto);
				}
				if($enviarCorreo){
					$msjemail='correo enviado';
				}else{
					$msjemail='correo NO enviado';
				}
		  break;
        }

		$respu['msn'] = ' Guardado con Exito!!, '.$msjemail;
	  }else{
		 $respu['validacion'] = 'fail';
		 $respu['msn'] = $resp['motivo'];
	 }
	//======================================
   echo json_encode($respu);
 }//fin funcion
 public function docsmovil(){
		$id=$_REQUEST['search'];
		$filter = array('id_movil' => $id);
		$data['movil'] = $this->Sart_model->getdatos($filter,'vehiculo',''); 	 
		$filter = array('id_movil' => $id);
		$orderby='';
		$camposmov='*,datediff(fecha_ven,now()) as diff';
		$join='documentos_v.id_docv=veh_doc.id_documento';
		$data['docsv'] = $this->Sart_model->getdatosjoinfull($filter,'','documentos_v','veh_doc',$join,'left',$camposmov,$orderby);   	       
		$this->load->view('sart/tarjetactrl/docsmovil',$data);
 }//fin funcion
 public function autoriza()
 {
   $data='';
   $this->load->view('sart/tarjetactrl/autoriza',$data);
 }//fin funcion
 public function validaFe(){
	$username = filter_var($_REQUEST['user'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
	    $password = filter_var($_REQUEST['contra'], FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES | FILTER_FLAG_ENCODE_AMP);
	$password=md5($password);
	################CONSULTA LOGIN########
    $fplazoa=date('Y-m-d H:i:s',strtotime($_REQUEST['fauto']));
	$filter = array('login' => $username, 'clave' => $password,'admin'=>1);

	$result = $this->Sart_model->getdatos($filter,'acc_usuario','');
	if($result){
		 $respu['validacion'] = 'ok';
		 $respu['fecha'] = $fplazoa;
		 $respu['msn'] = ' Guardado con Exito!!';
	  }else{
		 $respu['validacion'] = 'fail';
		 $respu['msn'] = 'Usuario no autorizado o datos incorrectos';
	 }
	//======================================
   echo json_encode($respu);
 }//fin funcion

 public function numtoletras($xcifra)
{ 
	$xarray = array(0 => "Cero",
	1 => "UN", "DOS", "TRES", "CUATRO", "CINCO", "SEIS", "SIETE", "OCHO", "NUEVE", 
	"DIEZ", "ONCE", "DOCE", "TRECE", "CATORCE", "QUINCE", "DIECISEIS", "DIECISIETE", "DIECIOCHO", "DIECINUEVE", 
	"VEINTI", 30 => "TREINTA", 40 => "CUARENTA", 50 => "CINCUENTA", 60 => "SESENTA", 70 => "SETENTA", 80 => "OCHENTA", 90 => "NOVENTA", 
	100 => "CIENTO", 200 => "DOSCIENTOS", 300 => "TRESCIENTOS", 400 => "CUATROCIENTOS", 500 => "QUINIENTOS", 600 => "SEISCIENTOS", 700 => "SETECIENTOS", 800 => "OCHOCIENTOS", 900 => "NOVECIENTOS"
	);
	//
	$xcifra = trim($xcifra);
	$xlength = strlen($xcifra);
	$xpos_punto = strpos($xcifra, ".");
	$xaux_int = $xcifra;
	$xdecimales = "00";
	if ($xpos_punto > 0)
	{
		$xaux_int = substr($xcifra, 0, $xpos_punto); // obtengo el entero de la cifra a covertir
		$xdecimales = substr($xcifra."00", $xpos_punto + 1, 2); // obtengo los valores decimales
	}

	$XAUX = str_pad($xaux_int, 18, " ", STR_PAD_LEFT); // ajusto la longitud de la cifra, para que sea divisible por centenas de miles (grupos de 6)
	$xcadena = "";
	for($xz = 0; $xz < 3; $xz++)
	{
		$xaux = substr($XAUX, $xz * 6, 6);
		$xi = 0; $xlimite = 6; // inicializo el contador de centenas xi y establezco el límite a 6 dígitos en la parte entera
		$xexit = true; // bandera para controlar el ciclo del While
		while ($xexit)
		{
			if ($xi == $xlimite) // si ya llegó al límite m&aacute;ximo de enteros
			{
				break; // termina el ciclo
			}

			$x3digitos = ($xlimite - $xi) * -1; // comienzo con los tres primeros digitos de la cifra, comenzando por la izquierda
			$xaux = substr($xaux, $x3digitos, abs($x3digitos)); // obtengo la centena (los tres dígitos)
			for ($xy = 1; $xy < 4; $xy++) // ciclo para revisar centenas, decenas y unidades, en ese orden
			{
				switch ($xy) 
				{
					case 1: // checa las centenas
						if (substr($xaux, 0, 3) < 100) // si el grupo de tres dígitos es menor a una centena ( < 99) no hace nada y pasa a revisar las decenas
						{
						}
						else
						{
							$xseek = $xarray[substr($xaux, 0, 3)]; // busco si la centena es número redondo (100, 200, 300, 400, etc..)
							if ($xseek)
							{
								$xsub = $this->subfijo($xaux); // devuelve el subfijo correspondiente (Millón, Millones, Mil o nada)
								if (substr($xaux, 0, 3) == 100) 
									$xcadena = " ".$xcadena." CIEN ".$xsub;
								else
									$xcadena = " ".$xcadena." ".$xseek." ".$xsub;
									$xy = 3; // la centena fue redonda, entonces termino el ciclo del for y ya no reviso decenas ni unidades
							}
							else // entra aquí si la centena no fue numero redondo (101, 253, 120, 980, etc.)
							{
								$xseek = $xarray[substr($xaux, 0, 1) * 100]; // toma el primer caracter de la centena y lo multiplica por cien y lo busca en el arreglo (para que busque 100,200,300, etc)
								$xcadena = " ".$xcadena." ".$xseek;
							} // ENDIF ($xseek)
						} // ENDIF (substr($xaux, 0, 3) < 100)
					break;
					case 2: // checa las decenas (con la misma lógica que las centenas)
						if (substr($xaux, 1, 2) < 10)
						{
						}
						else
						{
							$xseek = $xarray[substr($xaux, 1, 2)];
							if ($xseek)
							{
								$xsub = $this->subfijo($xaux);
								if (substr($xaux, 1, 2) == 20)
									$xcadena = " ".$xcadena." VEINTE ".$xsub;
								else
									$xcadena = " ".$xcadena." ".$xseek." ".$xsub;
									$xy = 3;
							}
							else
							{
								$xseek = $xarray[substr($xaux, 1, 1) * 10];
								if (substr($xaux, 1, 1) * 10 == 20)
									$xcadena = " ".$xcadena." ".$xseek;
								else
									$xcadena = " ".$xcadena." ".$xseek." Y ";
							} // ENDIF ($xseek)
						} // ENDIF (substr($xaux, 1, 2) < 10)
					break;
					case 3: // checa las unidades
						if (substr($xaux, 2, 1) < 1) // si la unidad es cero, ya no hace nada
						{
						}
						else
						{
							$xseek = $xarray[substr($xaux, 2, 1)]; // obtengo directamente el valor de la unidad (del uno al nueve)
							$xsub = $this->subfijo($xaux);
							$xcadena = " ".$xcadena." ".$xseek." ".$xsub;
						} // ENDIF (substr($xaux, 2, 1) < 1)
					break;
				} // END SWITCH
			} // END FOR
			$xi = $xi + 3;
		} // ENDDO

		if (substr($xcadena, -6, 6) == "MILLON") // si la cadena obtenida termina en MILLON, entonces le agrega al fina la palabra DE
		$xcadena.= " DE";

		if (substr($xcadena, -8, 8) == "MILLONES") // si la cadena obtenida en MILLONES, entoncea le agrega al fina la palabra DE
		$xcadena.= " DE";

		// ----------- esta línea la puedes cambiar de acuerdo a tus necesidades o a tu país -------
		if (trim($xaux) != "")
		{
			switch ($xz)
			{
			case 0:
				if (trim(substr($XAUX, $xz * 6, 6)) == "1")
					$xcadena.= "UN BILLON ";
				else
					$xcadena.= " BILLONES ";
			break;
			case 1:
				if (trim(substr($XAUX, $xz * 6, 6)) == "1")
					$xcadena.= "UN MILLON ";
				else
					$xcadena.= " MILLONES ";
			break;
			case 2:
				if ($xcifra < 1 )
				{
					$xcadena = "CERO PESOS ";
				}
				if ($xcifra >= 1 && $xcifra < 2)
				{
					$xcadena = "UN PESO  ";
				}
				if ($xcifra >= 2)
				{
					$xcadena.= " AÑOS "; // 
				}
			break;
			} // endswitch ($xz)
		} // ENDIF (trim($xaux) != "")
		// ------------------      en este caso, para México se usa esta leyenda     ----------------

		$xcadena = str_replace("VEINTI ", "VEINTI", $xcadena); // quito el espacio para el VEINTI, para que quede: VEINTICUATRO, VEINTIUN, VEINTIDOS, etc
		$xcadena = str_replace("  ", " ", $xcadena); // quito espacios dobles 
		$xcadena = str_replace("UN UN", "UN", $xcadena); // quito la duplicidad
		$xcadena = str_replace("  ", " ", $xcadena); // quito espacios dobles 
		$xcadena = str_replace("BILLON MILLONES", "BILLON", $xcadena); // corrigo la leyenda
		$xcadena = str_replace("BILLONES MILLONES", "BILLONES", $xcadena); // corrigo la leyenda


	} // ENDFOR ($xz)
	return trim($xcadena);
} // END FUNCTION


public function subfijo($xx)
{ // esta función regresa un subfijo para la cifra
	$xx = trim($xx);
	$xstrlen = strlen($xx);
	if ($xstrlen == 1 || $xstrlen == 2 || $xstrlen == 3)
		$xsub = "";
	//
	if ($xstrlen == 4 || $xstrlen == 5 || $xstrlen == 6)
		$xsub = "MIL";
	//
	return $xsub;
} // END FUNCTION
public function docsvencidos(){
	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}	 
	$hoy=date('Y-m-d', strtotime('+10 days'));
	$hoyEps=date('Y-m-d', strtotime('+2 days'));
	$data['docsv']=array();
	$filter ='';// array('id_movil' => $id);
	$filter_adv=array('adv1'=>" fecha_ven <= '$hoy' ");
	$orderby='id_movil asc';
	$camposmov='veh_doc.id_movil,descripcion,fecha_ven';
	$join='documentos_v.id_docv=veh_doc.id_documento';
	$data['docsvehi']= $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'documentos_v','veh_doc',$join,'left',$camposmov,$orderby); 
	/*if($vencivehi){
		array_push($data['docsvehi'],$vencivehi->result());
	} */ 
	
	$filter =array('ispensionado'=>'no','obligatorio'=>'si');
	$filter_adv=array('adv1'=>" fecha_vence <= '$hoyEps' and fecha_vence <> '0000-00-00'");
	$orderby='con_doc.id_conductor asc';
	$camposmov='concat_ws(" ",nombres,apellidos) as id_movil,documento,fecha_vence';
	$join=array('con_doc'=>'con_doc.id_conductor=conductor.id_conductor','documento'=>'documento.id_doc=con_doc.id_doc');
	$data['docsv'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'conductor','con_doc',$join,'left',$camposmov,$orderby);
	/*if($vencidoscond){
		array_push($data['docsv'],$vencidoscond);
	}*/

	$filter =array('ispensionado'=>'si','documento'=>'LICENCIA DE CONDUCCION');
	$filter_adv=array('adv1'=>" fecha_vence <= '$hoy' ");
	$orderby='con_doc.id_conductor asc';
	$camposmov='concat_ws(" ",nombres,apellidos) as id_movil,documento,fecha_vence';
	$join=array('con_doc'=>'con_doc.id_conductor=conductor.id_conductor','documento'=>'documento.id_doc=con_doc.id_doc');
	$data['doccondu'] = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'conductor','con_doc',$join,'left',$camposmov,$orderby); 
   // if($datapensi){
		//array_push($data['docsv'],$datapensi);
	//}
	$this->load->view('sart/tarjetactrl/docsvencidos',$data);

}
public function notifVencidos(){
	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}	
	$errorenvioM=0;
	$enviarCorreo ='';
	$hoy=date('Y-m-d', strtotime('+10 days'));
	$data['docsv']=array();
	$filter ='';
	$filter_adv=array('adv1'=>" fecha_ven <= '$hoy' ");
	
	$orderby='id_movil asc';
	$camposmov='distinct veh_doc.id_movil,concat_ws(" ",nombre,apellidos)as propi,email';
	$join=array('vehiculo'=>'vehiculo.id_movil=veh_doc.id_movil','propietario'=>'propietario.id_prop=vehiculo.id_prop');
	$vencivehi= $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'veh_doc','',$join,'',$camposmov,$orderby); 
	if($vencivehi){
		foreach($vencivehi->result() as $docvehi){
			$mensajeven='Estimado <strong>'.$docvehi->propi.'</strong> a continuaci&oacute;n se relacionan los documentos proximos a vencer o vencidos del movil <strong> '.$docvehi->id_movil.'</strong> <ul>';
			$documentovenVh='';
			$filter =array('id_movil' => $docvehi->id_movil);
			$filter_adv=array('adv1'=>" fecha_ven <= '$hoy' ");
			$orderby='veh_doc.id_movil asc';
			$camposmov='veh_doc.id_movil,descripcion,fecha_ven';
			$join='documentos_v.id_docv=veh_doc.id_documento';
			$docuvehi=$this->Sart_model->getdatosjoinfull($filter,$filter_adv,'documentos_v','veh_doc',$join,'left',$camposmov,$orderby); 
			if($docuvehi){
				foreach($docuvehi->result() as $valudoc){
					$documentovenVh.='<li>'.$valudoc->descripcion.'</li>';
				}
			}
			$mensajeven.=$documentovenVh."</ul> Por favor actualizarlos lo antes posible y reporte la actualizacion a la empresa Coomocart</br>";


			//*****/
			$filter =array('documento'=>'LICENCIA DE CONDUCCION','tarjeta_control.estado'=>'1','tarjeta_control.id_movil'=>$docvehi->id_movil);
			$filter_adv=array('adv1'=>" fecha_vence <= '$hoy' ");
			$orderby='con_doc.id_conductor asc';
			$camposmov='distinct con_doc.id_conductor,concat_ws(" ",nombres,apellidos) as conductor,documento,fecha_vence,emailc';
			$join=array('con_doc'=>'con_doc.id_conductor=conductor.id_conductor','documento'=>'documento.id_doc=con_doc.id_doc','tarjeta_control'=>'tarjeta_control.id_conductor=conductor.id_conductor');
			$condudocsP = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'conductor','con_doc',$join,'left',$camposmov,$orderby);

			if($condudocsP){
				$mensajeven.='<div>Adicionalmente le informamos que la <strong>licencia de conduccion</strong> del conductor: <ul>';
				foreach($condudocsP->result() as $docConduP){
					//$condudocs->row();
					$mensajeven.='<li><strong>'.$docConduP->conductor.'</strong></li>';
				}
				$mensajeven.='</ul>esta proxima a vencer o vencida </div>';
			}
			
			
			/***/

			if($docvehi->email != ""){
				$enviarCorreo = $this->sendMail($docvehi->email,$docvehi->propi,$mensajeven,"¡ Documentos de movil Próximos a Vencer !! -- Coomocart");
			}
			if(!$enviarCorreo){
				$errorenvioM++;
			}
		}
	}

	$filter =array('documento'=>'LICENCIA DE CONDUCCION','tarjeta_control.estado'=>'1');
	$filter_adv=array('adv1'=>" fecha_vence <= '$hoy' ");
	$orderby='con_doc.id_conductor asc';
	$camposmov='distinct con_doc.id_conductor,concat_ws(" ",nombres,apellidos) as conductor,documento,fecha_vence,emailc';
	$join=array('con_doc'=>'con_doc.id_conductor=conductor.id_conductor','documento'=>'documento.id_doc=con_doc.id_doc','tarjeta_control'=>'tarjeta_control.id_conductor=conductor.id_conductor');
	$condudocs = $this->Sart_model->getdatosjoinfull($filter,$filter_adv,'conductor','con_doc',$join,'left',$camposmov,$orderby);
	$mensajevenCond='';
	$errorenvioC=0;
	if($condudocs){
		foreach($condudocs->result() as $docCondu){
	       $documentovenVh='';

			$mensajevenCond='Estimado <strong> '.$docCondu->conductor.'</strong>  a continuaci&oacute;n se relacionan los documentos proximos a vencer o vencidos <ul>';
			
			$documentovenVh.='<li>'.$docCondu->documento.'</li>';
			$mensajevenCond.=$documentovenVh."</ul> Por favor actualizarlos lo antes posible y reporte la actualizacion a la empresa Coomocart";

			if($docCondu->emailc != ""){
				$enviarCorreo = $this->sendMail($docCondu->emailc,$docCondu->conductor,$mensajevenCond,"¡ Documentos Próximos a Vencer !! -- Coomocart");
			}
			if(!$enviarCorreo){
				$errorenvioC++;
			}
		}
	}

		$respu['validacion'] = 'ok';
		$respu['msn'] = ' Correos enviados !!';
		$data2 =array(
			'fecha'        => date('Y-m-d')
	    ); 

	   $queries=$this->db->insert('noficacionVencidos',$data2);


	echo json_encode($respu);

}//fin funcion
public function gesHistoCondu(){
	$filter = '';
	$filter_adv = '';
	$data['noti'] = $this->Sart_model->selectall('control','novedad_diario'); 
	$this->load->view('sart/tarjetactrl/gesHistoC',$data);
}//fin funcion
public function  dataHistoCondu(){
   $conf=array();
   $conf['aColumns2']=array('idMovilHisto', 'idMovilHisto', 'fechaInicioTC','fechaFin','numTarjeta','concat_ws(" ",documento,descripcion) as docref');
   $conf['aColumns']=array('idMovilHisto', 'idMovilHisto', 'fechaInicioTC','fechaFin','numTarjeta','concat_ws(" ",documento,descripcion)');
   $conf['aColumns1']=array('idMovilHisto', 'idMovilHisto', 'fechaInicioTC','fechaFin','numTarjeta','concat_ws(" ",documento,descripcion)');
   $conf['aColumnsunion']='';
   $conf['rows']=array('idMovilHisto', 'idMovilHisto','fechaInicioTC','fechaFin','numTarjeta','docref');
   $conf['opt']='';
   $conf['union']="";

   $filter2 ='';// array('id_operacion' => $dataoper->id_configuracion,'ispadre'=>'si');
   $filteradv='';//array('cond1'=>'id_estado <> '.$datastatus->id_configuracion);
   $tabla="historico_conductor";
   $join =array('documento'=>'documento.id_doc=historico_conductor.docReferencia','documentos_v'=>'documentos_v.id_docv=historico_conductor.docReferencia');
   $output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
   echo json_encode($output);
}
public function  dataprop(){
	//$id=$_REQUEST['id'];
	$conf=array();
	$conf['aColumns2']=array('id_prop', 'concat_ws(" ",nombre,apellidos) as prop', 'direccion','telefono','email');
	$conf['aColumns']=array('id_prop', 'concat_ws(" ",nombre,apellidos)', 'direccion','telefono','email');
	$conf['aColumns1']=array('id_prop', 'concat_ws(" ",nombre,apellidos)', 'direccion','telefono','email');
	$conf['aColumnsunion']='';
	$conf['rows']=array('id_prop', 'prop', 'direccion','telefono','email');
	$conf['opt']='';
	$conf['union']="";

	$filter2 = '';//array('id_prop' => $id);
	$filteradv='';//array('cond1'=>'id_estado <> '.$datastatus->id_configuracion);
	$tabla="propietario";
	$join ='';
	$output=$this->Sart_model->GetData($filter2,$filteradv,$join,$tabla,$conf);
	echo json_encode($output);
 }//fin funcion
/************* Nuevas Funcionalidades jcano *******************/
public function users(){

	if(isset($_COOKIE['user_ID'])){
		 
		 if(isset($_REQUEST['g'])){
			 $grupo=$_REQUEST['g'];
			 $data['grupov'] = $grupo;
		 }else{
			 $data['grupov'] = '';
		 }

		 $id_user = $_COOKIE['user_ID'];//$_REQUEST['v'];
		 $filter = array('acc_usuario.estado' => 'activo');
		 $filter_adv = '';
		 $join = '';
		 $data['app_ID'] = $_REQUEST['app_ID'];
		 $data['grupo']= $this->Sart_model->getcampo('grupo','empresa');

		$join='acc_usuario.id_group=acc_group_user.id_group';
		$data['usuario'] = $this->Sart_model->getdatosjoin($filter,'acc_usuario','acc_group_user',$join,'left');

		$appID=$_REQUEST['app_ID'];
		$filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc','acc_permiso.id_opcion' => $appID);
		$filter_adv = '';
		$join2='acc_permiso.id_opcion=acc_opcion.id_opcion';
		$data['permisos'] = $this->Sart_model->getdatosjoin($filter,'acc_permiso','acc_opcion',$join2,'left');

		$data['groupusr']= $this->Sart_model->selectall('group_name','acc_group_user');

		 $this->load->view('sart/usuario/usuario',$data);
	 }else{
		 $this->index();
	 }  	    	
}

function add_edit_usr(){ //Se toman los datos de la ciudad de la bases de datos

   $tipo=$_REQUEST['tipo'];
   $menu=$_REQUEST['menu'];
   $data['menu'] = $menu;

   if($tipo=='edit'){
	   $id = $_REQUEST['id_usr'];
	   $filter = array('id_usr' => $id);
	   $filter_adv = '';
	   $data['user'] = $this->Sart_model->getdatos($filter,'acc_usuario',''); 	       
   }else{
	   $data['user'] = false;
   }

   $data['tipodoc']= $this->Sart_model->selectall('tipo_doc','tipo_doc');
   $data['groupusr']= $this->Sart_model->selectall('group_name','acc_group_user');

   $data['tipo'] = $tipo;

   $this->load->view('sart/usuario/add_edit_usr',$data);
}

function saveuser(){
	 
	$resp=$this->Sart_model->save_edit_user(); // Envio de los datos a la base de datos 
	
	if($resp['guarda']== 'ok'){
		
		$respu['validacion'] = 'ok';
		 $respu['msn'] = ' Guardado con Exito!!';

	}else{
		  
		  $respu['validacion'] = 'fail';
		  $respu['msn'] = $resp['motivo'];
		  
		  if($resp['motivo']=='found'){
			  $respu['idprop'] = $resp['idprop'];
		  }

	}
				  //======================================
		echo json_encode($respu);
}

function savegroup(){
	 
	$resp=$this->Sart_model->save_edit_groups(); // Envio de los datos a la base de datos 
	
	if($resp['guarda']== 'ok'){
		
		$respu['validacion'] = 'ok';
		 $respu['msn'] = ' Guardado con Exito!!';

	}else{
		  
		  $respu['validacion'] = 'fail';
		  $respu['msn'] = $resp['motivo'];

	}
				  //======================================
		echo json_encode($respu);
}

function usermodal(){ 

	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	//$tipo=$_REQUEST['tipo'];

	   //SELECT * FROM `acc_usuario` U JOIN acc_permiso P ON U.id_usr = P.id_usr JOIN acc_opcion O ON P.id_opcion = O.id_opcion JOIN acc_grupo G ON O.id_grupo = G.id_grupo WHERE O.tipo = 'mvc'

	   //SELECT * FROM `acc_usuario` U JOIN acc_permiso P ON U.id_usr = P.id_usr 
	   //JOIN acc_opcion O ON P.id_opcion = O.id_opcion 
	   //JOIN acc_grupo G ON O.id_grupo = G.id_grupo 
	   //WHERE O.tipo = 'mvc' and U.id_usr = 1
	$this->db->group_by("opcion");
	$this->db->where('O.tipo="mvc"');
	$this->db->where('U.id_group='.$id_group);
	$this->db->join('acc_permiso as P','U.id_group = P.id_group','JOIN');
	$this->db->join('acc_opcion as O','P.id_opcion = O.id_opcion','JOIN');
	$this->db->join('acc_grupo as G','O.id_grupo = G.id_grupo','JOIN');
	$this->db->order_by("O.opcion", "ASC"); 
	$dataPriv= $this->db->get('acc_usuario as U');

	$data['app_ID'] = $app_ID;
	$data['permisos']=$dataPriv;

	//echo $this->db->last_query();

	   $this->load->view('sart/usuario/vis_add_edit_privileges',$data);
}

function changestatus(){
	 
	$resp=$this->Sart_model->save_change_status(); // Envio de los datos a la base de datos 
	
	if($resp['guarda'] == 'ok'){
		
		$respu['validacion'] = 'ok';
		 $respu['msn'] = ' Permiso cambiado !!';

	}else{
		  
		  $respu['validacion'] = 'fail';
		  $respu['msn'] = $resp['motivo'];
		  
		  if($resp['motivo']=='found'){
			  $respu['idprop'] = $resp['idprop'];
		  }

	}
				  //======================================
	//echo $resp['guarda']." - ".$respu['validacion']." - ".$respu['msn'];
	echo json_encode($respu);
}

function changepriv(){
	 
	$resp=$this->Sart_model->save_change_priv(); // Envio de los datos a la base de datos 
	
	if($resp['guarda'] == 'ok'){
		
		$respu['validacion'] = 'ok';
		 $respu['msn'] = ' Permiso cambiado !!';

	}else{
		  
		  $respu['validacion'] = 'fail';
		  $respu['msn'] = $resp['motivo'];
		  
		  if($resp['motivo']=='found'){
			  $respu['idprop'] = $resp['idprop'];
		  }

	}
				  //======================================
	//echo $resp['guarda']." - ".$respu['validacion']." - ".$respu['msn'];
	echo json_encode($respu);
}

public function grabardelusr(){
	  
	  $resp=$this->Sart_model->borrar_usr(); // Envio de los datos a la base de datos 

	   if($resp['guarda']== 'ok'){
			$respu['validacion'] = 'ok';
		  $respu['msn'] = 'Eliminado con Exito!!';
	}else{
	   $respu['validacion'] = 'fail';
	   $respu['msn'] = $resp['motivo'];
	   }

  //======================================
	 echo json_encode($respu);
}

function add_edit_firma(){ //Se toman los datos de la ciudad de la bases de datos

   $tipo=$_REQUEST['tipo'];
   $menu=$_REQUEST['menu'];
   $data['menu'] = $menu;

   if($tipo=='edit'){
	   $id = $_REQUEST['id_usr'];
	   $filter = array('id_usr' => $id);
	   $filter_adv = '';
	   $data['user'] = $this->Sart_model->getdatos($filter,'acc_usuario',''); 	       
   }else{
	   $data['user'] = false;
   }

   $data['tipodoc']= $this->Sart_model->selectall('tipo_doc','tipo_doc');

   $data['tipo'] = $tipo;

   $this->load->view('sart/usuario/add_edit_firma',$data);
}

public function addeditsign()
{	
	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}

	$config['upload_path'] 		= FCPATH . "uploads/firmas/";
	$config['allowed_types'] 	= 'gif|jpg|png|jpeg';
	$config['max_size'] 		= 2048;

	$this->load->library('upload', $config);

	if (!$this->upload->do_upload('firma')) { #Aquí hace referencia a "firma", del FormData
		
		$respu['validacion'] = 'fail';
		$respu['msn'] = $this->upload->display_errors();

	}else{

		//echo "id"+$id_usr;
		$resp=$this->Sart_model->save_sign(); // Envio de los datos a la base de datos 
	
		if($resp['guarda']== 'ok'){
			
			$respu['validacion'] = 'ok';
			 $respu['msn'] = ' Firma registrada!!';

		}else{
			  
			  $respu['validacion'] = 'fail';
			  $respu['msn'] = $resp['motivo'];

		}

	}

	echo json_encode($respu);
}

public function delete_file(){

	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	  
	  $resp=$this->Sart_model->borrar_file(); // Envio de los datos a la base de datos 

	   if($resp['elimina']== 'ok'){
			$respu['validacion'] = 'ok';
		  $respu['msn'] = 'Firma eliminada!!';
	}else{
	   $respu['validacion'] = 'fail';
	   $respu['msn'] = $resp['motivo'];
	   }

  //======================================
	 echo json_encode($respu);
}

	function add_edit_groups(){ //Se toman los datos de la ciudad de la bases de datos

	   $tipo=$_REQUEST['tipo'];
	   $menu=$_REQUEST['menu'];
	   $data['menu'] = $menu;

	   if($tipo=='edit'){
		   $id = $_REQUEST['id_group'];
		   $filter = array('id_group' => $id);
		   $filter_adv = '';
		   $data['group'] = $this->Sart_model->getdatos($filter,'acc_group_user',''); 	       
	   }else{
		   $data['group'] = false;
	   }

	   //$data['tipodoc']= $this->Sart_model->selectall('tipo_doc','tipo_doc');
	   //$data['groupusr']= $this->Sart_model->selectall('group_name','acc_group_user');

	   $data['tipo'] = $tipo;

	   $this->load->view('sart/usuario/add_edit_groups',$data);
	}

	public function planilla(){

    	if(isset($_COOKIE['user_ID'])){
     		
     		if(isset($_REQUEST['g'])){
     			$grupo=$_REQUEST['g'];
     			$data['grupov'] = $grupo;
     		}else{
     			$data['grupov'] = '';
     		}

     		$id_user = $_COOKIE['user_ID'];
     		//$filter = array('acc_usuario.id_usr' => $id_user,'tipo' => 'mvc');
     		$filter = '';
     	    $filter_adv = '';
     	    $join = '';
     		$data['app_ID'] = $_REQUEST['app_ID'];
     		$data['grupo']= $this->Sart_model->getcampo('grupo','empresa');

     		$this->db->order_by("cartera.id", "ASC"); 
     		$this->db->order_by("cartera.cartera", "ASC"); 
     		$this->db->order_by("cartera.documento", "ASC"); 
     		$this->db->order_by("cartera.movil", "ASC"); 
	    	$data['planilla'] = $this->db->get('cartera');

	       	$appID=$_REQUEST['app_ID'];
	        $filter = array('acc_permiso.id_usr' => $id_user,'tipo' => 'mvc','acc_permiso.id_opcion' => $appID);
	       	$filter_adv = '';
	       	$join=array('acc_opcion'=>'acc_permiso.id_opcion=acc_opcion.id_opcion');
	       	$data['permisos'] = $this->Sart_model->getdatosjoin($filter,'acc_permiso','acc_opcion',$join,'left');


     		$this->load->view('sart/planilla/planilla',$data);
     	}else{
     		$this->index();
     	}  	    	
    }

    function add_edit_planilla(){ //Se toman los datos de la ciudad de la bases de datos

       $tipo=$_REQUEST['tipo'];
       $menu=$_REQUEST['menu'];
       $data['menu'] = $menu;

       $this->load->view('sart/planilla/add_edit_planilla',$data);
    }

    public function addplan()
    {	    	
    	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
        $subject = "Resumen de saldos Coomocart";
    	if(isset($_FILES["planilla"]["name"])){

    		$tabla = "cartera";
    		$resp = $this->Sart_model->vaciar_tabla($tabla);
			//echo "resp: ".$resp['guarda'];		
			
			// Valida que la información de la tabla haya sido borrada
			if($resp['truncate']== 'ok'){				

				$path = $_FILES["planilla"]["tmp_name"];
				$object = PHPExcel_IOFactory::load($path);
				
				//echo $_FILES["planilla"]["name"];

				foreach($object->getWorksheetIterator() as $worksheet){
					
					$highestRow = $worksheet->getHighestRow();
					$highestColumn = $worksheet->getHighestColumn();

					$hoja = $worksheet->getTitle();

					$inidate = '';
					$findate = '';
					//echo strtolower($hoja)."<br/>";

					for($row=2; $row<=$highestRow; $row++){					

						//echo strtolower($hoja)."<br/>";

						if(strtolower($hoja)=="mercancia"){

							$tipo 			= $worksheet->getCellByColumnAndRow(0, $row)->getValue();
							$numero 		= $worksheet->getCellByColumnAndRow(1, $row)->getValue();
							$fecha 			= $worksheet->getCellByColumnAndRow(2, $row)->getValue();
							$plazo 			= $worksheet->getCellByColumnAndRow(3, $row)->getValue();
							$vencimiento 	= $worksheet->getCellByColumnAndRow(4, $row)->getValue();

							$documento 		= $worksheet->getCellByColumnAndRow(5, $row)->getValue();
							$nombre 		= $worksheet->getCellByColumnAndRow(6, $row)->getValue();
							$movil 			= $worksheet->getCellByColumnAndRow(7, $row)->getValue();
							$mora 			= $worksheet->getCellByColumnAndRow(8, $row)->getValue();
							$valor 			= $worksheet->getCellByColumnAndRow(9, $row)->getValue();

							$abono 			= $worksheet->getCellByColumnAndRow(10, $row)->getValue();
							$saldo 			= $worksheet->getCellByColumnAndRow(11, $row)->getValue();

							$cartera 		= $hoja;

							$inidate = \PHPExcel_Style_NumberFormat::toFormattedString($fecha, 'DD/MM/YYYY');
							$findate = \PHPExcel_Style_NumberFormat::toFormattedString($vencimiento, 'DD/MM/YYYY');

							$date1 = date("d-m-Y",strtotime($inidate));
							$date2 = date("d-m-Y",strtotime($findate));
							$diff = abs(strtotime($date2) - strtotime($date1));

							//$mora 	= 	floor($diff / (60 * 60 * 24));
							
							if($saldo == "" || !isset($saldo)){
								$saldo = 0;
							}

							if($valor == "" || !isset($valor)){
								$valor = 0;
							}

							if($abono == "" || !isset($abono)){
								$abono = 0;
							}

							$message = "Apreciado Asociado(a) <b>".$nombre."</b>
					        			<br/><br/>
					        			A continuación, le estamos enviando el resumen de saldos de las cuentas que tiene con la entidad a la fecha.
					        			<br/>        			
					        			Factura No: ".$numero." por concepto de ".strtoupper($cartera)." y valor de $".number_format($valor)." del móvil ".$movil." con fecha del ".$inidate." y vencimiento ".$findate.". La cual presenta ".abs($mora)." d&iacute;a(s) de mora. A la fecha ha realizado abonos por $".number_format($abono)." pesos MCTE, con un saldo total de ".number_format($saldo)."
					        			<br/><br/>
					        			Gracias por contar con nosotros.
					        			<br/><br/>
					        			Correo generado autom&aacute;ticamente, por favor no responder.
					        			";

							/*$filter = array('id_prop' => $id_prop);
							$result = $this->Sart_model->getdatos($filter,'propietario','');

					        if($result){
					            
					            $row = $result->row(); 
					            
					            if($row->email != ""){
					            	$emailProp = $row->email;	
					            }else{
					            	$emailProp = "";	
					            }
						        
					        }else{
					        	$emailProp = "";
					        }*/					        

						}else if(strtolower($hoja)=="soat"){

							$tipo 			= $worksheet->getCellByColumnAndRow(0, $row)->getValue();
							$numero 		= $worksheet->getCellByColumnAndRow(1, $row)->getValue();
							$documento 		= $worksheet->getCellByColumnAndRow(2, $row)->getValue();
							$nombre 		= $worksheet->getCellByColumnAndRow(3, $row)->getValue();
							$movil 			= $worksheet->getCellByColumnAndRow(4, $row)->getValue();
							$fecha 			= $worksheet->getCellByColumnAndRow(5, $row)->getValue();
							$plazo 			= $worksheet->getCellByColumnAndRow(6, $row)->getValue();
							$vencimiento 	= $worksheet->getCellByColumnAndRow(7, $row)->getValue();
							$mora 			= $worksheet->getCellByColumnAndRow(8, $row)->getValue();
							$valor 			= $worksheet->getCellByColumnAndRow(9, $row)->getValue();
							$abono 			= $worksheet->getCellByColumnAndRow(10, $row)->getValue();
							$saldo 			= $worksheet->getCellByColumnAndRow(11, $row)->getValue();
							$cartera 		= $hoja;

							$inidate = \PHPExcel_Style_NumberFormat::toFormattedString($fecha, 'DD/MM/YYYY');
							$findate = \PHPExcel_Style_NumberFormat::toFormattedString($vencimiento, 'DD/MM/YYYY');

							$date1 = date("d-m-Y",strtotime($inidate));
							$date2 = date("d-m-Y",strtotime($findate));
							$diff = abs(strtotime($date2) - strtotime($date1));							

							//$mora 	= 	floor($diff / (60 * 60 * 24));
							
							if($saldo == "" || !isset($saldo)){
								$saldo = 0;
							}

							if($valor == "" || !isset($valor)){
								$valor = 0;
							}

							if($abono == "" || !isset($abono)){
								$abono = 0;
							}

							$message = "Apreciado Asociado(a) <b>".$nombre."</b>
					        			<br/><br/>
					        			A continuación, le estamos enviando el resumen de saldos de las cuentas que tiene con la entidad a la fecha.
					        			<br/>        			
					        			Factura No: ".$numero." por concepto de ".strtoupper($cartera)." y valor de $".number_format($valor)." del móvil ".$movil." con fecha del ".$inidate." y vencimiento ".$findate.". La cual presenta ".abs($mora)." d&iacute;a(s) de mora. A la fecha ha realizado abonos por $".number_format($abono)." pesos MCTE, con un saldo total de $".number_format($saldo)."
					        			<br/>
					        			Gracias por contar con nosotros.
					        			<br/><br/>
					        			Correo generado autom&aacute;ticamente, por favor no responder.
					        			";

						}else if(strtolower($hoja)=="diarios"){

							$tipo 			= '';
							$numero 		= '';
							$fecha 			= $worksheet->getCellByColumnAndRow(3, $row)->getValue();
							$plazo 			= '';
							$vencimiento 	= $worksheet->getCellByColumnAndRow(4, $row)->getValue();
							$documento 		= $worksheet->getCellByColumnAndRow(1, $row)->getValue();
							$nombre 		= $worksheet->getCellByColumnAndRow(2, $row)->getValue();
							$movil 			= $worksheet->getCellByColumnAndRow(0, $row)->getValue();
							//$mora 			= $worksheet->getCellByColumnAndRow(5, $row)->getValue();
							$valor 			= '';
							$abono 			= '';
							$saldo 			= $worksheet->getCellByColumnAndRow(6, $row)->getValue();						
							$cartera 		= $hoja;

							$inidate = \PHPExcel_Style_NumberFormat::toFormattedString($fecha, 'DD-MM-YYYY');
							$findate = \PHPExcel_Style_NumberFormat::toFormattedString($vencimiento, 'DD-MM-YYYY');	

							$date1 = date("d-m-Y",strtotime($inidate));
							$date2 = date("d-m-Y",strtotime($findate));
							$diff = abs(strtotime($date2) - strtotime($date1));

							$mora 	= 	floor($diff / (60 * 60 * 24));							

							
							if($saldo == "" || !isset($saldo)){
								$saldo = 0;
							}

							if($valor == "" || !isset($valor)){
								$valor = 0;
							}

							if($abono == "" || !isset($abono)){
								$abono = 0;
							}	

							$descr = "pagos diarios";
							$message = "Apreciado Asociado(a) <b>".$nombre."</b>
					        			<br/><br/>
					        			A continuación, le estamos enviando el resumen de saldos de las cuentas que tiene con la entidad a la fecha.
					        			<br/>        			
					        			Concepto: ".strtoupper($descr)." y valor de $".$saldo." del móvil ".$movil." con fecha del ".$inidate." y vencimiento ".$findate.". La cual presenta ".abs($mora)." d&iacute;a(s) de mora.
					        			<br/>
					        			Gracias por contar con nosotros.
					        			<br/><br/>
					        			Correo generado autom&aacute;ticamente, por favor no responder.
					        			";

						}else if(strtolower($hoja)=="respcivil"){

							$tipo 			= '';
							$numero 		= '';
							$fecha 			= '';
							$plazo 			= '';
							$vencimiento 	= '';
							$documento 		= $worksheet->getCellByColumnAndRow(1, $row)->getValue();
							$nombre 		= $worksheet->getCellByColumnAndRow(2, $row)->getValue();
							$movil 			= $worksheet->getCellByColumnAndRow(0, $row)->getValue();
							$mora 			= '';
							$valor 			= $worksheet->getCellByColumnAndRow(3, $row)->getValue();
							//$abono 			= $worksheet->getCellByColumnAndRow(4, $row)->getCalculatedValue();
							$saldo 			= $worksheet->getCellByColumnAndRow(5, $row)->getValue();
							$abono 			= (floatval($valor)-floatval($saldo));
							$cartera 		= $hoja;

							$inidate = '';
							$findate = '';	

							if($saldo == "" || !isset($saldo)){
								$saldo = 0;
							}

							if($valor == "" || !isset($valor)){
								$valor = 0;
							}

							if($abono == "" || !isset($abono)){
								$abono = 0;
							}

							$descr = "responsabilidad civil";

			    			$message = "Apreciado Asociado(a) <b>".$nombre."</b>
					        			<br/><br/>
					        			A continuación, le estamos enviando el resumen de saldos de las cuentas que tiene con la entidad a la fecha.
					        			<br/>        			
					        			Concepto: ".strtoupper($descr)." y valor de la poliza de $".$valor." del móvil ".$movil.". A la fecha ha realizado abonos por $".$abono." pesos MCTE, con un saldo total de $".$saldo."
					        			<br/>
					        			Gracias por contar con nosotros.
					        			<br/><br/>
					        			Correo generado autom&aacute;ticamente, por favor no responder.
					        			";								

						}

							//echo "Email: ".$emailProp;

							$data[] = array(
								'tipo'  		=> $tipo,
								'numero'   		=> $numero,
								'fecha'    		=> $inidate,
								'plazo'  		=> $plazo,
								'vencimiento'   => $findate,
								'documento'  	=> $documento,
								'nombre'   		=> $nombre,
								'movil'    		=> $movil,
								'mora'  		=> abs($mora),
								'valor'   		=> $valor,
								'abono'   		=> $abono,
								'saldo'  		=> $saldo,
								'cartera'		=> $cartera,
								//'email'  		=> $emailProp
							);
						
						$filter = array('id_prop' => $documento);
				        $result= $this->Sart_model->getdatos($filter,'propietario','');
				        if($result){
				    		$rowd 		= $result->row();
				    		$emailProp 	= $rowd->email;
				    	}else{
				    		$emailProp 	= "";
				    	}

				    	//echo "Email: ".$emailProp;
				    	if($emailProp != ""){
				    		$enviarCorreo = $this->sendMail($emailProp,$nombre,$message,$subject);
				    	}
				    	
					}					

				} // End foreach

				

				$resp = $this->Sart_model->insert_plan($data);
				
				if($resp['guarda']== 'ok'){				
					$respu['validacion'] = 'ok';
				 	$respu['msn'] = 'Cartera registrada!!';
				}else{					  	
				  	$respu['validacion'] = 'fail';
				  	$respu['msn'] = $resp['motivo'];
				}

			}else{	// Si se presenta error al vaciar la tabla				  	
			  	$respu['validacion'] = 'fail';
			  	$respu['msn'] = $resp['motivo'];
			}		

		}

		echo json_encode($respu);
		
    }

    function sendMail($mail,$nombre,$mensaje,$subject='') {
        
        $this->load->config('email');
        //$this->load->library('email');
        
        $from = $this->config->item('smtp_user');
        $to = $mail;
        
        $message = $mensaje;

        $this->email->set_mailtype("html");
        $this->email->set_newline("\r\n");
        $this->email->from($from);
        $this->email->to($to,$nombre);
        $this->email->subject($subject);
        $this->email->message($message);


        if ($this->email->send()) {
            //echo 'Your Email has successfully been sent.';
            return true;
        } else {
            show_error($this->email->print_debugger());
        }
    }


function generar_qr() {

	//https://www.desarrollolibre.net/blog/codeigniter/generando-codigos-qr-con-codeigniter#.YCnUq2hKiUk
	foreach ($_REQUEST as $var => $val){$$var = $this->db->escape_str($val);}
	//hacemos configuraciones

	//$params['data'] = "Kode : ".$kode."\nBarang : ".$barang."\nUnit : ".$nama_unit."\nKondisi : ".$kon_barang."\nKeterangan : ".$keterangan."\nDetail : 'http://www.yoursite.com'";
	//$params['data'] = $id_usr;
	//$params['data'] = "Usuario : ".$id_usr."\nMovil : 123 \nConductor : Yeison \nPropietario : Velasquez \nCooperativa Coomocart \nURL : https://coomocart.com/";
	$params['data'] = "https://coomocart.com/";
	$params['level'] = 'H';
	$params['size'] = 2;

	//decimos el directorio a guardar el codigo qr, en este 
	//caso una carpeta en la raíz llamada qr_code
	$params['savename'] = FCPATH . "uploads/qr_code/qr_$id_usr.png";
	//generamos el código qr
	$this->ciqrcode->generate($params);

	$data['img'] = "qr_$id_usr.png";

	$this->load->view('sart/usuario/view_qr_code', $data);
}

}//FINCONTROL