/**
 * Creado por Magno Portillo 13-10-2016
 */


angular.module("menu").config(function($routeProvider){
	

	$routeProvider.when("/clientes",{
		templateUrl:"static/view/cliente/form.html",
		controller:"clienteController",
		resolve:{
			clientes:function(clienteAPI){
				
				return clienteAPI.getClientes();
			}
			//agregar otro si necesario
		}
	});
	
	
	$routeProvider.when("/productos",{
		templateUrl:"static/view/producto/form.html",
		controller:"productoController",
		resolve:{
			productos:function(productoAPI){
				
				return productoAPI.getProductos();
			},producto: function () {
				return {};
			}
			//agregar otro si necesario
		}
	});
	
	$routeProvider.when("/proveedores",{
		templateUrl:"static/view/proveedor/form.html",
		controller:"proveedorController",
		resolve:{
			proveedores:function(proveedorAPI){
				
				return proveedorAPI.getProveedores();
			}
			//agregar otro si necesario
		}
	});
	
	$routeProvider.when("/usuarios",{
		templateUrl:"static/view/usuario/form.html",
		controller:"usuarioController",
		resolve:{
			usuarios:function(usuarioAPI){
				
				return usuarioAPI.getUsuarios();
			}
		}
		});

	$routeProvider.when("/depositos",{
		templateUrl:"static/view/deposito/form.html",
		controller:"depositoController",
		resolve:{
			depositos:function(depositoAPI){
				
				return depositoAPI.getDepositos();
			}
		}
	});
	
	$routeProvider.when("/precios",{
		templateUrl:"static/view/producto_precio/form.html",
		controller:"productoPrecioController",
		resolve:{
			precios:function(precioAPI){
				
				return precioAPI.getPrecios();
			},producto: function () {
				return {};
			}
			//agregar otro si necesario
		}
	});
	
	$routeProvider.when("/detalleProducto/:id", {
		templateUrl: "static/view/producto_precio/form.html",
		controller: "productoPrecioController",
		resolve: {
			producto: function (productoAPI, $route) {
				return productoAPI.getProducto($route.current.params.id);
			},productos:function(productoAPI){
				
				return productoAPI.getProductos();
			}
		}
	});
	
	$routeProvider.when("/detalleProductoCantidad/:id", {
		templateUrl: "static/view/producto_cantidad/form_cantidad.html",
		controller: "productoCantidadController",
		resolve: {
			producto: function (productoAPI, $route) {
				return productoAPI.getProducto($route.current.params.id);
			},productos:function(productoAPI){
				
				return productoAPI.getProductos();
			}
		}
	});
	
	
	$routeProvider.when("/verProducto/:id", {
		templateUrl: "static/view/producto/form.html",
		controller: "productoController",
		resolve: {
			producto: function (productoAPI, $route) {
				return productoAPI.getProducto($route.current.params.id);
			},
			productos:function(productoAPI){	
				return productoAPI.getProductos();
			}
		}
	});
	
	$routeProvider.when("/cantidads",{
		templateUrl:"static/view/producto_cantidad/form_cantidad.html",
		controller:"productoCantidadController",
		resolve:{
			cantidades:function(cantidadAPI){
				
				return cantidadAPI.getCantidads();
			},producto: function () {
				return {};
			}
			//agregar otro si necesario
		}
	});
	
	
	
	
	
	
	$routeProvider.when("/error", {
		templateUrl: "static/view/templates/error.html"
	});
	
	
	$routeProvider.when("/fondo",{
		templateUrl:"static/view/templates/fondo.html",
	});
	
//	$routeProvider.when("/nuevoCliente",{
//		templateUrl:"view/cliente/form.html",
//		controller:"clienteController",
//		
//	});
	
	
	$routeProvider.otherwise({redirectTo:"/fondo"});
	
	
	
});