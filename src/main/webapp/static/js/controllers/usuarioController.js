/**
 * 
 */

	angular.module("menu").controller("usuarioController",function($scope,$http,usuarioAPI){
		
		
		
		
		
//		$("#pass").keyup(function() {
//
//			$('#pass1').focus();
//			
//			$("#pass").focus();
//			  
//			});
		
		
		//$("#pass1").keyup(function() {

//			$('#pass').focus();
//			
//			$("#pass1").focus();
			
			
			  
			//});
		
		
		
		

//		$scope.$watch(function(){
//			
//			
//		});
		
		
		
		

		 var model = this;

		 model.message = "Hola Mundo";
		
//		 $scope.message="asdfsdf";
		
		$scope.usuarios=[];
		$scope.eliminados=[];
		$scope.error=false;
		$scope.ok=false;
		
		$scope.app="Registro de Usuario";
		
		 $('ul.tabs').tabs();
		 
//		 $('#mensaje_sistema').css({ 'width':'600px', 'height':'200px' });
		 
	
		$('.mymodal').leanModal({
		      dismissible: false, // Modal can be dismissed by clicking outside of the modal
		      opacity: .5, // Opacity of modal background
		      in_duration: 300, // Transition in duration
		      out_duration: 200, // Transition out duration
		      starting_top: '4%', // Starting top style attribute
		      ending_top: '10%', // Ending top style attribute
		      ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
		       // alert("Ready");
		    	  console.log("Modal Iniciado");
		      //  console.log(modal, trigger);
		      },
		      complete: function() {
		    	  
		    	  //alert('Closed');
		      
		      console.log("Modal Cerrado");
		      
		      //return false;
		      } // Callback for Modal close
		    }
		  );
		
		
	$scope.registrar=function(usuario){
	
//		if((usuario.pass1)===(usuario.pass)){
//			console.log("Ingrese en comparación es igual")
//		}
		
		var validator = $("#registroform").validate();
		validator.form();
		
		if(validator.valid()){
			usuarioAPI.saveUsuario(usuario).success(function(){
				
				delete	$scope.usuario;
				
				var titulo="<i class='material-icons left'>done</i> Registrado correctamente";
				$("#titulo").html(titulo);
				
				$scope.ok=true;

				cancelarError();
				
				
				cargarUsuarios();
					
				}).error(function(error, status){
				
					gestionarError(error,status);
					
				});
			
		}
		
		

		
	};	
	
	var cargarUsuarios=function(){
		
		usuarioAPI.getUsuarios().success(function(usuarios){
			
			
			$scope.usuarios=usuarios;
			
			
		}).error(function(error, status){
			
			gestionarError(error,status);
			
		});
		
		$scope.usuario={estado:'activo'};
		requesFocus('nombre');
	};
	
	
	$scope.editarUsuario=function(usuario){
		
		
		$scope.usuario=usuario;
		
		$scope.$watch(function(){
			
			Materialize.updateTextFields();
			
		});
		
		
		$('ul.tabs').tabs('select_tab', 'registro');
		requesFocus('nombre');
		
		
		//cargarUsuario();
		
	};
	
	
$scope.eliminarMasivo=function(usuarios){
		
		$scope.usuarios=usuarios.filter(function(usuario){
			if(!usuario.seleccionado)return usuario;
 		});
		
		
		var eliminados=usuarios.filter(function(usuario){
			
			if(usuario.seleccionado){
				
				delete usuario.seleccionado;

				return usuario
			}
				
		});
		
//  		$scope.message=eliminados;
 		
		usuarioAPI.eliminarMasivo(eliminados).success(function(usuarios){
		
			console.log("Eliminados Correctamente");
			
		}).error(function(eliminados){

			gestionarError(error,status);
		});
		
		$scope.criterioDeBusca="";
		
		$('#md1').closeModal();
		requesFocus('nombre');
	};
	
	$scope.isUsuarioSeleccionado=function(usuarios){
		return usuarios.some(function(usuario){
			return usuario.seleccionado;
		});
		
	};
	
	
	$scope.cancelar=function(){
		cancelar();
			
	};
	var cancelarError=function cancelarE(){
		$("#emsj").html("");
		$("#etitulo").html("");
		$scope.error=false;
	}
	var cancelarOk=function cancelarOk(){
		$("#msj").html("");
		$("#titulo").html("");
		$scope.ok=false;
	}
		
	var cancelar=function(){
		$scope.usuario=undefined;
		
		$scope.$watch(function(){	
			Materialize.updateTextFields();
		});
		
		$scope.usuario={estado:'activo'};
		
		//$scope.criterioDeBusca="";
		requesFocus('nombre');
		
		cancelarError();
		cancelarOk();
		
	};
	
	$scope.ordenarPor = function (campo) {
		$scope.criterioDeOrdenacion = campo;
		$scope.direccionDeOrdenacion = !$scope.direccionDeOrdenacion;
	};
	
	
	var requesFocus=	function foco(idElemento){
		 document.getElementById(idElemento).focus();
		}
	
	
	var gestionarError=function(error,status){
		var msj="";
		for(var i=0;i<error.fieldErrors.length;i++){
			
			msj+="Registro de: "+error.fieldErrors[i].resource+", ";
		
			msj+="Campo: "+error.fieldErrors[i].field+", ";
			
			msj+="Tipo de error: "+error.fieldErrors[i].code+", </br> ";
		
			msj+="Detalle mensaje: "+error.fieldErrors[i].message;
			
		}
	
		$("#emsj").html(msj);
		var etitulo="<i class='material-icons left'>error</i>"+"ERROR: "+error.code+", "+error.message+" </br> "+" <HR> ";
		$("#etitulo").html(etitulo);
		
		$scope.error=true;
		
		cancelarOk();
	}
	
	
	
		cargarUsuarios();
	});
	
	
	
