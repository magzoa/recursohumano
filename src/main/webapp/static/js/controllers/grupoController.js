/**
 * 
 */

	angular.module("menu").controller("grupoController",function($scope,$http,grupoAPI,$state,$stateParams,$rootScope){

		var foo = $stateParams.grupo;
		console.log(foo)
		
		var msjErrorGrupo="#emsj_grupo";
		var tituloErrorGrupo="#etitulo_grupo";
		var msjGrupo="#msj_grupo";
		var tituloMsjGrupo="#titulo_msj_grupo";
		
		$scope.grupos=[];
		$scope.eliminados=[];
		$scope.error=false;
		$scope.ok=false;
		
		$scope.app="Registro de Grupo";
		
		 $('ul.tabs').tabs();
		 
	
		$('.mymodalgrupoeliminar').leanModal({
		      dismissible: false, // Modal can be dismissed by clicking outside of the modal
		      opacity: .5, // Opacity of modal background
		      in_duration: 300, // Transition in duration
		      out_duration: 200, // Transition out duration
		      starting_top: '4%', // Starting top style attribute
		      ending_top: '10%', // Ending top style attribute
		      ready: function(modal, trigger) {
		    	  console.log("eliminar Grupo");
//		          if($(".lean-overlay").length > 1) {
//		              $(".lean-overlay:not(:first)").each(function() {
//		                  $(this).remove();
//		              });
//		          }
		    	  
		    	  
		      },
		      complete: function() {
//		          $(".lean-overlay").each(function() {
//		              $(this).remove();
//		          });
		      } // Callback for Modal close
		    }
		  );
		
		$scope.cargarModalGrupo=function(ventana,grupos){
		//	$('#materialize-lean-overlay-1').remove();
			
//			$('.lean-overlay').each(function (i, obj) { if (i > 1) { $('.lean-overlay').slice(i).remove(); } });
//			  $('.lean-overlay').remove();
			
			
			$scope.$parent.grupos=grupos;
//			$rootScope.grupos=grupos;
			
			//$('#mdgrupo1').closeModal();
			//mdgrupo1
			//$('#mdgrupo1').css("background-color", "gray");
			  setTimeout(function () {        //'#mdgrupo1'
				  $(ventana).openModal();

				 console.log("Ingrese en abrir");
			  }, 500);
				
		}
		
		
	$scope.registrar=function(grupo){
	
		var validator = $("#registroformgrupo").validate();
		validator.form();
		
		if(validator.valid()){
			grupoAPI.saveGrupo(grupo).success(function(){
				
				delete	$scope.grupo;
				
				var titulo="<i class='material-icons left'>done</i> Registrado correctamente";
				$(tituloMsjGrupo).html(titulo);
				
				$scope.ok=true;

				cancelarError();
				
				
				cargarGrupos();
					
				}).error(function(error, status){
				
					gestionarError(error,status);
					
				});
			
		}
		
		

		
	};	
	
	$rootScope.cargarGrupos=function(){
		cargarGrupos();
	}
	
	var cargarGrupos=function(){
		
		grupoAPI.getGrupos().success(function(grupos){
			
			
			$scope.grupos=grupos;
			
			
		}).error(function(error, status){
			
			gestionarError(error,status);
			
		});
		
		$scope.grupo={estado:'1'};
		requesFocus('descripcion_grupo');
	};
	
	
	$scope.editarGrupo=function(grupo){
		
		
		$scope.grupo=grupo;
		
		$scope.$watch(function(){
			
			Materialize.updateTextFields();
			
		});
		
		
		$('ul.tabs').tabs('select_tab', 'registro_grupo');
		requesFocus('descripcion_grupo');
		
		
		//cargarGrupo();
		
	};
	
	
$scope.eliminarMasivoGrupo=function(grupos){
		
		$scope.grupos=grupos.filter(function(grupo){
			if(!grupo.seleccionado)return grupo;
 		});
		
		
		var eliminados=grupos.filter(function(grupo){
			
			if(grupo.seleccionado){
				
				delete grupo.seleccionado;

				return grupo
			}
				
		});
		
//  		$scope.message=eliminados;
 		
		grupoAPI.eliminarMasivoGrupo(eliminados).success(function(grupos){
		
			console.log("Eliminados Correctamente");
			
		}).error(function(eliminados){

			gestionarError(error,status);
		});
		
		$scope.criterioDeBuscaGrupo="";
		
		$('#mdGrupoEliminar1').closeModal();
		requesFocus('descripcion_grupo');
	};
	
	$scope.isGrupoSeleccionado=function(grupos){
		return grupos.some(function(grupo){
			return grupo.seleccionado;
		});
		
	};
	
	
	$scope.cancelar=function(){
		cancelar();
			
	};
	var cancelarError=function cancelarE(){
		$(msjErrorGrupo).html("");
		$(tituloErrorGrupo).html("");
		$scope.error=false;
	}
	var cancelarOk=function cancelarOk(){
		$(msjGrupo).html("");
		$(tituloMsjGrupo).html("");
		$scope.ok=false;
	}
		
	var cancelar=function(){
		$scope.grupo=undefined;
		
		$scope.$watch(function(){	
			Materialize.updateTextFields();
		});
		
		$scope.grupo={estado:'1'};
		
		//$scope.criterioDeBusca="";
		requesFocus('descripcion_grupo');
		
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
	
		$(msjErrorGrupo).html(msj);
		var etitulo="<i class='material-icons left'>error</i>"+"ERROR: "+error.code+", "+error.message+" </br> "+" <HR> ";
		$(tituloErrorGrupo).html(etitulo);
		
		$scope.error=true;
		
		cancelarOk();
	}
	
	
	$scope.seleccionarGrupo=function(grupoparam){
		
		//var producto={grupo:grupoparam};
		
		//$state.go('productos',{producto:JSON.stringify(producto)});
		$scope.$parent.producto.grupo=grupoparam;
		$('#mdgrupo1').closeModal();
		
	}
	
	$scope.ordenarPorGrupo = function (campo) {
		$scope.criterioDeOrdenacionGrupo = campo;
		$scope.direccionDeOrdenacionGrupo = !$scope.direccionDeOrdenacionGrupo;
	};
	
	
	$('ul.tabs').tabs('select_tab', 'listado_grupo1');
	
		cargarGrupos();
	});
	
	
	
