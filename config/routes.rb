Rails.application.routes.draw do
  devise_for :users
  
  resources :posts do 
  	resources :comments
  end

  resources :posts do 
  	member do 
  	  put "like", to: "posts#upvote"
   	  put "dislike", to: "posts#downvote"
    end
  end

  resources :comments do
  	resources :comments
  end

  
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
