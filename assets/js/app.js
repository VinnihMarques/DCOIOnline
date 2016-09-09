'use strict';

var app = angular.module('DCOIOnlineApp', ['ngRoute']);

app.config(['$routeProvider', '$locationProvider',
 function($routeProvider, $locationProvider) {
   $routeProvider
     .when('/consultaUsuario', {
       templateUrl: '/templates/Usuario/consultaUsuario.html'
     })
     .when('/editaUsuario/:id', {
       templateUrl: '/templates/Usuario/editaUsuario.html'
     })
     
     .when('/cadastroUsuario', {
       templateUrl: '/templates/Usuario/cadastroUsuario.html'
     })
     .when('/aquisicao',{
     	templateUrl: '/templates/Aquisicoes/cadastroAquisicao.html'
     	  })
     .when('/aquisicaoCarrosel',{
     	templateUrl: '/templates/Aquisicoes/cadastroAquisicaoCarrosel.html'
     	  })
     	

   $locationProvider.html5Mode(true);
}])

app.controller('DCOIOnlineAppController', ['$scope', '$rootScope', function($scope, $rootScope){
console.log("DCOIOnlineAppController");
}]);