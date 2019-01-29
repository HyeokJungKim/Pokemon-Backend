class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokeballs, -> { order(:team_number) }
  has_many :pokemons, through: :pokeballs

  def highest_team_number
    pokeballs.max_by(&:team_number).team_number
  end

  def pokemon_team
    pokeballs.where(onTeam: true)
  end
end
