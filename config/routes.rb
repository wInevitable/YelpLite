YelpLite::Application.routes.draw do

  #devise_for :users

  root to: 'pages#home'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]

  shallow do
    resources :businesses, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :reviews
    end
  end

  get '/business/:id/delete', to: 'businesses#delete', as: 'delete_business'

  get '/reviews/:id/delete', to: 'reviews#delete', as: 'delete_review'

  get '/search', to: 'pages#search'

  get 'auth/facebook/callback', to: 'sessions#facebook', as: 'facebook_auth'
  get 'auth/twitter/callback', to: 'sessions#twitter', as: 'twitter_auth'
end
