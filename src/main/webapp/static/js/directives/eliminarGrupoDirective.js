angular.module("menu").directive("eliminarGrupo", function () {
	return {
		templateUrl: "static/view/grupo/eliminar_grupo.html",
		replace: true,
		restrict: "AE",
		transclude: true
	//	,
//		link:function(scope,element,attrs){
//			scope.titlegrupo=attrs.titlegrupo;
//			
//		}
		
	};
});