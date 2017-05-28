/**
 * 
 */


angular.module("menu").factory("salarioAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getSalarios=function(){
	
	return $http.get(config.baseUrl+"/salario");
};	

var _saveSalario=function(salario){
	
	return $http.post(config.baseUrl+"/salario",salario);
	
};

var _eliminarMasivo=function(salarios){
	
	
return	$http.post(config.baseUrl+"/salario/eliminar_masivo",salarios);
	
};


return {
	
	getSalarios:_getSalarios,
	saveSalario:_saveSalario,
	eliminarMasivo:_eliminarMasivo
	
};
	
	
	
	
});