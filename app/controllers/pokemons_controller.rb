class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    json = Rails.cache.fetch("pokemons") do
      PokemonSerializer.new(@pokemons).serialized_json
    end
    render json: json
  end
end
