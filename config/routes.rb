Rails.application.routes.draw do
  resources :products, only: [:new, :create]
  resources :product_categories, only: [:create, :show]
  devise_for :users
  root 'products#index'
end
