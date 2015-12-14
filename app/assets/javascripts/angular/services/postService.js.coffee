angular.module('blog').factory('posts', () -> 
	o = {
		data: [
			{title: 'Como ganhar dinheiro', contents: 'teste...', upvotes: 0, id: 1}
			{title: 'Como ganhar dinheiro pt 2', contents: 'teste 1...', upvotes: 0, id: 2}
			{title: 'Como ganhar dinheiro pt 3', contents: 'teste 2...', upvotes: 0, id: 3}
		]
	}
)