angular.module('blog').controller('postsController', ['$scope', 'posts', '$routeParams', '$filter', '$location', ($scope, posts, $routeParams, $filter, $location) -> 
	$scope.postID = parseInt($routeParams.id)
	$scope.posts = posts.data
	$scope.title = ''
	$scope.contents = ''

	$scope.createPost = () ->
		if $scope.title == '' and $scope.contents == ''
			return false

		$scope.posts.push({title: $scope.title, contents: $scope.contents, upvotes: 0, id: $scope.posts.length + 1})
		$location.path('/')

	$scope.editPost = () ->
		$scope.post = posts.data[$scope.postID]

	$scope.showPost = () ->
		$scope.post = posts.data[$scope.postID]
])
