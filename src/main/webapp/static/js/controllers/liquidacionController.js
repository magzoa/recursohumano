/**
 * 
 */

	angular.module("menu").controller("liquidacionController",function($scope,$http,liquidacionAPI,$state,$stateParams,$rootScope){

		var foo = $stateParams.liquidacion;
		console.log(foo)
		
		var msjErrorLiquidacion="#emsj_liquidacion";
		var tituloErrorLiquidacion="#etitulo_liquidacion";
		var msjLiquidacion="#msj_liquidacion";
		var tituloMsjLiquidacion="#titulo_msj_liquidacion";
		
		$scope.liquidacions=[];
		$scope.eliminados=[];
		$scope.error=false;
		$scope.ok=false;
		
		$scope.app="Registro de Liquidacion";
		
		 $('ul.tabs').tabs();
		 
	
		$('.mymodalliquidacioneliminar').leanModal({
		      dismissible: false, // Modal can be dismissed by clicking outside of the modal
		      opacity: .5, // Opacity of modal background
		      in_duration: 300, // Transition in duration
		      out_duration: 200, // Transition out duration
		      starting_top: '4%', // Starting top style attribute
		      ending_top: '10%', // Ending top style attribute
		      ready: function(modal, trigger) {
		    	  console.log("eliminar Liquidacion");
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
		
		$scope.cargarModalLiquidacion=function(ventana,liquidacions){
		//	$('#materialize-lean-overlay-1').remove();
			
//			$('.lean-overlay').each(function (i, obj) { if (i > 1) { $('.lean-overlay').slice(i).remove(); } });
//			  $('.lean-overlay').remove();
			
			
			$scope.$parent.liquidacions=liquidacions;
//			$rootScope.liquidacions=liquidacions;
			
			//$('#mdliquidacion1').closeModal();
			//mdliquidacion1
			//$('#mdliquidacion1').css("background-color", "gray");
			  setTimeout(function () {        //'#mdliquidacion1'
				  $(ventana).openModal();

				 console.log("Ingrese en abrir");
			  }, 500);
				
		}
		
		
	$scope.registrar=function(liquidacion){
	
		var validator = $("#registroformliquidacion").validate();
		validator.form();
		
		if(validator.valid()){
			liquidacionAPI.saveLiquidacion(liquidacion).success(function(){
				
				delete	$scope.liquidacion;
				
				var titulo="<i class='material-icons left'>done</i> Registrado correctamente";
				$(tituloMsjLiquidacion).html(titulo);
				
				$scope.ok=true;

				cancelarError();
				
				
				cargarLiquidacions();
					
				}).error(function(error, status){
				
					gestionarError(error,status);
					
				});
			
		}
		
		

		
	};	
	
	$rootScope.cargarLiquidacions=function(){
		cargarLiquidacions();
	}
	
	var cargarLiquidacions=function(){
		
		liquidacionAPI.getLiquidacions().success(function(liquidacions){
			
			
			$scope.liquidacions=liquidacions;
			
			
		}).error(function(error, status){
			
			gestionarError(error,status);
			
		});
		
		$scope.liquidacion={estado:'1'};
		requesFocus('monto_liquidacion');
	};
	
	
	$scope.editarLiquidacion=function(liquidacion){
		
		
		$scope.liquidacion=liquidacion;
		
		$scope.$watch(function(){
			
			Materialize.updateTextFields();
			
		});
		
		
		$('ul.tabs').tabs('select_tab', 'registro_liquidacion');
		requesFocus('monto_liquidacion');
		
		
		//cargarLiquidacion();
		
	};
	
	
$scope.eliminarMasivoLiquidacion=function(liquidacions){
		
		$scope.liquidacions=liquidacions.filter(function(liquidacion){
			if(!liquidacion.seleccionado)return liquidacion;
 		});
		
		
		var eliminados=liquidacions.filter(function(liquidacion){
			
			if(liquidacion.seleccionado){
				
				delete liquidacion.seleccionado;

				return liquidacion
			}
				
		});
		
//  		$scope.message=eliminados;
 		
		liquidacionAPI.eliminarMasivoLiquidacion(eliminados).success(function(liquidacions){
		
			console.log("Eliminados Correctamente");
			
		}).error(function(eliminados){

			gestionarError(error,status);
		});
		
		$scope.criterioDeBuscaLiquidacion="";
		
		$('#mdLiquidacionEliminar1').closeModal();
		requesFocus('monto_liquidacion');
	};
	
	$scope.isLiquidacionSeleccionado=function(liquidacions){
		return liquidacions.some(function(liquidacion){
			return liquidacion.seleccionado;
		});
		
	};
	
	
	$scope.cancelar=function(){
		cancelar();
			
	};
	var cancelarError=function cancelarE(){
		$(msjErrorLiquidacion).html("");
		$(tituloErrorLiquidacion).html("");
		$scope.error=false;
	}
	var cancelarOk=function cancelarOk(){
		$(msjLiquidacion).html("");
		$(tituloMsjLiquidacion).html("");
		$scope.ok=false;
	}
		
	var cancelar=function(){
		$scope.liquidacion=undefined;
		
		$scope.$watch(function(){	
			Materialize.updateTextFields();
		});
		
		$scope.liquidacion={estado:'1'};
		
		//$scope.criterioDeBusca="";
		requesFocus('monto_liquidacion');
		
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
	
		$(msjErrorLiquidacion).html(msj);
		var etitulo="<i class='material-icons left'>error</i>"+"ERROR: "+error.code+", "+error.message+" </br> "+" <HR> ";
		$(tituloErrorLiquidacion).html(etitulo);
		
		$scope.error=true;
		
		cancelarOk();
	}
	
	
	$scope.seleccionarLiquidacion=function(liquidacionparam){
		
		//var producto={liquidacion:liquidacionparam};
		
		//$state.go('productos',{producto:JSON.stringify(producto)});
		$scope.$parent.producto.liquidacion=liquidacionparam;
		$('#mdliquidacion1').closeModal();
		
	}
	
	$scope.ordenarPorLiquidacion = function (campo) {
		$scope.criterioDeOrdenacionLiquidacion = campo;
		$scope.direccionDeOrdenacionLiquidacion = !$scope.direccionDeOrdenacionLiquidacion;
	};
	
	
	$('ul.tabs').tabs('select_tab', 'listado_liquidacion1');
	
		cargarLiquidacions();
	});
	
	
	
