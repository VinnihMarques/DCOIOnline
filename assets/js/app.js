'use strict';

var app = angular.module('DCOIOnlineApp', ['ngRoute']);

app.config(['$routeProvider', '$locationProvider',
 function($routeProvider, $locationProvider) {
   $routeProvider
     .when('/clientes', {
       templateUrl: '/templates/Clientes/cadastroCliente.html'
     })
     .when('/aquisicao',{
     	templateUrl: '/templates/Aquisicoes/cadastroAquisicao.html'
     	  })
     	

   $locationProvider.html5Mode(true);
}])

app.controller('DCOIOnlineAppController', ['$scope', '$rootScope', function($scope, $rootScope){
console.log("DCOIOnlineAppController");
}]);