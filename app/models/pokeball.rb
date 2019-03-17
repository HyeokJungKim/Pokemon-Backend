class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer
  acts_as_list scope: :trainer

  def pokemon_information
    hash = self.pokemon.attributes.merge(self.attributes)
    hash.delete("pokedex_id")
    hash.delete("pokemon_id")
    hash.delete("trainer_id")
    hash.delete("created_at")
    hash.delete("updated_at")
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

  def can_evolve?
    self.pokemon.evolutions.first && self.level > self.pokemon.families.first.level 
  end
end
