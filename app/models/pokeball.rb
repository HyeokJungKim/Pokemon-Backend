class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer

  def pokemon_information
    hash = self.pokemon.attributes.merge({level: self.level, image: pokemon.image})
    hash.delete("pokedex_id")
    hash
  end
end
