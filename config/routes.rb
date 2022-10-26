Rails.application.routes.draw do
  resources :products, only: [:index, :new,:create]
  resources :product_categories, only: [:create, :show]
  devise_for :users
  root 'welcome#index'
end
