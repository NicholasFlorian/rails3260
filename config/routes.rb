Rails.application.routes.draw do

  # include user pages
  resources :users
  #get '/index', to: 'users#index"'
  #get '/create', to: 'users#index'


  # sign in page
  get     'register', to:   'sessions#register'
  post    '/sign_in', to:   'sessions#register' 
  delete  '/sign_out', to:  'sessions#register'

  # user page
  get     'profile', to:    'sessions#profile'

  
  # set our root
  root 'sessions#sign_in'
end
