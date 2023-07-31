Rails.application.routes.draw do
  get 'address/index'
  get 'address/show'
  get 'address/create'
  get 'address/destroy'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'products/index'
  get 'products/show'
  get 'products/create'
  get 'products/destroy'
  get 'users/index'
  get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
