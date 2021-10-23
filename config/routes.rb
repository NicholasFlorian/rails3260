Rails.application.routes.draw do

  # scaffold routes
  resources :dies
  resources :coins
  resources :users

  # sign in page
  get     'register', to:     'sessions#register'
  post    'sign_in', to:      'sessions#sign_in' 
  post    'sign_up', to:      'sessions#sign_up'

  # user page
  get     'profile', to:      'sessions#profile'
  delete  'sign_out', to:     'sessions#sign_out'
  delete  'delete_user', to:  'sessions#delete_user'

  # game page
  get     'game', to:         'sessions#game'
  post    'turn', to:         'sessions#turn'
  
  # set our root
  root 'sessions#register'
  
end
