/**
 * 
 */


angular.module("menu").factory("contratoAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getContratos=function(){
	
	return $http.get(config.baseUrl+"/contrato");
};	

var _saveContrato=function(contrato){
	
	return $http.post(config.baseUrl+"/contrato",contrato);
	
};

var _eliminarMasivo=function(contratos){
	
	
return	$http.post(config.baseUrl+"/contrato/eliminar_masivo",contratos);
	
};


return {
	
	getContratos:_getContratos,
	saveContrato:_saveContrato,
	eliminarMasivo:_eliminarMasivo
	
};
	

});