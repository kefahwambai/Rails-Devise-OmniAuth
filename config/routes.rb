Rails.application.routes.draw do
  # Define your custom sign-in route
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/users', to: 'users#index'
  # get 'me', to: 'users#show'
  # get 'auth/:provider/callback', to: 'sessions#create'

  # Defines the root path route ("/")
  # root "articles#index"
end

