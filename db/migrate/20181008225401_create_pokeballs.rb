class CreatePokeballs < ActiveRecord::Migration[5.2]
  def change
    create_table :pokeballs do |t|
      t.integer :level
      t.integer :experience, default: 0
      t.references :trainer, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps
    end
  end
end
