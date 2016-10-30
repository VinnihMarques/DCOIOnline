'use strict';

var app = angular.module('DCOIOnlineApp', ['ngRoute']);

app.config(['$routeProvider', '$locationProvider',
 function($routeProvider, $locationProvider) {
   $routeProvider
     .when('/consultaUsuario', {// ROTA DE ACESSO PARA CONSULTA DE USUÁRIOS DO SISTEMA
       templateUrl: '/templates/Usuario/consultaUsuario.html'
     })
     .when('/editaUsuario/:id', {// ROTA DE ACESSO PARA EDIÇÃO DE USUÁRIOS DO SISTEMA
       templateUrl: '/templates/Usuario/editaUsuario.html'
     })
     
     .when('/cadastroUsuario', {// ROTA DE ACESSO PARA CADASTRO DE USUÁRIOS DO SISTEMA
       templateUrl: '/templates/Usuario/cadastroUsuario.html'
     })
     .when('/cadastroCliente',{// ROTA DE ACESSO PARA CADASTRO DE CLIENTES
     	templateUrl: '/templates/Cliente/cadastroCliente.html'
     })
     .when('/consultaCliente/',{// ROTA DE ACESSO PARA CONSULTA DE CLIENTES
     	templateUrl: '/templates/Cliente/consultaCliente.html'
     })
     .when('/editaCliente/:id',{// ROTA DE ACESSO PARA EDIÇÃO DE CLIENTES
      templateUrl: '/templates/Cliente/editaCliente.html'
    })

     .when('/cadastroUnidadeNegocio',{// ROTA DE ACESSO PARA CADASTRO DE UNIDADE DE NEGOCIO
      templateUrl: '/templates/UnidadeNegocio/cadastroUnidadeNegocio.html'
    })
     .when('/consultaUnidadeNegocio/',{// ROTA DE ACESSO PARA CONSULTA UNIDADE DE NEGOCIO
      templateUrl: '/templates/UnidadeNegocio/consultaUnidadeNegocio.html'
    })
     .when('/editaUnidadeNegocio/:id',{// ROTA DE ACESSO PARA EDIÇÃO UNIDADE DE NEGOCIO
      templateUrl: '/templates/UnidadeNegocio/editaUnidadeNegocio.html'
    })
       .when('/cadastroProjeto',{// ROTA DE ACESSO PARA CADASTRO DE PROJETO
        templateUrl: '/templates/Projeto/cadastroProjeto.html'
      })
     .when('/consultaProjeto/',{// ROTA DE ACESSO PARA CONSULTA DE PROJETO
      templateUrl: '/templates/Projeto/consultaProjeto.html'
    })
     .when('/editaProjeto/:id',{// ROTA DE ACESSO PARA EDIÇÃO DE PROJETO
      templateUrl: '/templates/Projeto/editaProjeto.html'
    })

     .when('/cadastroAquisicao/:id',{// ROTA DE ACESSO PARA CADASTRO DE ARQUISIÇÃO CO CLIENTE DE PROJETO
          templateUrl: '/templates/Aquisicao/cadastroAquisicao.html'
        })
     .when('/cadastroHub',{// ROTA DE ACESSO PARA TESTE
          templateUrl: '/templates/Hub/cadastroHub.html'
        })




        $locationProvider.html5Mode(true);
      }])

app.controller('DCOIOnlineAppController', ['$scope', '$rootScope', function($scope, $rootScope){
  console.log("DCOIOnlineAppController");
}]);