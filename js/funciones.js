var sart = new Object();
sart.page  = '';
sart.pages = '';
sart.tablacondu = '';
function queue_load_all(div,params,control){
  var url=$('#base_url').val();	
  $.ajax({
	        url: url+'sart.php/sistemasart/'+control+params,
	        type: "POST",
	        async: true,
	        cache: false,
	        success: function( result ) {
	            $(div).html(result);
	        }
  });
}

$(document).on('click', '.return_false', function(){
  return false;
});

$(document).on('click', '.sgdp', function(){
  var url=$('#base_url').val();
  document.location.href=url+'sgc.php/sistemasgc/panelcambio';
});
$(document).on('click', '.excel', function(){
  var url=$('#base_url').val();
  var param=$(this).data('var');
  document.location.href='repoexcel'+param;
});

$(document).on('click', '.sgd', function(){
  var url=$('#base_url').val();
  var id_proc=$(this).data('proc');
  document.location.href=url+'sgc.php/sistemasgc/tabla_maestra?id_proc='+id_proc;
});

$(document).on('click', '.solicitud_new', function(){
  var url=$('#base_url').val();
  document.location.href=url+'sgc.php/sistemasgc/tabla_solicitud';
});


$(document).on('change', '#buscadoc', function(e){
    var search = $(this).val();
     $('#busqueda_list').closest('.ps-container').scrollTop(0);
    var url=$('#base_url').val();
    var vg=$('#filtrog').val();
    var idapp=$('#idapp').val();


    if(vg!=''){
     var parini='&grupo='+vg+'&app_ID='+idapp;
    }else{
     var parini='&app_ID='+idapp;
    }
    var orderby=$('#orderby').val();
    var order=$('#order').val();
    $.ajax({
        url: url+'sart.php/sistemasart/listar_tabla/?search='+search+'&tipo=list'+'&by='+orderby+'&order='+order+parini,
        type: 'GET',
        dataType: 'html',
    }).done(function(data){
        $('#busqueda_list').html(data);
    });
});

$(document).on('keyup', '#buscadoc', function(){
	 var search = $(this).val();
	 if(search==''){
       $('.resetea').addClass('hide');
	 }else{
	 	$('.resetea').removeClass('hide');
	 }
      
});

$(document).on('click', '.resetea', function(e){
   $('#buscadoc').val('');
   var vg=$('#filtrog').val();
    $('#orderby').val('asc');
   $('#order').val('id_movil');
   var idapp=$('#idapp').val();
   var by=$('#orderby').val();
   var order=$('#order').val();
   var orderby="";
   if(by=="asc"){
       orderby="asc";
   }else{
       orderby="desc";
   }
   if(vg!=''){
    var parini='?grupo='+vg+'&by='+orderby+'&order='+order+'&app_ID='+idapp;
   }else{
    var parini='?by='+orderby+'&order='+order+'&app_ID='+idapp;
   }
   

   var search = $('#buscadoc').val();
   if(search==''){
       $('.resetea').addClass('hide');
	 }else{
	 	$('.resetea').removeClass('hide');
	 }
  $('#search2').val('');
  $('#campo').val('');
   queue_load_all('#busqueda_list',parini,'listar_tabla');
});

$(document).on('change', '#buscaprop', function(e){
    var search = $(this).val();
     $('#busqueda_list').closest('.ps-container').scrollTop(0);
    var url=$('#base_url').val();
    var vg=$('#filtrog').val();
    var idapp=$('#idapp').val();
     var parini='&app_ID='+idapp;
    var orderby=$('#orderby').val();
    var order=$('#order').val();
    $.ajax({
        url: url+'sart.php/sistemasart/listar_tabla_prop/?search='+search+'&tipo=list'+'&by='+orderby+'&order='+order+parini,
        type: 'GET',
        dataType: 'html',
    }).done(function(data){
        $('#busqueda_list').html(data);
    });
});

$(document).on('keyup', '#buscaprop', function(){
   var search = $(this).val();
   if(search==''){
       $('.reseteaprop').addClass('hide');
   }else{
    $('.reseteaprop').removeClass('hide');
   }
      
});

$(document).on('click', '.reseteaprop', function(e){
   $('#buscaprop').val('');
   var vg=$('#filtrog').val();
    $('#orderby').val('asc');
   $('#order').val('id_prop');
   var idapp=$('#idapp').val();
   var by=$('#orderby').val();
   var order=$('#order').val();
   var orderby="";
   if(by=="asc"){
       orderby="asc";
   }else{
       orderby="desc";
   }
   
    var parini='?by='+orderby+'&order='+order+'&app_ID='+idapp;
   

   var search = $('#buscaprop').val();
   if(search==''){
       $('.reseteaprop').addClass('hide');
   }else{
    $('.reseteaprop').removeClass('hide');
   }
  $('#search2').val('');
  $('#campo').val('');
   queue_load_all('#busqueda_list',parini,'listar_tabla_prop');
});

$(document).on('change', '#buscareemp', function(e){
   var search = $(this).val();
     $('#busqueda_rec').closest('.ps-container').scrollTop(0);
    var url=$('#base_url').val();
    var vg=$('#filtrog').val();
    if(vg!=''){
      var parini='&grupo='+vg+'&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+$('#app_ID').val();
    }else{
      var parini='&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+$('#app_ID').val();
    }

    $.ajax({
        url: url+'sart.php/sistemasart/detalle_reeimprime/?search='+search+parini,
        type: 'GET',
        dataType: 'html',
    }).done(function(data){
        $('#busqueda_rec').html(data);
    });
});

$(document).on('keyup', '#buscareemp', function(){
	 var search = $(this).val();
	 if(search==''){
       $('.reseteareemp').addClass('hide');
	 }else{
	 	$('.reseteareemp').removeClass('hide');
	 }
      
});

$(document).on('click', '.reseteareemp', function(e){
   $('#buscareemp').val('');
   var search = $('#buscareemp').val();
   if(search==''){
       $('.reseteareemp').addClass('hide');
	 }else{
	 	$('.reseteareemp').removeClass('hide');
	 }
   var vg=$('#filtrog').val();
    if(vg!=''){
      var parini='?grupo='+vg+'&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+$('#app_ID').val();
    }else{
      var parini='?tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+$('#app_ID').val();
    }
   queue_load_all('#busqueda_rec',parini,'detalle_reeimprime');
});


$(document).on('click', '.filter', function(){
   var id= $(this).data('id');
   var tipo= $(this).data('tipo');
   var campo= $(this).data('campo');
   var popover=$(this).data('cpopover');
   var idapp=$('#idapp').val();
    var orderby=$('#orderby').val();
    var order=$('#order').val();
   $('.resetea').removeClass('hide');
   var params='?search2='+id+'&tipo='+tipo+'&campo='+campo+'&by='+orderby+'&order='+order+'&app_ID='+idapp;
   $('#busqueda_list').closest('.ps-container').scrollTop(0);
   $('#search2').val(id);
   $('#campo').val(campo);
   queue_load_all('#busqueda_list',params,'listar_tabla');
   $('.'+popover).click();
});

$(document).on('click', '.filtersol', function(){
   var id= $(this).data('id');
   var tipo= $(this).data('tipo');
   var campo= $(this).data('campo');
   var popover=$(this).data('cpopover');
   $('#busqueda_list').closest('.ps-container').scrollTop(0);
   var params='?valor='+id+'&tipo='+tipo+'&campo='+campo;
   queue_load_all('#busqueda_list',params,'buscarsol');
   $('.'+popover).click();
}); 

 $(document).on('click', '.close_popover_mounth_n2', function(){
  $('.popoverproc').click();
  return false;
});

 $(document).on('click', '.close_popover_medio', function(){
  $('.popovermedio').click();
  return false;
});
  $(document).on('click', '.close_popover_origen', function(){
  $('.popoverorigen').click();
  return false;
});
$(document).on('click', '.close_popover_tipodoc', function(){
  $('.popovertipodoc').click();
  return false;
});
$(document).on('click', '.cancelaform', function(){
   $('#adddoc')[0].reset();
});
$(document).on('click', '.cancelataxi', function(){
   $('#form_movil')[0].reset();
});
$(document).on('click', '.cancelaformdel', function(){
   $('#borrardoc')[0].reset();
});

$(document).on('click', '.cancelaformsol', function(){
   $('#formsoli')[0].reset();
});

$(document).on('click', '.cancelaformreply', function(){
   $('#replysol')[0].reset();
});

$('#panel-modal2').on('shown.bs.modal', function () {
    $('#ndoc').focus();
});

$('#global_doc').on('shown.bs.modal', function () {
    $('#ndocunew').focus();
});

$('#edit_doc').on('shown.bs.modal', function () {
  if($('#idp').val()==''){
   $('#idp').focus();
  }else{
    $('#nombreprop').focus();
  }
    

});

$('#modaltaxi').on('hidden.bs.modal', function () {
    $('.divfechafin input').datepicker('hide');
    $('.divfecha input').datepicker('hide');
});




$(document).on('click', '.guardaedit', function(e){
  var details  = $('#editdoc').serialize();
  $(this).addClass('hide');
  var menu=$(this).data('menu');
  $('.grabando').removeClass('hide');
  if(validarCampos('#editdoc')){
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/grabarprop?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.cancelaformedit').click();
                     var order = $('#order').val();
                       var orderby = $('#orderby').val();
                    var idapp=$('#idapp').val();
                    var vg=$('#filtrog').val();
                    if(vg!=''){
                      var parini='?grupo='+vg+'&order='+order+'&by='+orderby+'&app_ID='+idapp;
                    }else{
                      var parini='?order='+order+'&by='+orderby+'&app_ID='+idapp;
                    }
                        
                if(menu=='prop'){
                  var par='?order='+order+'&by='+orderby+'&app_ID='+idapp;
                  queue_load_all('#busqueda_list',par,'listar_tabla_prop');
                }else{
                queue_load_all('#busqueda_list',parini,'listar_tabla');
                  
                }       
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
                
              // queue_load_all('#busqueda_list','','listar_tabla');
               
            }else{
              if (data.msn=='found') {
                 $('.grabaerror' ).data('toastr-notification','Propietario ya existe, desea modificar datos?');
                 $('.grabaerror').click();
                 var paredi='?id_prop='+data.idprop+'&tipo=edit'
                 queue_load_all('#edit_modal',paredi,'editarprop');
              }else{
                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
                $('.grabando').addClass('hide');
                $('.guardaedit').removeClass('hide');
              }
               
            }
        }); 
  }else{
    $(this).removeClass('hide');
      $('.grabando').addClass('hide');
  }  

});
//selectize-input
$(document).on('click', '.guardamovil', function(e){
  var details  = $('#form_movil').serialize();
  $('.guardamovil').addClass('hide');
  $('.grabando').removeClass('hide');
  if(validarCampos('#form_movil')){
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/grabarmovil?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.cancelataxi').click();
                     var order = $('#order').val();
                     var orderby = $('#orderby').val();
                     var idapp=$('#idapp').val();
                     var vg=$('#filtrog').val();
                    if(vg!=''){
                      var parini='?grupo='+vg+'&order='+order+'&by='+orderby+'&app_ID='+idapp;
                    }else{
                      var parini='?order='+order+'&by='+orderby+'&app_ID='+idapp;
                    }       
                queue_load_all('#busqueda_list',parini,'listar_tabla');
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
            }else{
              if (data.msn=='found') {
                 $('.grabaerror' ).data('toastr-notification','Movil ya existe');
                 $('.grabaerror').click();
                 var paredi='?id_movil='+data.idmovil+'&tipo=edit&app_ID='+idapp
                 queue_load_all('#taxi_modal',paredi,'taximodal');
              }else{
                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
                $('.grabando').addClass('hide');
                $('.guardamovil').removeClass('hide');
              }
               
            }
        }); 
  }else{
    $('.guardamovil').removeClass('hide');
    $('.grabando').addClass('hide');
   $('.grabaerror').data('toastr-notification','Faltan campos Por llenar');
    $('.grabaerror').click();
    //toastr.clear();
  }  

});

$(document).on('click', '.guardadel', function(e){
  var details  = $('#borrardoc').serialize();
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sgc.php/sistemasgc/grabardel?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.grabaok').click();
                $('.cancelaformdel').click();
             //    queue_load_all('#busqueda_list','','listar_tabla');
             
            }else{
               $('.grabaerror').click();
            }
        });   
});
$(document).on('click', '.abre_edit', function(e){
   var details = $(this).data('vars');
    $.ajax({
        url: details,
        type: 'GET',
        dataType: 'html',
    }).done(function(data){

        $('#edit_modal').html(data);
    });
    return false;
});
$(document).on('click', '.abre_del', function(e){
   var details = $(this).data('vars');
    $.ajax({
        url: details,
        type: 'GET',
        dataType: 'html',
    }).done(function(data){

        $('#borrar_modal').html(data);
    });
    return false;
});

$(document).on('click', '.abre_mod_global', function(e){
   var details = $(this).data('vars');
   var capa = $(this).data('capa');
    $.ajax({
        url: details,
        type: 'GET',
        dataType: 'html',
    }).done(function(data){

        $('#'+capa).html(data);
    });
    return false;
});
$(document).on('click', '.call_modal', function(e){
    var details = $(this).data('vars');
    var modal   = $(this).data('modal');
    $.ajax({
        url: details,
        type: 'GET',
        dataType: 'html',
        /*data: {id: 1}, */
    }).done(function(data){
      
        $(modal).html(data);
    });
    return false;
});
$(document).on('click', '.grabanew', function(e){
  var url=$('#base_url').val();
  $(this).addClass('hide');
  $('.grabando').removeClass('hide');
   var formData = new FormData($("form#formsoli")[0]);
   var message = "";
   //hacemos la petición ajax  
   if(validarCampos('#formsoli')){
        $.ajax({
	       url: url+'sgc.php/sistemasgc/grabarnewsol',  
	       type: 'POST',
	       // Form data
	       //datos del formulario
	       data: formData,
	       dataType: 'json',
	       //necesario para subir archivos via ajax
	       cache: false,
	       contentType: false,
	       processData: false
	       //mientras enviamos el archivo
	   }).done(function(data){
            if(data.validacion == 'ok'){
                $('.cancelaformsol').click();
                queue_load_all('#busqueda_list','','listar_solicitud');
                 $('.grabaoknew' ).data('toastr-notification',data.msn);
                 $('.grabaoknew').click();
            }else{
            //	 message = $("Ha ocurrido un error");
	            $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
                $('.grabanew').removeClass('hide');
                $('.grabando').addClass('hide');
            }
        }); 

    }else{
    	$(this).removeClass('hide');
        $('.grabando').addClass('hide');
    }  
});
$(document).on('click', '.grabareply', function(e){
   var details  = $('#replysol').serialize();
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sgc.php/sistemasgc/grabareply?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.cancelaformreply').click();
                queue_load_all('#busqueda_list','','listar_solicitud');
                 $( '.grabaoknew' ).data('toastr-notification',data.msn);
                 $('.grabaoknew').click();
            }else{
                $('.grabaerror').click();
            }
        });   
});

function validarCampos(form){
var inputs = $(form+' :input'); // Obtenemos los inputs de nuestro formulario
var formvalido = true; // Para saber si el form esta vacio 
 
inputs.each(function() {  // Recorremos los inputs del formulario (uno a uno)
if($(this).hasClass('obligatorio')){	
	if(!isEmpty($(this).val())){ // Verificamos que el input este vacio 
	$(this).parent( ".inputer .input-wrapper" ).addClass('active'); // Agregamos un fondo rojo si este esta vacio
	$(this).parent().parent().addClass('inputer-red').removeClass('inputer-indigo'); // Agregamos un fondo rojo si este esta vacio
	formvalido = false;
	}
}
if($(this).hasClass('selobligatorio')){  
  if($(this).val()==''){ // Verificamos que el input este vacio 
    $(this).attr('data-style','btn-red') // Agregamos un fondo rojo si este esta vacio
    if($(this).hasClass('selinput')){
      $('.selinput').find('.selectize-input').css('border-color','#f34235');
    }
     var datacolor=$(this).data('style')
      if(datacolor=='btn-red'){
       $(this).attr('data-style','btn-indigo')
      }
    formvalido = false;
  }else{
    $(this).attr('data-style','btn-indigo')
    $('.selinput').find('.selectize-input').css('border-color','1px solid #cccccc');
  }

}
});

return formvalido; // retornamos segun corresponda
}
function validasearch(form){
  var inputs = $(form+' :input'); // Obtenemos los inputs de nuestro formulario
  var formvalido = true; // Para saber si el form esta vacio 
  // alert('entro')
  inputs.each(function() {  // Recorremos los inputs del formulario (uno a uno)
  if($(this).hasClass('selobligatorio')){  
    if($(this).val()==''){ // Verificamos que el input este vacio 
      $(this).attr('data-style','btn-red') // Agregamos un fondo rojo si este esta vacio
      if($(this).hasClass('selinput')){
        $('.selinput').find('.selectize-input').css('border-color','#f34235');
      }
       var datacolor=$(this).data('style')
        if(datacolor=='btn-red'){
         $(this).attr('data-style','btn-indigo')
        }
      formvalido = false;
    }else{
      $(this).attr('data-style','btn-indigo')
    }

  }
});
return formvalido; // retornamos segun corresponda
} 

function isEmpty(val){
	if(jQuery.trim(val).length <= 0)
	    return false;
	return true;
}

function showMessage(message){
    $(".messages").html("").show();
    $(".messages").html(message);
}
 
//comprobamos si el archivo a subir es una imagen
//para visualizarla una vez haya subido
function isImage(extension)
{
    switch(extension.toLowerCase())
    {
        case 'jpg': case 'gif': case 'png': case 'jpeg':
            return true;
        break;
        default:
            return false;
        break;
    }
 }


 ///////////sart
 $(document).on('click', '#login_button', function(e){
    var url=$('#base_url').val();
    var params = '';
    queue_global(url+'sart.php/sistemasart/sing_up?', $( "#login_form" ).serialize(), after_request_login);
    $('.btn_login').button('Cargando....');
    return false;

});
function after_request_login(JSON){
   var url=$('#base_url').val();
  if(JSON.validacion == 'ok'){
    if(JSON.grupo!=''){
     document.location.href=url+'sart.php/sistemasart/principal?g='+JSON.grupo; 
    }else{
     document.location.href=url+'sart.php/sistemasart/principal';
    }
  }else{
        $('#login_button').removeAttr('disabled');
        $('#login_button').removeClass('disabled');
        $('#login_button').html('Ingresar');
        $('#label_login_error').html('<div class="alert alert-block alert-danger fade in"><a class="close" data-dismiss="alert" href="#">x</a><p><span class="thin" id="label_login_error_legend">'+JSON.msn+'</span></p></div>');
    }
}

$(document).on('click', '.sign_out', function(e){
  var url=$('#base_url').val();
    $.ajax({
        url: url+'sart.php/sistemasart/log_out',
        type: "POST",
        async: true,
        cache: false,
        dataType: 'json',
        success: function( JSON ) {
           if(JSON.validacion == 'ok'){
                document.location.href =url+'sart.php/sistemasart/';
            }
        }
    });
});

$(document).on('click', '.menu', function(e){
  var url=$('#base_url').val();
  var grupo=$(this).data('grupo');
    if(grupo!=''){
     document.location.href=url+'sart.php/sistemasart/principal?g='+grupo; 
    }else{
     document.location.href=url+'sart.php/sistemasart/principal';
    }
});



function queue_global(file,params,funct){

    $.ajax({
        url: file+params,
        type: "POST",
        async: true,
        cache: false,
        dataType: 'json',
        success: function( result ) {
           funct(result);
        }
    });
}

$(document).on('keyup','.field_username',function(e) {
    if (e.which == 13) {
        $('#login_button').click();
    }
});

$(document).on('keyup','.field_password',function(e) {
    if (e.which == 13) {
        $('#login_button').click();
    }
});
$(document).on('click', '.entrapanel', function(){
  var url=$('#base_url').val();
  var path=$(this).data('url');
  var filg=$(this).data('filterg');
  var idapp=$(this).data('idapp');
  if(filg!='*'){
    var param='?g='+filg+'&app_ID='+idapp;
  }else{
   var  param='?app_ID='+idapp;
  }
  document.location.href=url+path+param;
});
$(document).on('click', '.orderby', function(){
    var div   = $(this).data('div');
    var value   = $(this).data('value');
    var vars   = $(this).data('vars');
    var control   = $(this).data('control');
     var search = $('#buscadoc').val();
    var by=$('#orderby').val();
    var orderby="";
    if(by=="asc"){
        orderby="desc";
    }else{
        orderby="asc";
    }
    $('#orderby').val(orderby);
    $('#order').val(value);
    if($('#search2').val()!=''){
       var paramfi='&search2='+$('#search2').val()+'&campo='+$('#campo').val();
    }else{
      var paramfi="";
    }

    var vg=$('#filtrog').val();
    if(vg!=''){
     // var parini='?grupo='+vg+'&order='+order+'&by='+orderby
      var params=vars+'&by='+orderby+'&search='+encodeURI(search)+'&grupo='+vg;
    }else{
      
      var params=vars+'&by='+orderby+'&search='+encodeURI(search)+paramfi
    }
    
    queue_load_all(div,params,control)
   //  $('.search_all2').val('');
   // $(this).addClass('hide');
});  


 
$(document).on('change', '.buscamov', function(e){
    var search = $(this).val();
    var campo=$(this).data('campo');
    var url=$('#base_url').val();
    var vg=$('#filtrog').val();
    if(vg!=''){
     var parini='&grupo='+vg;
    }else{
     var parini='';
    }
    var parame='?search='+search+'&campo='+campo+parini
    queue_load_all('#tabsrecibo',parame,'muestra_tab_diario');

	var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/muestra_recibos?id_movil='+search,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
           $('.diariosn').html(parseInt(data.diario)+1);
	   $('.descun').html(parseInt(data.desc)+1);
	   $('.tallern').html(parseInt(data.taller)+1);	
        });
});
$(document).on('keyup', '.buscamov', function(){
   var search = $(this).val();
   if(search==''){
       $('.resdiario').addClass('hide');
   }else{
    $('.resdiario').removeClass('hide');
   }  
   $('#buscamov').focus();
});
$(document).on('click', '.resdiario', function(e){
   $('.buscamov').val('');
   var search = $('.buscamov').val();
   if(search==''){
       $('.resdiario').addClass('hide');
   }else{
    $('.resdiario').removeClass('hide');
   }
  $('#tabsrecibo').html('');
  $('#buscamov').focus();
});
$(document).on('click', '.limpiadia', function(e){
   $('.buscamov').val('');
   var search = $('.buscamov').val();
   if(search==''){
       $('.resdiario').addClass('hide');
   }else{
    $('.resdiario').removeClass('hide');
   }
  $('#tabsrecibo').html('');
   $('#buscamov').focus();


});
//$(document).on('keyup', '#buscadoc', function(){
$(document).on('keyup','#cuota',function(e) {
  
 var valord=$('#cuotav').val();
 var valorda=$('#vdiadm').val();
 var valordt=$('#vdiat').val();
 var valorap=$('#vdiaaporte').val();
 var cuot=parseInt($(this).val());
 var saldodt=parseInt($('#ndtaller').val());

 var total=valord*cuot;
 var vtradio=valordt*cuot;
 var vdadm=valorda*cuot;
 var vdap=valorap*cuot;
 itotal = format_number(total,'');
 itotal = itotal.substring(0, itotal.length - 3);

 vtdiaadm = format_number(vdadm,'');
 vtdiaadm = vtdiaadm.substring(0, vtdiaadm.length - 3);

 vtdiara = format_number(vtradio,'');
 vtdiara = vtdiara.substring(0, vtdiara.length - 3);

 vtapor = format_number(vdap,'');
 vtapor = vtapor.substring(0, vtapor.length - 3);

 if($("#tallerf").is(":checked")){
  //console.log(saldodt+'---'+cuot)
  if(cuot>saldodt){
     $(this).val(saldodt);
     cuot=saldodt;
     $('.grabaerror' ).data('toastr-notification','Superado dias de taller');
     $('.grabaerror').click();
    //return false;
  }
  $('#dctock').attr('disabled','disabled');
  $('#vadmint').val('0');
   $('#vradit').val('0');
 }else{
   $('#vadmint').val(vdadm);
   $('#vradit').val(vtradio);
 }
 if($(this).val()!=''){
  if($("#tallerf").is(":checked")){
     $('#dctock').attr('disabled','disabled');
     if($('#dctock').is(':checked')){
       $('#dctock').attr('checked',false);
       $('.dctoval').html("$ 0");

     }
  }else{
    $('#dctock').removeAttr('disabled')
   
  }
  $('.nav li.active').next('li').find('a').attr("data-toggle","tab")
  $('#adestab').removeClass("no_cuota");
  $('.vdtotal1').html('$ '+vtdiaadm);
  $('#vdiatotal1').val(vdadm);
  $('.vdtotal2').html('$ '+vtdiara);

  $('#vdiatotal2').val(vtradio);
  $('#vapor').val(vdap);

 }else{
  if($('#dctock').is(':checked')){
    $('#dctock').attr('checked',false);
    $('.dctoval').html("$ 0");

  }
  $('#dctock').attr('disabled','disabled');
  $('#adestab').removeAttr("data-toggle");
  $('#adestab').addClass("no_cuota");
 }

 
 
 $('.apagar').html(itotal);
 $('#pagarnf').val(total);
 $('#pagaror').val(total);
 

   if (e.which == 13) {
       return false;
    }
});
$(document).on('change','#cuota',function(e) {
  
 var valord=$('#cuotav').val();
 var valorda=$('#vdiadm').val();
 var valordt=$('#vdiat').val();
 var valorap=$('#vdiaaporte').val();

  var saldodt=parseInt($('#ndtaller').val());
 var cuot=$(this).val();
 var total=valord*cuot;
 var vtradio=valordt*cuot;
 var vdadm=valorda*cuot;
 var vdap=valorap*cuot;

 itotal = format_number(total,'');
 itotal = itotal.substring(0, itotal.length - 3);
 if($("#tallerf").is(":checked")){
  //console.log(saldodt+'---'+cuot)
  if(cuot>saldodt){
     $(this).val(saldodt);
     cuot=saldodt;
     $('.grabaerror' ).data('toastr-notification','Superado dias de taller');
     $('.grabaerror').click();
    //return false;
  }
  $('#dctock').attr('disabled','disabled');
  $('#vadmint').val('0');
   $('#vradit').val('0');
  $('#vapor').val('0');
   
 }else{
  $('#vadmint').val(vdadm);
  $('#vradit').val(vtradio);
  $('#vapor').val(vdap);

 }
 if($(this).val()!=''){
  if($("#tallerf").is(":checked")){
     $('#dctock').attr('disabled','disabled');
     if($('#dctock').is(':checked')){
       $('#dctock').attr('checked',false);
       $('.dctoval').html("$ 0");

     }
  }else{
    $('#dctock').removeAttr('disabled')
   
  }
  $('.nav li.active').next('li').find('a').attr("data-toggle","tab")
  $('#adestab').removeClass("no_cuota");
  $('.vdtotal1').html('$ '+vtdiaadm);
  $('#vdiatotal1').val(vdadm);
  $('.vdtotal2').html('$ '+vtdiara);
  $('#vdiatotal2').val(vtradio);
 }else{
  if($('#dctock').is(':checked')){
    $('#dctock').attr('checked',false);
    $('.dctoval').html("$ 0");

  }
  $('#dctock').attr('disabled','disabled');
  $('#adestab').removeAttr("data-toggle");
  $('#adestab').addClass("no_cuota");
 }

 
 $('.apagar').html(itotal);
 $('#pagarnf').val(total);
  $('#pagaror').val(total);
 
   //  if($(this).val()!=''){
   //  $('#dctock').removeAttr('disabled')
   // }else{
   //  if($('#dctock').is(':checked'))
   //  {
   //    $('#dctock').attr('checked',false);
   //    $('.dctoval').html("$ 0");
   //  }
   //  $('#dctock').attr('disabled','disabled');
   // }
});

$(document).on('keyup','#v_descuento',function(e) {
 var id=$(this).data('idcod');
 var valord=$('#vdiatotal'+id).val();
 var cuot=$(this).val();
 var total=valord*cuot/100;

 itotal = format_number(total,'');
 itotal = itotal.substring(0, itotal.length - 3);
 $('.total_des'+id).html("$ "+itotal);
 $('.total_desnf'+id).html(total);
  $('#ptotaldes'+id).val(total);
 var sub=0;
 $('.vsubtotnf').each(function(e){
   sub=sub+parseInt($(this).html());
   gtotal = format_number(sub,'');
   gtotal = gtotal.substring(0, gtotal.length - 3);
  $('.vtotalconc').html('$ '+gtotal);
  $('#vtotalconctext').val(sub);

 })


   if (e.which == 13) {
       return false;
    }
});

function format_number(n, currency) {
   return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
}

$(document).on('click', '.tallervalor', function(e){
  var vtaller=$(this).data('vtaller');
  var valor=$(this).val();
  itotal = format_number(vtaller,'');
  itotal = itotal.substring(0, itotal.length - 3);
  $('.vdia').html('$ '+itotal);
  $('.apagar').html('0.00');
  $('#pagarnf').val('');
  $('#pagaror').val('');
  $('#cuotav').val(vtaller);
  $('#cuota').val('');
  $('#vadmint').val('');
  $('#vradit').val('');
  if(valor=='diarios'){
     $('.ftaller').addClass('hide');
     $('.fconcepto').removeClass('hide');
     $('.vtotalconc').html('$ '+itotal);
  }else{
     $('#dctock').attr('disabled','disabled');
     if($('#dctock').is(':checked')){
       $('#dctock').attr('checked',false);
       $('.dctoval').html("$ 0");
     }
     $('.fconcepto').addClass('hide');
     $('.ftaller').removeClass('hide');
     $('.vtotalconc').html('$ '+itotal);
  }
});
$(document).on('click', '.grabadiario', function(e){
  var details  = $('#form_diariomovil').serialize();
  $(this).addClass('hide');
  var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/grabardiario?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){  
               
                var parini='?search='+data.idmovil+'&campo=id_movil';
                url = url+'sart.php/sistemasart/genera_recibo'+parini+'&ndiario='+data.nrecibo+'&tipor='+data.tipor+'&anula=no';
                window.open(url,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');
                //queue_load_all('#tabsrecibo',parini,'muestra_tab_diario');
            		if(data.tipor=='diarios'){
            		 $('.diariosn' ).html(parseInt(data.nrecibo)+1);
            		}else{
            	         $('.descun' ).html(parseInt(data.nrecibo)+1);
            		}
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
                $('.buscamov').val('');
                 var search = $('.buscamov').val();
                 if(search==''){
                     $('.resdiario').addClass('hide');
                 }else{
                  $('.resdiario').removeClass('hide');
                 }
                $('#tabsrecibo').html('');
                 $('#buscamov').focus();
            }else{
              $('.grabadiario').removeClass('hide');

                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
            }
        }); 
});
$(document).on('click', '.grabadescuento', function(e){
  var details  = $('#form_descmovil').serialize();
  var url=$('#base_url').val();
  $(this).addClass('hide');

        $.ajax({
            url: url+'sart.php/sistemasart/grabardesc?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){  
                var parini='?search='+data.idmovil+'&campo=id_movil';
                url = url+'sart.php/sistemasart/genera_descuento'+parini+'&ndiario='+data.nrecibo+'&anula=no';
                window.open(url,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');
		$('.tallern' ).html(parseInt(data.nrecibo)+1);
                //queue_load_all('#tabsrecibo',parini,'muestra_tab_diario');
                // $('#desc_tab').removeClass('active');
                // $('.lid_tab').removeClass('active');
                // $('#rec_tab').addClass('active');
                // $('.lir_tab').addClass('active');
                $('.grabadescuento').removeClass('hide');
                $('#recibotab').click()
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
            }else{
              $('.grabadescuento').removeClass('hide');

                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
            }
        }); 
});

$(document).on('click', '.reprint', function(e){
  var idmovil=$(this).data('idmovil');
  var nrecibo=$(this).data('nrecibo');
  var tabla=$(this).data('tabla');
  var tipor=$(this).data('tipor');
  var url=$('#base_url').val();
 var parini='?search='+idmovil+'&campo=id_movil';
 if(tabla=='pago_descuento'){
  url = url+'sart.php/sistemasart/genera_descuento'+parini+'&ndiario='+nrecibo+'&anula=no';
 }else{
  url = url+'sart.php/sistemasart/genera_recibo'+parini+'&ndiario='+nrecibo+'&tipor='+tipor+'&anula=no';
 }
 
 window.open(url,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');
});

$(document).on('click', '#dctock', function(e){
  var id_movil=$('#id_movil').val();

  if($(this).is(':checked')){
    $('#descampo').val('activo');
    var url=$('#base_url').val();
          $.ajax({
              url: url+'sart.php/sistemasart/traedesc?id_movil='+id_movil,
              type: 'GET',
              dataType: 'json',
              data: { }
          }).done(function(data){
            if(data.valdesc==0){
                $('#dctock').attr('checked',false);
                $('.dctoval').html("$ 0");
               $('.grabaerror' ).data('toastr-notification','No hay descuentos Generados');
               $('.grabaerror').click();
            }else{
                itotal = format_number(parseInt(data.valdesc),'');
                itotal = itotal.substring(0, itotal.length - 3);
                $('.dctoval').html("$ "+itotal);
                var apago=$('#pagaror').val();
                var totopago=parseInt(apago)-parseInt(data.valdesc);
                gtot = format_number(parseInt(totopago),'');
                gtot = gtot.substring(0, gtot.length - 3);
                $('.apagar ').html(gtot); 
                $('#pagarnf').val(apago);
                $('#descaplicado').val(data.valdesc);
                $('#id_desc').val(data.id_desc);
           }
          }); 
  }else{
      $('.dctoval').html("$ 0");
       var apago=$('#pagaror').val();
       gtot = format_number(parseInt(apago),'');
       gtot = gtot.substring(0, gtot.length - 3);
       $('.apagar ').html(gtot); 
       $('#pagarnf').val(apago);
       $('#descampo').val('inactivo');

  }

});
$(document).on('click', '#adestab', function(e){
 if($(this).hasClass('no_cuota')){
   $('.grabaerror' ).data('toastr-notification','Debe Ingresar las cuotas');
   $('.grabaerror').click();
 }
});
$(document).on('change', '#tiporec', function(e){
  var app=$('#app_ID').val();
   if($(this).val()==1){
    $('#tabla').val('diarios');
    $('#campoid').val('id_diario');
    $('#campot').val('total');
   }
   if($(this).val()==2){
    $('#tabla').val('pago_taller');
    $('#campoid').val('id_ptaller');
    $('#campot').val('total');
   }
   if($(this).val()==3){
    $('#tabla').val('pago_descuento');
    $('#campoid').val('id_descuento');
    $('#campot').val('vtdescuento');
   }
    $('#buscareemp').val('');
    $('.reseteareemp').addClass('hide');
    var parini='?tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+app
    $('#busqueda_rec').closest('.ps-container').scrollTop(0);
   queue_load_all('#busqueda_rec',parini,'detalle_reeimprime');
});
$(document).on('click', '.guardanula', function(e){
  var details  = $('#anulaform').serialize();
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/anularec?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
             $('.grabaok' ).data('toastr-notification',data.msn);
             $('.grabaok').click();
              $('.cancelaanula').click();

             var vg=$('#filtrog').val();
              if(vg!=''){
                var parini='?grupo='+vg+'&tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+$('#app_ID').val();
              }else{
                var parini='?tabla='+$('#tabla').val()+'&campoid='+$('#campoid').val()+'&campot='+$('#campot').val()+'&app_ID='+$('#app_ID').val();
              }
             queue_load_all('#busqueda_rec',parini,'detalle_reeimprime');
             if(data.tabla=='diarios' || data.tabla=='pago_taller'){
                var parini='?search='+data.idmovil+'&campo=id_movil';
                url = url+'sart.php/sistemasart/genera_recibo'+parini+'&ndiario='+data.nrecibo+'&tipor='+data.tabla+'&anula=yes';
                
             }
             if(data.tabla=='pago_descuento'){
               var parini='?search='+data.idmovil+'&campo=id_movil';
               url = url+'sart.php/sistemasart/genera_descuento'+parini+'&ndiario='+data.nrecibo+'&anula=yes';
             }
             window.open(url,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');
             
            }else{
               $('.grabaerror' ).data('toastr-notification',data.msn);
               $('.grabaerror').click();
            }
        });   
});
$(document).on('click', '.infocheck', function(e){
  var valor=$(this).val();
  if($(this).is(':checked')){
    if(valor=='fechalim'){
      $('.fecha_rep').removeClass('hide');
    }else{
       $('.movil_info').removeClass('hide');
    }
  }else{
    if(valor=='fechalim'){
      $('.fecha_rep').addClass('hide');
    }else{
       $('.movil_info').addClass('hide');
    }
  }
});

/*$(document).on('click', '.genera_informe', function(e){
  var url=$('#base_url').val();
  var report= $('input:radio[name=informe]:checked').val();
  var param='';
 if(report===undefined){
  $('.msgerror' ).data('toastr-notification','Debe Seleccionar un informe');
  $('.msgerror').click();
  return false;
 }
 if($('#fechalim').is(':checked')){
   if($('#fechaini').val()==''){
    $('.msgerror' ).data('toastr-notification','Indique la fecha de inicio');
    $('.msgerror').click();
    return false;
   }
   if($('#fechafin').val()==''){
    $('.msgerror' ).data('toastr-notification','Indique la fecha final');
    $('.msgerror').click();
    return false;
   }
   if($('#fechaini').val()!='' && $('#fechafin').val()!=''){
     param+='&fini='+$('#fechaini').val()+'&ffin='+$('#fechafin').val();
   }
 }
 if($('#movil').is(':checked')){
   if($('#movilrep').val()==''){
    $('.msgerror' ).data('toastr-notification','Indique el movil');
    $('.msgerror').click();
    return false;
   }
   if($('#movilrep').val()!='' ){
     param+='&id_movil='+$('#movilrep').val();
   }
 }
  url = url+'sart.php/sistemasart/genera_informe?informe='+report+param;
  window.open(url,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');
});

$(document).on('click', '.show-on-hover', function(e){
  $(this).trigger("hover");
 
});*/
$(document).on('click', '.genera_informe', function(e){
  var url=$('#base_url').val();
  var report= $('input:radio[name=informe]:checked').val();
  var param='';
 if(report===undefined){
  $('.msgerror' ).data('toastr-notification','Debe Seleccionar un informe');
  $('.msgerror').click();
  return false;
 }
 if($('#fechalim').is(':checked')){
   if($('#fechaini').val()==''){
    $('.msgerror' ).data('toastr-notification','Indique la fecha de inicio');
    $('.msgerror').click();
    return false;
   }
   if($('#fechafin').val()==''){
    $('.msgerror' ).data('toastr-notification','Indique la fecha final');
    $('.msgerror').click();
    return false;
   }
   if($('#fechaini').val()!='' && $('#fechafin').val()!=''){
     param+='&fini='+$('#fechaini').val()+'&ffin='+$('#fechafin').val();
   }
 }
 if($('#movil').is(':checked')){
   if($('#movilrep').val()==''){
    $('.msgerror' ).data('toastr-notification','Indique el movil');
    $('.msgerror').click();
    return false;
   }
   if($('#movilrep').val()!='' ){
     param+='&id_movil='+$('#movilrep').val();
   }
 }

 if($('#grupo').val()!='' ){
     param+='&grupo='+$('#grupo').val();
   }
  url = url+'sart.php/sistemasart/genera_informe?informe='+report+param;
  window.open(url,'','scrollbars=yes,width='+$(document).width()+',height='+$(document).height()+'');
});

$(document).on('click', '.show-on-hover', function(e){
  $(this).trigger("hover");
});
$(document).on('click', '.grupoinf', function(e){
  var valor=$(this).val();
  if($(this).is(':checked')){
       $('.grupo_info').removeClass('hide');
  }else{
       $('.grupo_info').addClass('hide');
  }
});


$(document).on('click', '.graba_diast', function(e){
  var details  = $('#form_dtaller').serialize();
  $(this).addClass('hide');
  $('.grabandodt').removeClass('hide');
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/asigna_fecha?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
                 $('.grabandodt').addClass('hide');
                $('.graba_diast').removeClass('hide'); 
                var idapp=$('#app_ID').val();
                
                var params='?g=TA&app_ID='+idapp;
              setInterval(function(){ 
                document.location.href=url+'sart.php/sistemasart/confi'+params;
               }, 2000);
            }else{
              
                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
                $('.grabandodt').addClass('hide');
                $('.graba_diast').removeClass('hide'); 
            }
        }); 
});

$(document).on('click', '.graba_valores', function(e){
  var details  = $('#form_diariomovil').serialize();
  $(this).addClass('hide');
  $('.grabando').removeClass('hide');
   var url=$('#base_url').val();
        $.ajax({
            url: url+'sart.php/sistemasart/guarda_valor?'+details,
            type: 'GET',
            dataType: 'json',
            data: { }
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
                 $('.grabando').addClass('hide');
                $('.graba_valores').removeClass('hide'); 
                 var idapp=$('#app_ID').val();
                
                var params='?g=TA&app_ID='+idapp;
              setInterval(function(){ 
                document.location.href=url+'sart.php/sistemasart/confi'+params;
              }, 2000);
                // $('#radio').val('');
                // $('#admin').val('');
                // $('#taller').val('');
            }else{
              
                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
                $('.grabando').addClass('hide');
                $('.graba_valores').removeClass('hide'); 
            }
        }); 
});

$(document).on('click', '.guardaeditcondu', function(e){
  //var details  = $('#editdoc').serialize();
  var formData = new FormData( $('#editdoc')[0] );
  $(this).addClass('hide');
  var menu=$(this).data('menu');
  $('.grabando').removeClass('hide');
  if(validarCampos('#editdoc')){
   var url=$('#base_url').val();
        $.ajax({
            url: `${url}sart.php/sistemasart/grabarcondu`,
            type: 'POST',
            data: formData,
            dataType: 'json',
            xhr: function() {  
                // custom xhr
                myXhr = $.ajaxSettings.xhr();
                if(myXhr.upload){ // check if upload property exists
                    //myXhr.upload.addEventListener('progress',progress_insert_transactions, false); // for handling the progress of the upload
                }
                return myXhr;
            },
            //success: obtener_json_insert_transactions,
            
            cache: false,
            contentType: false,
            processData: false
        }).done(function(data){
            if(data.validacion == 'ok'){
                $('.cancelaformedit').click();
                sart.tablacondu.ajax.url(`${url}sart.php/sistemasart/datatramita`).load();
                /*     var order = $('#order').val();
                       var orderby = $('#orderby').val();
                    var idapp=$('#idapp').val();
                    var vg=$('#filtrog').val();
                    if(vg!=''){
                      var parini='?grupo='+vg+'&order='+order+'&by='+orderby+'&app_ID='+idapp;
                    }else{
                      var parini='?order='+order+'&by='+orderby+'&app_ID='+idapp;
                    }
                        
                if(menu=='prop'){
                  var par='?order='+order+'&by='+orderby+'&app_ID='+idapp;
                  queue_load_all('#busqueda_list',par,'listar_tabla_prop');
                }else{
                queue_load_all('#busqueda_list',parini,'listar_tabla');
                  
                }    */   
                $('.grabaok' ).data('toastr-notification',data.msn);
                $('.grabaok').click();
                
              // queue_load_all('#busqueda_list','','listar_tabla');
               
            }else{
              if (data.msn=='found') {
                 $('.grabaerror' ).data('toastr-notification','Conductor ya existe');
                 $('.grabaerror').click();
                 $('.guardaedit').removeClass('hide');
              }else{
                $('.grabaerror' ).data('toastr-notification',data.msn);
                $('.grabaerror').click();
                $('.grabando').addClass('hide');
                $('.guardaedit').removeClass('hide');
              }
               
            }
        }); 
  }else{
    $(this).removeClass('hide');
    $('.grabando').addClass('hide');
    $('.grabaerror' ).data('toastr-notification','Faltan campos por llenar');
    $('.grabaerror').click();
  }  

});
