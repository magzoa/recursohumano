/**
 * 
 */

	angular.module("menu").controller("conceptoController",function($scope,$http,conceptoAPI,$state,$stateParams,$rootScope){

		var foo = $stateParams.concepto;
		console.log(foo)
		
		var msjErrorConcepto="#emsj_concepto";
		var tituloErrorConcepto="#etitulo_concepto";
		var msjConcepto="#msj_concepto";
		var tituloMsjConcepto="#titulo_msj_concepto";
		
		$scope.conceptos=[];
		$scope.eliminados=[];
		$scope.error=false;
		$scope.ok=false;
		
		$scope.app="Registro de Concepto";
		
		 $('ul.tabs').tabs();
		 
	
		$('.mymodalconceptoeliminar').leanModal({
		      dismissible: false, // Modal can be dismissed by clicking outside of the modal
		      opacity: .5, // Opacity of modal background
		      in_duration: 300, // Transition in duration
		      out_duration: 200, // Transition out duration
		      starting_top: '4%', // Starting top style attribute
		      ending_top: '10%', // Ending top style attribute
		      ready: function(modal, trigger) {
		    	  console.log("eliminar Concepto");
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
		
		$scope.cargarModalConcepto=function(ventana,conceptos){
		//	$('#materialize-lean-overlay-1').remove();
			
//			$('.lean-overlay').each(function (i, obj) { if (i > 1) { $('.lean-overlay').slice(i).remove(); } });
//			  $('.lean-overlay').remove();
			
			
			$scope.$parent.conceptos=conceptos;
//			$rootScope.conceptos=conceptos;
			
			//$('#mdconcepto1').closeModal();
			//mdconcepto1
			//$('#mdconcepto1').css("background-color", "gray");
			  setTimeout(function () {        //'#mdconcepto1'
				  $(ventana).openModal();

				 console.log("Ingrese en abrir");
			  }, 500);
				
		}
		
		
	$scope.registrar=function(concepto){
	
		var validator = $("#registroformconcepto").validate();
		validator.form();
		
		if(validator.valid()){
			conceptoAPI.saveConcepto(concepto).success(function(){
				
				delete	$scope.concepto;
				
				var titulo="<i class='material-icons left'>done</i> Registrado correctamente";
				$(tituloMsjConcepto).html(titulo);
				
				$scope.ok=true;

				cancelarError();
				
				
				cargarConceptos();
					
				}).error(function(error, status){
				
					gestionarError(error,status);
					
				});
			
		}
		
		

		
	};	
	
	$rootScope.cargarConceptos=function(){
		cargarConceptos();
	}
	
	var cargarConceptos=function(){
		
		conceptoAPI.getConceptos().success(function(conceptos){
			
			
			$scope.conceptos=conceptos;
			
			
		}).error(function(error, status){
			
			gestionarError(error,status);
			
		});
		
		$scope.concepto={estado:'1'};
		requesFocus('descripcion_concepto');
	};
	
	
	$scope.editarConcepto=function(concepto){
		
		
		$scope.concepto=concepto;
		
		$scope.$watch(function(){
			
			Materialize.updateTextFields();
			
		});
		
		
		$('ul.tabs').tabs('select_tab', 'registro_concepto');
		requesFocus('descripcion_concepto');
		
		
		//cargarConcepto();
		
	};
	
	
$scope.eliminarMasivoConcepto=function(conceptos){
		
		$scope.conceptos=conceptos.filter(function(concepto){
			if(!concepto.seleccionado)return concepto;
 		});
		
		
		var eliminados=conceptos.filter(function(concepto){
			
			if(concepto.seleccionado){
				
				delete concepto.seleccionado;

				return concepto
			}
				
		});
		
//  		$scope.message=eliminados;
 		
		conceptoAPI.eliminarMasivoConcepto(eliminados).success(function(conceptos){
		
			console.log("Eliminados Correctamente");
			
		}).error(function(eliminados){

			gestionarError(error,status);
		});
		
		$scope.criterioDeBuscaConcepto="";
		
		$('#mdConceptoEliminar1').closeModal();
		requesFocus('descripcion_concepto');
	};
	
	$scope.isConceptoSeleccionado=function(conceptos){
		return conceptos.some(function(concepto){
			return concepto.seleccionado;
		});
		
	};
	
	
	$scope.cancelar=function(){
		cancelar();
			
	};
	var cancelarError=function cancelarE(){
		$(msjErrorConcepto).html("");
		$(tituloErrorConcepto).html("");
		$scope.error=false;
	}
	var cancelarOk=function cancelarOk(){
		$(msjConcepto).html("");
		$(tituloMsjConcepto).html("");
		$scope.ok=false;
	}
		
	var cancelar=function(){
		$scope.concepto=undefined;
		
		$scope.$watch(function(){	
			Materialize.updateTextFields();
		});
		
		$scope.concepto={estado:'1'};
		
		//$scope.criterioDeBusca="";
		requesFocus('descripcion_concepto');
		
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
	
		$(msjErrorConcepto).html(msj);
		var etitulo="<i class='material-icons left'>error</i>"+"ERROR: "+error.code+", "+error.message+" </br> "+" <HR> ";
		$(tituloErrorConcepto).html(etitulo);
		
		$scope.error=true;
		
		cancelarOk();
	}
	
	
	$scope.seleccionarConcepto=function(conceptoparam){
		
		//var producto={concepto:conceptoparam};
		
		//$state.go('productos',{producto:JSON.stringify(producto)});
		$scope.$parent.producto.concepto=conceptoparam;
		$('#mdconcepto1').closeModal();
		
	}
	
	$scope.ordenarPorConcepto = function (campo) {
		$scope.criterioDeOrdenacionConcepto = campo;
		$scope.direccionDeOrdenacionConcepto = !$scope.direccionDeOrdenacionConcepto;
	};
	
	
	$('ul.tabs').tabs('select_tab', 'listado_concepto1');
	
		cargarConceptos();
	});
	
	
	
