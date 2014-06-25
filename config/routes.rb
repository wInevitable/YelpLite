YelpLite::Application.routes.draw do

  #devise_for :users
  
  root to: 'sessions#index'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :businesses, only: [:new]
  end
  
  resources :businesses, only: [:create, :edit, :update, :show, :destroy]
end
