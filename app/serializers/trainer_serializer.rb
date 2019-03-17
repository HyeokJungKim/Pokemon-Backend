class TrainerSerializer
  include FastJsonapi::ObjectSerializer
  has_many :pokeballs
  has_many :inventories
  attributes :id, :username, :money
end
