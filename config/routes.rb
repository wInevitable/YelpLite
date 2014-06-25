YelpLite::Application.routes.draw do

  #devise_for :users
  
  root to: 'sessions#index'
  resource :session, :only => [:create, :destroy, :new]
  resources :users, :only => [:create, :new, :show, :edit, :update]
end
