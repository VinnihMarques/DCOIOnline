'use strict';
//CONTROLLER RESPONSÁVEL POR CADASTRAR UM NOVO CLIENTE DA APLICAÇÃO NO BANCO DE DADOS
app.controller('ClienteInserirController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	this.cliente = {};
	$scope.thisContato = this;
	$scope.contato = {};
	
	this.criarCliente = function(){
		$http.post('/cliente/create', this.cliente).success(function(resp){
			console.log('Cliente cadatrado com sucesso!');

			$scope.thisContato.contato.cli_cod = resp.cli_cod;
			$http.post('/contato/create', $scope.thisContato.contato,$scope.thisContato.contato.cli_cod).success(function(resp){
			console.log('Contato cadatrado com sucesso!');
			$location.path('/consultaCliente/');
			});
			
		});
	};

}]);
//CONTROLLER RESPONSÁVEL POR RETORNAR DO BANCO DE DADOS OS CLLIENTES OU EXCLUIRDO SISTEMA PARA A APLICAÇÃO 
app.controller('ClienteController',['$scope','$rootScope','$http','$location',function($scope,$rootScope,$http,$location){
	$scope.thisCliente = this;
	this.cliente = {};
	$scope.clientes = [];

	$http.get('/cliente/').success(function(resp){
		$scope.clientes = resp;
	});

	this.listarClientes = function(){
		$http.get('/cliente/').success(function(resp){
			$scope.clientes = resp;
		});
	}

	this.remover = function(id){
		$http.delete('/cliente/' + id).success(function (resp){
			console.log('Cliente apagado');
			$scope.thisCliente.listarClientes();
		});
	};


}]);

//CONTROLLER RESPONSÁVEL POR EDITAR DADOS DE UM CLIENTE DO SISTEMA E ENVIAR A ATUALIZAÇÃO PARA O BANCO DE DADOS

app.controller('ClienteEditaController', ['$http', '$routeParams', '$scope', '$location', function($http, $routeParams, $scope, $location){
	$scope.cliente = {};
	$scope.contato = {};
	$scope.thisContato = this;
	
	$http.get('/cliente/'+ $routeParams.id).success(function(resp){
		$scope.cliente = resp;
		$scope.contato = resp.contatos[0];
	}).error(function(erro){
		console.log(erro);
	});

	this.editarCliente = function(){
		delete $scope.cliente.contatos;
		console.log($scope.cliente);
		$http.put('/cliente/' + $routeParams.id, $scope.cliente).success(function(resp){
			console.log('Cliente Editado!');
		

		$http.put('/contato/' + $scope.contato.con_cod,$scope.contato).success(function(resp){
			console.log('Contato atualizado com sucesso!');
			$location.path('/consultaCliente/');

		});
	});
	};
}]);

