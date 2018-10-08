class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_id
      t.string :type_1
      t.string :type_2

    end
  end
end
