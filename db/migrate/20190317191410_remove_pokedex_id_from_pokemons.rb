class RemovePokedexIdFromPokemons < ActiveRecord::Migration[5.2]
  def change
    remove_column :pokemons, :pokedex_id, :integer
  end
end
