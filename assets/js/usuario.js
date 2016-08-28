'use strict';

app.controller('InserirUsuarioController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	this.usuario = {};
	this.criar = function(){
		$http.post('/usuario/create', this.usuario).success(function(resp){
			console.log('Sucesso!');
			$location.path('/Usuarios/listaUsuarios');

		});
};



}]);