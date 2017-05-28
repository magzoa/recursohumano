/**
 * 
 */


angular.module("menu").factory("departamentoAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getDepartamento=function(){
	
	return $http.get(config.baseUrl+"/departamento");
};	

var _saveDepartamento=function(departamento){
	
	return $http.post(config.baseUrl+"/departamento",departamento);
	
};

var _eliminarMasivo=function(departamento){
	
	
return	$http.post(config.baseUrl+"/departamento/eliminar_masivo",departamento);
	
};


return {
	
	getDepartamento:_getDepartamento,
	saveDepartamento:_saveDepartamento,
	eliminarMasivo:_eliminarMasivo
	
};
	
	
	
	
});