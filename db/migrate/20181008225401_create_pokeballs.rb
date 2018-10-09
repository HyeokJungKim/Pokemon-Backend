class CreatePokeballs < ActiveRecord::Migration[5.2]
  def change
    create_table :pokeballs do |t|
      t.integer :level
      t.integer :experience
      t.references :trainer, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true

    end
  end
end
