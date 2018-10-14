class TrainerSerializer
  include FastJsonapi::ObjectSerializer
  has_many :pokemons
  attributes :id, :username, :money
end
