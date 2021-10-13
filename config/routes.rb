Rails.application.routes.draw do

  # include user pages
  resources :users
  root 'users#index'
end
