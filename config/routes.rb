Rails.application.routes.draw do
  # Authentication routes
  post '/login', to: 'authentication#login'
  post '/register', to: 'users#create'

  # RESTful routes for reviews, products, and users
  resources :reviews, only: [:index, :show, :create, :destroy]
  resources :products, only: [:index, :show, :create, :destroy]
  resources :users
  resources :orders
  resources :categories
  resources :meat, :beverage, :bakery, :spices, :cereal, :dairy, :offers, :veggies_and_fruits, only: [:index, :show, :create, :update, :destroy]
  # Route for refreshing the JWT token
  post '/refresh', to: 'sessions#refresh'

  # Image routes
  post '/upload_image', to: 'images#upload_image'
  post '/seller/products/:product_id/upload_image', to: 'seller/products#upload_image'
end
