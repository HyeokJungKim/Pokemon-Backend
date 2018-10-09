class TrainerSerializer
  include FastJsonapi::ObjectSerializer
  has_many :pokemons
  attributes :username, :money
end
