Rails.application.routes.draw do
  
  root to: 'home#index'

  resources :posts, only: [:index, :create,:show] do
  	resources :comments, only: [:create, :show] do
  		member do
  			put '/upvote' => 'comments#upvote'
  		end
  	end

  	member do
  		put '/upvote' => 'posts#upvote'
  	end
  end

end
