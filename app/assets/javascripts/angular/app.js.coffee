app = angular.module('blog', ['templates', 'ngRoute', 'ngResource'])

app.config(['$httpProvider', '$routeProvider', ($httpProvider, $routeProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

	$routeProvider
		.when('/', {
			templateUrl: 'assets/angular/templates/home/home.html',
			controller: 'homeController'
		})

		.when('/posts/new', {
			templateUrl: 'assets/angular/templates/posts/newPost.html',
			controller: 'postsController'
		})

		.when('/posts/:id/edit', {
			templateUrl: 'assets/angular/templates/posts/editPost.html',
			controller: 'postsController'
		})

		.when('/posts/:id/delete', {
			controller: 'postsController'
		})

		.when('/posts/:id', {
			templateUrl: 'assets/angular/templates/posts/showPost.html',
			controller: 'postsController'
		})

		.otherwise({
			redirectTo: '/'
		})
])

app.run(() -> 
	console.log('App iniciado corretamente')
)