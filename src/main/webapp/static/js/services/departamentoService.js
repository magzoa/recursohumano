/**
 * 
 */


angular.module("menu").factory("departamentoAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getDepartamentos=function(){
	
	return $http.get(config.baseUrl+"/departamento");
};	

var _saveDepartamento=function(departamento){
	
	return $http.post(config.baseUrl+"/departamento",departamento);
	
};

var _eliminarMasivo=function(departamentos){
	
	
return	$http.post(config.baseUrl+"/departamento/eliminar_masivo",departamentos);
	
};


return {
	
	getDepartamentos:_getDepartamentos,
	saveDepartamento:_saveDepartamento,
	eliminarMasivo:_eliminarMasivo
	
};
	
	
	
	
});