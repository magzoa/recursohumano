/**
 * 
 */


angular.module("menu").factory("conceptoAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getConceptos=function(){
	
	return $http.get(config.baseUrl+"/concepto");
};	

var _saveConcepto=function(concepto){
	
	return $http.post(config.baseUrl+"/concepto",concepto);
	
};

var _eliminarMasivo=function(conceptos){
	
	
return	$http.post(config.baseUrl+"/concepto/eliminar_masivo",conceptos);
	
};


return {
	
	getConceptos:_getConceptos,
	saveConcepto:_saveConcepto,
	eliminarMasivo:_eliminarMasivo
	
};
	
	
	
	
});