angular.module('blog').controller('homeController', ['$scope', 'posts', 'comments', ($scope, posts, comments) -> 
	$scope.title = 'Bem vindo - confira os posts'
	$scope.posts = {}
	$scope.showID = 0
	$scope.comment = ''

	posts.getAll().success((data) ->
		$scope.posts = data
	)

	$scope.deletePost = (id) ->		
		posts.destroyPost(id)
		.success((data) ->
			console.log(data)
			index = posts.data.indexOf(data)
			posts.data.splice(index, 1)
		)

	$scope.upvotePost = (post) ->
		posts.upvotePost(post)

	$scope.addComment = () ->
		console.log('OK')
])
