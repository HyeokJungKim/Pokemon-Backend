class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer

  def pokemon_information
    hash = self.pokemon.attributes.merge(self.attributes)
    hash.delete("pokedex_id")
    hash.delete("pokemon_id")
    hash.delete("trainer_id")
    hash.merge({image: self.pokemon.image})
  end

  def add_experience(num)
    self.experience += num
    if self.experience > self.level * 25
      self.level += 1
      self.experience = 0
    end
    self.save
  end
end
