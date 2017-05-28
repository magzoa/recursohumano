/**
 * 
 */


angular.module("menu").config(['$stateProvider','$urlRouterProvider','$locationProvider',function($stateProvider, $urlRouterProvider,$locationProvider){
	// Utilizando o HTML5 History API
	$locationProvider.html5Mode(true);
	
	$stateProvider.state('clientes', {
        templateUrl: 'static/view/cliente/form.html',
        url: '/clientes',
        controller: 'clienteController',
		resolve:{
			clientes:function(clienteAPI){
				
				return clienteAPI.getClientes();
			}
		//agregar otro si necesario
	}
    })
	
	
    	$stateProvider.state('departamentos', {
        templateUrl: 'static/view/departamento/form.html',
        url: '/departamentos',
        controller: 'departamentoController',
		resolve:{
			departamentos:function(departamentoAPI){
				
				return departamentoAPI.getDepartamentos();
			}
		//agregar otro si necesario
	}
    })
	 
    
    
    $stateProvider.state('salarios', {
        templateUrl: 'static/view/salario/form.html',
        url: '/salarios',
        controller: 'salarioController',
		resolve:{
			salarios:function(salarioAPI){
				
				return salarioAPI.getSalarios();
			},salario: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
    
    $stateProvider.state('usuarios', {
        templateUrl: 'static/view/usuario/form.html',
        url: '/usuarios',
        controller: 'usuarioController',
		resolve:{
			usuarios:function(usuarioAPI){
				
				return usuarioAPI.getUsuarios();
			},usuario: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
    
     $stateProvider.state('contratos', {
        templateUrl: 'static/view/contrato/form.html',
        url: '/contratos',
        controller: 'contratoController',
		resolve:{
			contratos:function(contratoAPI){
				
				return contratoAPI.getContratos();
			},contrato: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
    
    
      $stateProvider.state('conceptos', {
        templateUrl: 'static/view/concepto/form.html',
        url: '/conceptos',
        controller: 'conceptoController',
		resolve:{
			conceptos:function(conceptoAPI){
				return conceptoAPI.getConceptos();
			},concepto: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
    
     $stateProvider.state('personals', {
        templateUrl: 'static/view/personal/form.html',
        url: '/personals',
        controller: 'personalController',
		resolve:{
			personals:function(personalAPI){
				
				return personalAPI.getPersonals();
			},personal: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
	
    
	$stateProvider.state('liquidacions', {
        templateUrl: 'static/view/liquidacion/form.html',
        url: '/liquidacions',
        controller: 'liquidacionController',
		resolve:{
			liquidacions:function(liquidacionAPI){
				
				return liquidacionAPI.getLiquidacions();
			},liquidacion: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
	
	

    
    
    //Falta estudiar mas paso de parametros para aplicar
    

	
    //$state.params.obj
//	
//    producto: function (productoAPI, $transition$) {
//				console.log("Parametro"+$transition$.params().id);
//				
//				return productoAPI.getProducto($transition$.params().id);
//			},
    
    

	
	
//	$routeProvider.when("/error", {
//		templateUrl: "static/view/templates/error.html"
//	});
	
    
   
    
    $stateProvider.state('fondo', {
        templateUrl: 'static/view/templates/fondo.html',
        url: '/fondo'
        
    })
	
//	$routeProvider.when("/fondo",{
//		templateUrl:"static/view/templates/fondo.html",
//	});
	
//	$routeProvider.when("/nuevoCliente",{
//		templateUrl:"view/cliente/form.html",
//		controller:"clienteController",
//		
//	});
	
	
	$urlRouterProvider.otherwise("/fondo");
	
	 // Utilizando o HTML5 History API
	  $locationProvider.html5Mode(true);
	  
	
	
}]);