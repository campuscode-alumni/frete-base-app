Rails.application.routes.draw do

  resources :product_categories, only: [:index, :show, :new, :create] do
    resources :products, only: [:new, :create, :show]
  end
  
  devise_for :users
  root 'home#index'
end
