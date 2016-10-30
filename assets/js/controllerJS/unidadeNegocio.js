'use strict';
//CONTROLLER RESPONSÁVEL POR CADASTRAR UMA NOVA UNIDADE DE NEGOCIO
app.controller('UnidadeNegocioInserirController',['$scope','$rootScope','$http','$location','$routeParams',function($scope,$rootScope,$http,$location,$routeParams){
	this.unidade = {};
	$scope.unidades = [];
	$scope.thisEndereco = this;
	$scope.thisUnidade = this;
	$scope.endereco = {};
	$scope.cliente = {};

	$http.get('/cliente/').success(function(resp){
		$scope.clientes = resp;
	});

	this.criarUnidade= function(){
		this.unidade.cli_cod = $scope.cliente.cli_cod;
		this.unidade.cli_nom = $scope.cliente.cli_nom;
		
		if($scope.thisUnidade.unidade.uni_cod == null) {
			$http.post('/unidadeNegocio/create', this.unidade).success(function(resp){
				console.log('Unidade de negócio cadatrada com sucesso!');
				resp.cli_nom = $scope.cliente.cli_nom;
				$scope.thisEndereco.endereco.uni_cod = resp.uni_cod;

				console.log('ESTOU AQUI ENDERECO',$scope.thisEndereco.endereco.uni_cod,$scope.thisEndereco.end_log);
				$http.post('/endereco/create', $scope.thisEndereco.endereco).success(function(resp){
					console.log('Endereco cadatrado com sucesso!');
					this.unidade.endereco = $scope.thisEndereco.endereco;

				});
				$scope.unidades.push(resp);
				$scope.unidades.push($scope.thisEndereco.endereco);

			});
		}
		else {
			$scope.thisUnidade.editaUnidade($scope.unidade.uni_cod);
		}
		$scope.thisUnidade.unidade={};
		$scope.thisEndereco.endereco={};
			
	};



	this.listarUnidades = function(){
		$http.get('/unidadenegocio/').success(function(resp){
			$scope.unidades = resp;
		});
	};

	this.carregarUnidade = function (unidade){
		$scope.thisUnidade.unidade = unidade;
		console.log(unidade);
	};


	this.removerUnidade = function(id){
		$http.delete('/unidadeNegocio/' + id).success(function (resp){
			console.log('Unidade de Negócio apagada');
			$scope.thisUnidade.listarUnidades();
		});
	};

	this.editaUnidade = function(id) {
		$http.put('/unidadenegocio/' + id, $scope.unidade).success(function(resp){
			console.log('Unidade de Negócio Editada!');

		});
	}

}]);


