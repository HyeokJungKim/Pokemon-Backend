class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.belongs_to :trainer, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
