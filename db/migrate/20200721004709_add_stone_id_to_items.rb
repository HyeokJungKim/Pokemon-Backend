class AddStoneIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :stone_id, :integer, default: 0
  end
end
