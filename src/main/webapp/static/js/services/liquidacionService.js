/**
 * 
 */


angular.module("menu").factory("liquidacionAPI",function($http,config){

var _getLiquidacions=function(){
	
	return $http.get(config.baseUrl+"/liquidacion");
};

var _getLiquidacion = function (id) {
	return $http.get(config.baseUrl+"/liquidacion/"+id);
};

var _saveLiquidacion=function(liquidacion){
	
	return $http.post(config.baseUrl+"/liquidacion",liquidacion);
	
};

var _eliminarMasivoLiquidacion=function(liquidacions){
	
	
return	$http.post(config.baseUrl+"/liquidacion/eliminar_masivo",liquidacions);
	
};


return {
	
	getLiquidacions:_getLiquidacions,
	saveLiquidacion:_saveLiquidacion,
	eliminarMasivoLiquidacion:_eliminarMasivoLiquidacion,
	getLiquidacion:_getLiquidacion
	
};
	
	
	
	
});