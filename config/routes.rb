Rails.application.routes.draw do
  # Authentication routes
  post '/login', to: 'authentication#login'
  post '/register', to: 'users#create'

  # RESTful routes for reviews, products, and users
  resources :reviews, only: [:index, :show, :create, :destroy]
  resources :products, only: [:index, :show, :create, :destroy]
  resources :sellers, only: [:index]
  resources :users
  resources :orders
  resources :categories
  resources :products




  # Route for refreshing the JWT token
  post '/refresh', to: 'sessions#refresh'
  post 'seller_login', to: 'seller_authentication#login'

  # Image routes
  post '/upload_image', to: 'images#upload_image'
  post '/seller/products/:product_id/upload_image', to: 'seller/products#upload_image'
end
