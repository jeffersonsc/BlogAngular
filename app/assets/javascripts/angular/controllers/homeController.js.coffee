angular.module('blog').controller('homeController', ['$scope', 'posts', ($scope, posts) -> 
	$scope.title = 'Bem vindo - confira os posts'

	$scope.posts = posts.data

])
