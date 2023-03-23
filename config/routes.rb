Rails.application.routes.draw do

  resources :user_remark_ratings
  resources :remarks
  get 'comments/create'
  get 'comments/destroy'
  resources :categories

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tags
    resources :categories do
      resources :products do
        resources :remarks, only: [:create, :destroy]
      end
    end

    resources :products do
      resources :variants
    end

  resources :remarks do
    resources :user_remark_ratings
  end

    root 'categories#index'

    get '/products', to: 'products#index'
    get '/profiles', to:'products#profile'
  post '/products/:id/mark', to:'products#mark'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
