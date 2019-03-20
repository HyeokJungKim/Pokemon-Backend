class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokeballs, -> { order(position: :asc) }
  has_many :pokemons, through: :pokeballs

  has_many :inventories, -> { order(id: :asc) }
  has_many :items, through: :inventories

  def pokemon_team
    pokeballs.where(onTeam: true)
  end

  def update_order
    all_pokeballs = pokeballs
    team = all_pokeballs.select{|pb| pb.onTeam}
    box = all_pokeballs.select{|pb| !pb.onTeam}
    team.each.with_index(1) do |pokemon, index|
      pokemon.update(position: index)
    end
    box.each.with_index(team.length + 1) do |pokemon, index|
      pokemon.update(position: index)
    end
  end
end
