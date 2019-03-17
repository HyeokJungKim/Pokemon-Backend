class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokeballs, -> { order(position: :asc) }
  has_many :pokemons, through: :pokeballs

  has_many :inventories
  has_many :items, through: :inventories
  
  def pokemon_team
    pokeballs.where(onTeam: true)
  end
end
