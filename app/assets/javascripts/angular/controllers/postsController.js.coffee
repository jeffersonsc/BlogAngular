angular.module('blog').controller('postsController', ['$scope', 'posts', '$routeParams', '$filter', '$location', ($scope, posts, $routeParams, $filter, $location) -> 
	$scope.contents = ''
	$scope.post = ''

	posts.getPost($routeParams.id).success((data) ->
			$scope.post = data
		)

	$scope.createPost = () ->
		if $scope.post.title == ''
			return false

		posts.createPost($scope.post)
			.success((data) ->
				$scope.post.title = ''
				$location.path('/')
			)

	$scope.updatePost = () ->
		if $scope.post.title == ''
			return false

		posts.updatePost($routeParams.id, $scope.post)
			.success((data) ->
				$scope.post.title = ''
				$location.path('/')
			)			
		
])
