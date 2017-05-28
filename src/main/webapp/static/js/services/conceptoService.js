/**
 * 
 */


angular.module("menu").factory("usuarioAPI",function($http,config){
	
	
	console.log(config);
	console.log($http);
	

var _getUsuarios=function(){
	
	return $http.get(config.baseUrl+"/usuario");
};	

var _saveUsuario=function(usuario){
	
	return $http.post(config.baseUrl+"/usuario",usuario);
	
};

var _eliminarMasivo=function(usuarios){
	
	
return	$http.post(config.baseUrl+"/usuario/eliminar_masivo",usuarios);
	
};


return {
	
	getUsuarios:_getUsuarios,
	saveUsuario:_saveUsuario,
	eliminarMasivo:_eliminarMasivo
	
};
	
	
	
	
});