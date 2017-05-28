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
	
	
	
	
	
	
	
    $stateProvider.state('proveedores', {
        templateUrl: 'static/view/proveedor/form.html',
        url: '/proveedores',
        controller: 'proveedorController',
		resolve:{
			proveedores:function(proveedorAPI){
				
				return proveedorAPI.getProveedores();
			},proveedor: function () {
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
	
	$stateProvider.state('depositos', {
        templateUrl: 'static/view/deposito/form.html',
        url: '/depositos',
        controller: 'depositoController',
		resolve:{
			depositos:function(depositoAPI){
				
				return depositoAPI.getDepositos();
			},deposito: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
	
	
    
	$stateProvider.state('precios', {
        templateUrl: 'static/view/producto_precio/form.html',
        url: '/precios',
        controller: 'productoPrecioController',
        resolve:{
			precios:function(precioAPI){
				
				return precioAPI.getPrecios();
			},producto: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })

	
    
    $stateProvider.state('detalleProducto', {
        templateUrl: 'static/view/producto_precio/form.html',
        url: '/detalleProducto/{id}',
        controller: 'productoPrecioController',
        	resolve: {
			productos:function(productoAPI){	
				return productoAPI.getProductos();
			},
			producto:function(productoAPI,$stateParams){
				return productoAPI.getProducto($stateParams.id);
			}
		}
    })
    
    
	
     /*$stateProvider.state('detalleProductoCantidad', {
        templateUrl: 'static/view/producto_cantidad/form_cantidad.html',
        url: '/detalleProductoCantidad/{id}',
        controller: 'productoCantidadController',
        resolve: {
		productos:function(productoAPI){	
				return productoAPI.getProductos();
			},
			producto:function(productoAPI,$stateParams){
				return productoAPI.getProducto($stateParams.id);
			}
		}
    })*/
	
    
    
    //Falta estudiar mas paso de parametros para aplicar
    
	 $stateProvider.state('verProducto', {
        templateUrl: 'static/view/producto/form.html',
        url: '/verProducto/{id}',
        component: 'producto',
        controller: 'productoController',
        resolve: {
			
			productos:function(productoAPI){	
				return productoAPI.getProductos();
			},
			producto:function(productoAPI,$stateParams){
				return productoAPI.getProducto($stateParams.id);
			}
		}
    })
	
    //$state.params.obj
//	
//    producto: function (productoAPI, $transition$) {
//				console.log("Parametro"+$transition$.params().id);
//				
//				return productoAPI.getProducto($transition$.params().id);
//			},
    
    
    
    
    
	$stateProvider.state('cantidads', {
        templateUrl: 'static/view/producto_cantidad/form_cantidad.html',
        url: '/cantidads',
        controller: 'productoCantidadController',
        resolve:{
			cantidades:function(cantidadAPI){
				
				return cantidadAPI.getCantidads();
			},producto: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
	
$stateProvider.state('detalleProductoCantidad', {
    	params: {producto:null},
        templateUrl: 'static/view/producto_cantidad/listado.html',
        url: '/detalleProductoCantidad/',
        controller: 'listadoCantidadController',
        resolve:{
			cantidads:function(cantidadAPI,$stateParams){
				
			var pro=JSON.parse($stateParams.producto)
				
				retorno=cantidadAPI.getCantidadesPorIdProducto(pro.id);
				
				
				
				return retorno;
			},producto: function () {
				return {};
			}
			//agregar otro si necesario
		}
    })
	

	
	
	
	
	
	
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