class TrainerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :money

  has_many :pokemons
end
