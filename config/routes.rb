Rails.application.routes.draw do
  devise_for :users
  
  resources :posts do 
  	resources :comments
  end

  resources :comments do
  	resources :comments
  end

  resources :votes, only: [] do
    get 'up', on: :collection
    get 'down', on: :collection
  end

  
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
