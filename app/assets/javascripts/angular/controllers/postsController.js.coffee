angular.module('blog').controller('postsController', ['$scope', 'posts', '$routeParams', '$filter', '$location', ($scope, posts, $routeParams, $filter, $location) -> 
	$scope.title = ''
	$scope.contents = ''

	posts.getPost($routeParams.id).success((data) ->
			$scope.post = data
		)

	$scope.createPost = () ->
		if $scope.title == '' and $scope.contents == ''
			return false

		$scope.posts.push({title: $scope.title, contents: $scope.contents, upvotes: 0, id: $scope.posts.length + 1})
		$location.path('/')


		
])
