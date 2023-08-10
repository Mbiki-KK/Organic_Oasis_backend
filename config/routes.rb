Rails.application.routes.draw do
  resources :mpesas
  # Authentication routes
  post '/login', to: 'authentication#login'
  post '/register', to: 'users#create'

  # RESTful routes for reviews, products, and users
  resources :reviews, only: [:index, :show, :create, :destroy]
  resources :products #, only: [:index, :show, :create, :destroy, :update]
  resources :users
  resources :orders
  resources :order_items
  resources :categories

  # Route for refreshing the JWT token
  post '/refresh', to: 'sessions#refresh'

  # Image routes
  post '/upload_image', to: 'images#upload_image'
  post '/seller/products/:product_id/upload_image', to: 'seller/products#upload_image'

  # Mpesa Routes
  post 'stkpush', to: 'mpesas#stkpush'
  post 'stkquery', to: 'mpesas#stkquery'
end
