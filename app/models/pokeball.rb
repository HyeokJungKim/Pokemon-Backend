class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer

  def pokemon_information
    hash = self.pokemon.attributes.merge({level: self.level, experience: self.experience, image: pokemon.image})
    hash.delete("pokedex_id")
    hash
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
