Rails.application.routes.draw do
  get '/trainers/persist', to: 'trainers#persist'
  post '/login', to: 'trainers#login'
  post '/catch/:id', to: 'trainers#catch'
  patch '/pokeballs/:id/evolve', to: 'pokeballs#evolve'
  patch '/inventories', to: 'inventories#update'
  resources :trainers, only: [:show]
  resources :pokemons, only: [:index]
  resources :pokeballs, only: [:update]
end
