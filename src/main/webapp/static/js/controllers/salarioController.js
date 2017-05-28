/**
 * 
 */

	angular.module("menu").controller("salarioController",function($scope,$http,salarioAPI){
		
		
		
		
		
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
		
		$scope.salarios=[];
		$scope.eliminados=[];
		$scope.error=false;
		$scope.ok=false;
		
		$scope.app="Registro de Salario";
		
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
		
		
	$scope.registrar=function(salario){
	
//		if((salario.pass1)===(salario.pass)){
//			console.log("Ingrese en comparación es igual")
//		}
		
		var validator = $("#registroform").validate();
		validator.form();
		
		if(validator.valid()){
			salarioAPI.saveSalario(salario).success(function(){
				
				delete	$scope.salario;
				
				var titulo="<i class='material-icons left'>done</i> Registrado correctamente";
				$("#titulo").html(titulo);
				
				$scope.ok=true;

				cancelarError();
				
				
				cargarSalarios();
					
				}).error(function(error, status){
				
					gestionarError(error,status);
					
				});
			
		}
		
		

		
	};	
	
	var cargarSalarios=function(){
		
		salarioAPI.getSalarios().success(function(salarios){
			
			
			$scope.salarios=salarios;
			
			
		}).error(function(error, status){
			
			gestionarError(error,status);
			
		});
		
		//$scope.salario={estado:'activo'};
		requesFocus('descripcion');
	};
	
	
	$scope.editarSalario=function(salario){
		
		
		$scope.salario=salario;
		
		$scope.$watch(function(){
			
			Materialize.updateTextFields();
			
		});
		
		
		$('ul.tabs').tabs('select_tab', 'registro');
		requesFocus('descripcion');
		
		
		//cargarSalario();
		
	};
	
	
$scope.eliminarMasivo=function(salarios){
		
		$scope.salarios=salarios.filter(function(salario){
			if(!salario.seleccionado)return salario;
 		});
		
		
		var eliminados=salarios.filter(function(salario){
			
			if(salario.seleccionado){
				
				delete salario.seleccionado;

				return salario
			}
				
		});
		
//  		$scope.message=eliminados;
 		
		salarioAPI.eliminarMasivo(eliminados).success(function(salarios){
		
			console.log("Eliminados Correctamente");
			
		}).error(function(eliminados){

			gestionarError(error,status);
		});
		
		$scope.criterioDeBusca="";
		
		$('#md1').closeModal();
		requesFocus('descripcion');
	};
	
	$scope.isSalarioSeleccionado=function(salarios){
		return salarios.some(function(salario){
			return salario.seleccionado;
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
		$scope.salario=undefined;
		
		$scope.$watch(function(){	
			Materialize.updateTextFields();
		});
		
		//$scope.salario={estado:'activo'};
		
		//$scope.criterioDeBusca="";
		requesFocus('descripcion');
		
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
	
	
	
		cargarSalarios();
	});
	
	
	
