class PokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :type_1, :type_2, :image

end
