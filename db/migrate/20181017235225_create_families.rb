class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.integer :pokemon_id
      t.integer :evolution_id
      t.integer :level

    end
  end
end
