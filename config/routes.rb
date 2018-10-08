Rails.application.routes.draw do
  resources :trainers, only: [:show]
end
