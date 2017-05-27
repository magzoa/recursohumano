angular.module("menu").filter("reporte",function(){
	
	return function(input,scope){
		
		console.log(input);
		
		scope.productos=input;
		
		return input;
		
	};
	
	
});