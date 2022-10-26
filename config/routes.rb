Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :products, only: [:new, :create]
  resources :product_categories, only: [:new, :create, :show]
end
