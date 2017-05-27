angular.module("menu").directive("uiAlert", function () {
	return {
		templateUrl: "static/view/templates/alerta.html",
		replace: true,
		restrict: "AE",
		scope: {
			title: "@"
		},
		transclude: true
	};
});