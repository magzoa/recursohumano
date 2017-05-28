/**
 * 
 */


angular.module("menu").factory("grupoAPI",function($http,config){

var _getGrupos=function(){
	
	return $http.get(config.baseUrl+"/grupo");
};

var _getGrupo = function (id) {
	return $http.get(config.baseUrl+"/grupo/"+id);
};

var _saveGrupo=function(grupo){
	
	return $http.post(config.baseUrl+"/grupo",grupo);
	
};

var _eliminarMasivoGrupo=function(grupos){
	
	
return	$http.post(config.baseUrl+"/grupo/eliminar_masivo",grupos);
	
};


return {
	
	getGrupos:_getGrupos,
	saveGrupo:_saveGrupo,
	eliminarMasivoGrupo:_eliminarMasivoGrupo,
	getGrupo:_getGrupo
	
};
	
	
	
	
});