class Inventory < ApplicationRecord
  belongs_to :trainer
  belongs_to :item

  def inventory_information
    hash = self.item.attributes.merge(self.attributes)
    hash.delete("trainer_id")
    hash.delete("item_id")
    hash.delete("created_at")
    hash.delete("updated_at")
    hash
  end
end
