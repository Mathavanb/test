Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tags
    resources :categories do
      resources :products
    end

    resources :products do
      resources :variants
    end

    root 'categories#index'

    get '/products', to: 'products#index'
    get '/profiles', to:'products#profile'
  post '/products/:id/mark', to:'products#mark'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
