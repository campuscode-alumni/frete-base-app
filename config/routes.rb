Rails.application.routes.draw do
  resources :products
  resources :product_categories, only: [:new, :create, :show] do
    resources :products, only: [:create, :new, :show]
  end
  devise_for :users
  root 'welcome#index'
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy' 
    get "/home", :to => "devise/sessions#new", :as => :home     
  end 
end
