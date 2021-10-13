Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html


  # define our articles

  # our main sign-in page
  #root "articles#sign_in"
  root "sessions#root"
  #get "/articles", to: "articles#sign_in"

  # our user page

  # our playing page

  # our store page
  

  # define our user routes
  #resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  #get   '/sign_in', to: "sessions#sign_in"
  #post  '/sign_in', to: "sessions#sign_up"
  #get   '/sign_out', to: "sessions#destroy"
  #post  '/sign_out', to: "sessions#destroy"

end
