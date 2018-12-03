class Pokemon < ApplicationRecord
  has_many :pokeballs
  has_many :trainers, through: :pokeballs

  has_many :families
  has_many :evolutions, through: :families, source: :evolution

  def image
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{self.pokedex_id}.png"
  end

end
