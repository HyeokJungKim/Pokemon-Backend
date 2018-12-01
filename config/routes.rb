Rails.application.routes.draw do
  get '/trainers/persist', to: 'trainers#persist'
  post '/login', to: 'trainers#login'
  post '/catch/:id', to: 'trainers#catch'
  resources :trainers, only: [:show]
  resources :pokemons, only: [:index]
end
