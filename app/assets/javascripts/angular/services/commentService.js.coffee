angular.module('blog').factory('comments',['$http', ($http) -> 
	
	c = {
		data: []
	}

	c.getComments = (post_id) ->
		$http.get('/posts/' + post_id + '/comments.json')
			.success((data) ->
				c.data = data
			)
			.error((data, status) ->
				console.log(status)
			)

	c.createComment = (data) ->
		$http.post('/posts/' + data.post_id +'/comments', data)
			.success((data) -> 
				post.comments.push(data)
			)
			.error((data, status) ->
				console.log(status)
			)

	return c

])