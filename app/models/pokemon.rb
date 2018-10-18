class Pokemon < ApplicationRecord
  has_many :pokeballs
  has_many :trainers, through: :pokeballs

  has_many :pokemon_evolutions, class_name: "Family"
  has_many :evolutions, through: :pokemon_evolutions, source: :evolution

  def image
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{self.pokedex_id}.png"
  end

  def self.random
    all.sample
  end

  def level(trainer)
    pokeballs.find{|pb| pb.trainer == trainer}.level
  end

  def experience(trainer)
    pokeballs.find{|pb| pb.trainer == trainer}.experience
  end
end
