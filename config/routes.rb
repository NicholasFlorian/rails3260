Rails.application.routes.draw do

  # include user pages
  resources :users


  # sign in page
  get     'register', to: 'sessions#register'
  post    'sign_in', to:  'sessions#sign_in' 
  post    'sign_up', to:  'sessions#sign_up'
  delete  'sign_out', to: 'sessions#sign_out'


  # user page
  get     'profile', to:    'sessions#profile'

  
  # set our root
  root 'sessions#register'
end
