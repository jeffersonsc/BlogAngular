angular.module('blog').factory('posts',['$http', ($http) -> 
	
	o = {
		data: []
	}

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
				o.data = data
			)
			.error((data, status) ->
				console.log('Error', status)
			)

	return o
])