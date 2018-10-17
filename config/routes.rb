Rails.application.routes.draw do
  get '/trainers/persist', to: 'trainers#persist'
  post '/login', to: 'trainers#login'
  resources :trainers, only: [:show]
end
