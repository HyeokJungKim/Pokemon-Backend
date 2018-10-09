class Pokemon < ApplicationRecord
  has_many :pokeballs
  has_many :trainers, through: :pokeballs

  def image
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{self.pokedex_id}.png"
  end

  def self.random
    all.sample
  end

  def level(trainer)
    pokeballs.find{|pb| pb.trainer == trainer}.level
  end
end
