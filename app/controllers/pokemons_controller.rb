class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render json: PokemonSerializer.new(@pokemons).serialized_json
  end
end
