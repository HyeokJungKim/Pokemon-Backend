class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    pokemons = PokemonSerializer.new(@pokemons).serialized_json
    render json: pokemons
  end
end
