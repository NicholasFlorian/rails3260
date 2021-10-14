Rails.application.routes.draw do

  # include user pages
  resources :users
  #get '/index', to: 'users#index"'
  #get '/create', to: 'users#index'


  # sign in page
  get     'sign_in', to: 'sessions#sign_in'
  post    '/login', to: 'sessions#create' 
  delete  '/logout', to: 'sessions#destroy'

  # user page
  get     'user', to: 'sessions#user'

  
  # set our root
  root 'sessions#sign_in'
end
