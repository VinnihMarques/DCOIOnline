'use strict';

app.controller('UsuarioInserirController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	this.usuario = {};
	this.criar = function(){
		$http.post('/usuario/create', this.usuario).success(function(resp){
			console.log('Sucesso!');
			$location.path('/consultaUsuario/');

		});
	};

}]);

app.controller('UsuarioController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	$scope.thisUsuario = this;
	this.usuario = {};
	$scope.usuarios = [];

	$http.get('/usuario/').success(function(resp){
		$scope.usuarios = resp;
	});

	this.listarUsuarios = function(){
		$http.get('/usuario/').success(function(resp){
			$scope.usuarios = resp;
		});
	}

	this.remover = function(id){
		$http.delete('/usuario/' + id).success(function (resp){
			console.log('Usuário apagado');
			$scope.thisUsuario.listarUsuarios();
		});
	};


}]);

app.controller('UsuarioEditaController', ['$http', '$routeParams', '$scope', '$location', function($http, $routeParams, $scope, $location){
	$scope.usuario = {};
	
	$http.get('/usuario/'+ $routeParams.id).success(function(resp){
		$scope.usuario = resp;
	}).error(function(erro){
		console.log(erro);
	});

	this.editarUsuario = function(){
		$http.put('/usuario/' + $routeParams.id, $scope.usuario).success(function(resp){
			console.log('Usuário Editado!');
			$location.path('/consultaUsuario/');
		});
	};
}]);

