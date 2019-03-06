class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokeballs, -> { order(position: :asc) }
  has_many :pokemons, through: :pokeballs

  def pokemon_team
    pokeballs.where(onTeam: true)
  end
end
