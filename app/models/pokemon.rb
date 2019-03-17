class Pokemon < ApplicationRecord
  has_many :pokeballs
  has_many :trainers, through: :pokeballs

  has_many :families
  has_many :evolutions, through: :families, source: :evolution

  def image
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{self.id}.png"
  end

  def evolutionLevel
    if !self.families.exists?
      return 0
    else
      return self.families[0].level
    end
  end

end
