Rails.application.routes.draw do
  # get 'categories/index' ,to: 'categories#index'
  # get 'categories/show'
  # get 'address/index'
  # get 'address/show'
  # get 'address/create'
  # get 'address/destroy'
  # get 'reviews/index'
  # get 'reviews/show'
  # get 'reviews/create'
  # get 'reviews/destroy'
  # get 'products/index'
  # get 'products/show'
  # get 'products/create'
  # get 'products/destroy'
  # get 'users/index'
  # get 'users/show'

  resources :users
  resources :products
  resources :orders
  resources :reviews
  resources :addresses


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
