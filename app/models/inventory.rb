class Inventory < ApplicationRecord
  belongs_to :trainer
  belongs_to :item

  validates :quantity, numericality: {greater_than_or_equal_to: 0}

  def inventory_information
    hash = self.item.attributes.merge(self.attributes)
    hash.delete("trainer_id")
    hash.delete("item_id")
    hash.delete("created_at")
    hash.delete("updated_at")
    hash
  end

  def buy(num)
    self.update!(quantity: self.quantity + num)
    self.trainer.update!(money: self.trainer.money + num * self.item.price)
  end

  def use(num)
    self.update!(quantity: self.quantity - num)
  end
end
