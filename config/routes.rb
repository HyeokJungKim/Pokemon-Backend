Rails.application.routes.draw do
  resources :trainers, only: [:show]
  post '/login', to: 'trainers#login'
end
