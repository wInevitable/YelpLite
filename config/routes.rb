YelpLite::Application.routes.draw do

  #devise_for :users

  root to: 'pages#home'
  get '/', to: 'pages#home'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]

  shallow do
    resources :businesses, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :reviews
    end
  end

  get '/review/:id/delete', to: 'reviews#delete'
end
