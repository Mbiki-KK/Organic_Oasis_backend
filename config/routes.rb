Rails.application.routes.draw do
  # Authentication routes
  post '/login', to: 'authenticate#create'
  post '/register', to: 'users#create'

  # RESTful routes for reviews, products, and users
  resources :reviews, only: [:index, :show, :create, :destroy]
  resources :products, only: [:index, :show, :create, :destroy]
  resources :users

  # Route for refreshing the JWT token
  post '/refresh', to: 'sessions#refresh'
end
