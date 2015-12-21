angular.module('blog').factory('posts',['$http', ($http) -> 
	
	o = {
		data: []
	}

	o.paserData = (data) ->
		angular.toJson(data)

	o.getAll = () ->
		$http.get('/posts.json')
			.success((data) ->
				o.data = data
			)
			.error((data, status) -> 
				console.log("Error", status)
			)

	o.getPost = (id) ->
		$http.get('/posts/' + id + '.json')
			.success((data) ->
				o.data.push(data)
			)
			.error((data, status) ->
				console.log('Error', status)
			)

	o.createPost = (data) ->
		$http.post('/posts', o.paserData(data))
			.success((data) ->
				o.data = data
			)
			.error((data, status) ->
				console.log(status)
			)

	o.updatePost = (id, data) ->
		$http.put('/posts/' + id + '.json', o.paserData(data))
			.success((data) ->
				o.data.push(data)
			)
			.error((data, status) ->
				console.log(status)
			)

	o.destroyPost = (id) ->
		$http.delete('/posts/' + id + '.json')
			.success((data) ->
				
			)
			.error((data, status) -> 
				console.log(status)
			)

	o.upvotePost = (post) ->
		$http.put('/posts/' + post.id + '/upvote.json')
			.success((data) -> 
				post.upvotes += 1
			)
			.error((data, status) ->
				console.log(status)
			)


	return o
])