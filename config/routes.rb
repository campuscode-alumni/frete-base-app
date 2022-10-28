Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: %i[new create]

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index]
    end
  end
end
