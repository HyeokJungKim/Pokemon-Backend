class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokeballs
  has_many :pokemons, through: :pokeballs
end
