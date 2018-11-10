class PokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :type_1, :type_2, :image

  attribute :level do |pokemon, params|
    if(params)
      pokemon.level(params[:trainer])
    end
  end

  # attribute :experience do |pokemon, params|
  #   pokemon.experience(params[:trainer])
  # end
end
