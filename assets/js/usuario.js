'use strict';

app.controller('InserirUsuarioController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	this.usuario = {};
	this.criar = function(){
		$http.post('/usuario/create', this.usuario).success(function(resp){
			console.log('Sucesso!');
			$location.path('/consultaUsuario/');

		});
	};

}]);

app.controller('ConsultarUsuarioController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	$scope.thisUsuario = this;
	this.usuario = {};
	$scope.usuarios = [];

	$http.get('/usuario/').success(function(resp){
		$scope.usuarios = resp;
	});

	this.usuario = {};
	this.criar = function(){
		$http.post('/usuario/create', this.usuario).success(function(resp){
			console.log('Sucesso!');
			$location.path('/consultaUsuario');

		});
	};




}]);