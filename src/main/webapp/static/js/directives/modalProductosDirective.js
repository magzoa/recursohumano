angular.module("menu").directive("modalProductos", function () {
	return {
		templateUrl: "static/view/venta/modal_productos.html",
		replace: true,
		restrict: "AE",
		transclude: true

		
	};
});