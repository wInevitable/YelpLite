YelpLite::Application.routes.draw do

  #devise_for :users

  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :edit, :update]
  end

  shallow do
    namespace :api, defaults: { format: :json } do
      resources :businesses, only: [:new, :create, :edit, :update, :show, :destroy] do
        resources :reviews
      end
    end
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]

  shallow do
    resources :businesses, only: [:new, :create, :edit, :update, :show, :destroy] do
      member do
        get 'delete'
      end
      resources :reviews do
        member do
          get 'delete'
        end
      end
    end
  end

  get '/root', to: 'pages#root'
  get '/search', to: 'pages#search'

  get 'auth/facebook/callback', to: 'sessions#facebook', as: 'facebook_auth'
  get 'auth/twitter/callback', to: 'sessions#twitter', as: 'twitter_auth'
end
