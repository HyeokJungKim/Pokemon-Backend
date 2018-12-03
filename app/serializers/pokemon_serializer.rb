class PokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :type_1, :type_2, :image

end
