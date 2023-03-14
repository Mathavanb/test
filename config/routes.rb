Rails.application.routes.draw do

  devise_for :users
  resources :tags
    resources :categories do
      resources :products
    end

    resources :products do
      resources :variants
    end

    root 'categories#index'

    get '/products', to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
