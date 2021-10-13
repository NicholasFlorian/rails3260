Rails.application.routes.draw do

  get 'sessions/sign_in'
  # include user pages
  resources :users
  
  get '/index', to: 'users#index"'
  get '/create', to: 'users#index'
  
  # set our root
  root 'users#index'

end
