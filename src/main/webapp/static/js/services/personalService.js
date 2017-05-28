/**
 * 
 */


angular.module("menu").factory("personalAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getPersonals=function(){
	
	return $http.get(config.baseUrl+"/personal");
};	

var _savePersonal=function(personal){
	
	return $http.post(config.baseUrl+"/personal",personal);
	
};

var _eliminarMasivo=function(personals){
	
	
return	$http.post(config.baseUrl+"/personal/eliminar_masivo",personals);
	
};


return {
	
	getPersonals:_getPersonals,
	savePersonal:_savePersonal,
	eliminarMasivo:_eliminarMasivo
	
};
	
	
	
	
});