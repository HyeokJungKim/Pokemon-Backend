Rails.application.routes.draw do
  get '/trainers/persist', to: 'trainers#persist'
  post '/login', to: 'trainers#login'
  post '/catch/:id', to: 'trainers#catch'
  patch '/pokeballs/:id/stone_evolve/:stone_id', to: 'pokeballs#stone_evolve'
  
  patch '/pokeballs/:id/evolve', to: 'pokeballs#evolve'
  patch '/inventories', to: 'inventories#buy'
  patch '/trainers/experience', to: 'trainers#experience'

  resources :trainers, only: [:show, :create]
  resources :pokemons, only: [:index]
  resources :pokeballs, only: [:update]
  resources :inventories, only: [:update]
end
