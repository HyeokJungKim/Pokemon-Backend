class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokeballs
  has_many :pokemons, through: :pokeballs
  # 
  # def pokemon_level(pokemon)
  #   pokemons.find{|poke| poke === pokemon}.
  # end
end
