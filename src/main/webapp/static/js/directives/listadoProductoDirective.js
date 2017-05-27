angular.module("menu").directive("listadoProducto", function () {
	return {
		templateUrl: "static/view/producto/listado.html",
		replace: true,
		restrict: "AE",
		transclude: true

		
	};
});