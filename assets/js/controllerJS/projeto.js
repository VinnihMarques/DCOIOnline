'use strict';
//CONTROLLER RESPONSÁVEL POR CADASTRAR UMA NOVA UNIDADE DE NEGOCIO
app.controller('ProjetoListaDados',['$scope','$rootScope','$http','$location','$routeParams',function($scope,$rootScope,$http,$location,$routeParams){
	$scope.this = this;
	$scope.clientes = [];
	$scope.cliente = {};
	$scope.unidades = [];
	$scope.unidade = {};
	$scope.projetos = [];
	$scope.projeto = {};
	$scope.projetoUnidade = {};


	$http.get('/cliente/').success(function(resp){
		$scope.clientes = resp;
	});

	$http.get('/projeto/').success(function(resp){
		$scope.projetos = resp;
	});



	this.carregaUnidades = function(){
		
		if($scope.cliente != null){
			$scope.unidades = $scope.cliente.unidades;
		}
	}

	this.cadastrarProjetoUnidade = function(){
		$scope.projetoUnidade.proj_cod = $scope.projeto.proj_cod;
		$scope.projetoUnidade.uni_cod = $scope.unidade.uni_cod;
		$http.post('/projetounidade/create', $scope.projetoUnidade).success(function(resp){
			console.log('Projeto_Unidade Cadastrado!');

			if($scope.projeto.id == 2 || 3){
				$location.path('/cadastroAquisicao/'+resp.pro_uni_cod);


			}
			else{

				console.log('NÃO SOU CORE NEM ENTERPRISE!');

			}

		});
	};
}]);


