Rails.application.routes.draw do
  # Authentication routes
  post '/login', to: 'authentication#login'
  post '/register', to: 'users#create'
  post '/sellers/register', to: 'sellers#create'
  post '/sellers/login', to: 'sellers_authentication#login'

  # RESTful routes for reviews, products, and users
  resources :reviews, only: [:index, :show, :create, :destroy]
  resources :products, only: [:index, :show, :create, :destroy]
  resources :sellers, only: [:index, :show, :create, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :orders
  resources :categories
  resources :products




  # Route for refreshing the JWT token
  post '/refresh', to: 'sessions#refresh'


  # Image routes
  post '/upload_image', to: 'images#upload_image'
  post '/seller/products/:product_id/upload_image', to: 'seller/products#upload_image'
end
