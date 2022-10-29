Rails.application.routes.draw do
  resources :products
  resources :product_categories, only: [:new, :create, :show] do
    resources :products, only: [:create, :new, :show]
  end
  devise_for :users
  root 'welcome#index'
end
