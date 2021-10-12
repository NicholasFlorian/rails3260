Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  # our main sign-in page
  root "articles#sign_in"
  get "/articles", to: "articles#sign_in"
  
end
