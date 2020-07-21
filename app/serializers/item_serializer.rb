class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :image, :price, :stone_id
end
