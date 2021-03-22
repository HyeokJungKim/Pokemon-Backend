class PokemonsController < ApplicationController
  def index
    @pokemons = REDIS.get("pokemons")
    unless @pokemons
      @pokemons = PokemonSerializer.new(Pokemon.all).serialized_json
      REDIS.set("pokemons", @pokemons)
    end
    render json: JSON.load(@pokemons)
  end
end
