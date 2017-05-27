angular.module("menu").directive("eliminarPais", function () {
	return {
		templateUrl: "static/view/pais/eliminar_pais.html",
		replace: true,
		restrict: "AE",
		transclude: true

		
	};
});