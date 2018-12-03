class TrainerSerializer
  include FastJsonapi::ObjectSerializer
  has_many :pokeballs
  attributes :id, :username, :money
end
