Rails.application.routes.draw do
    root 'home#index'
    resources :products, only: [:new, :create]
end
