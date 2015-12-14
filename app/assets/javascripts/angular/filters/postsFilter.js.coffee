angular.module('blog').filter('postsFilter', (posts, post_id) ->
	for post in posts
		if post.id == 1
			console.log(post.title)


)