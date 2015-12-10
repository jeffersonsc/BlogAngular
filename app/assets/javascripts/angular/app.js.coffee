app = angular.module('blog', ['templates', 'ngRoute', 'ngResource'])

app.config(['$httpProvider', '$routeProvider', ($httpProvider, $routeProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

	$routeProvider
		.when('/', {
			templateUrl: 'assets/angular/templates/home/home.html',
			controller: 'homeController'
		})
		.otherwise({
			redirectTo: '/'
		})
])

app.run(() -> 
	console.log('App iniciado corretamente')
)