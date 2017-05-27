angular.module("menu").directive("eliminarImpuesto", function () {
	return {
		templateUrl: "static/view/impuesto/eliminar_impuesto.html",
		replace: true,
		restrict: "AE",
		transclude: true

		
	};
});