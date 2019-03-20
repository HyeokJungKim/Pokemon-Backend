class PokeballsController < ApplicationController
  before_action :check_token

  def update
    @pokeball = Pokeball.find(params[:id])
    if params[:moveAcross]
      @pokeball.update(pokeball_params.merge(onTeam: !@pokeball.onTeam))
    else
      @pokeball.update(pokeball_params)
    end
    @trainer.update_order
    options = {include: [:pokeballs]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  def evolve
    @pokeball = @trainer.pokeballs.find_by(id: params[:id])
    if @pokeball && @pokeball.can_evolve?
      @new_pokemon_id = @pokeball.pokemon.families.first.evolution_id
      @pokeball.update(pokemon_id: @new_pokemon_id)
      render json: PokeballSerializer.new(@pokeball)
    else
      render json: {error: "Couldn't find Pokemon with that ID."}
    end
  end

  private
  def pokeball_params
    params.require(:pokeball).permit(:position)
  end
end
