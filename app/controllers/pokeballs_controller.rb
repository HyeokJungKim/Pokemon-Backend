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
    elsif !@pokeball.can_evolve?
      render json: {error: "This pokemon cannot evolve."}
    else
      render json: {error: "Couldn't find Pokemon with that ID."}
    end
  end

  def stone_evolve
    @pokeball = @trainer.pokeballs.find_by(id: params[:id])
    if @pokeball && @pokeball.can_evolve?
      @stone = Item.find_by(id: params[:stone_id])
      if @stone
        whichPokemonToBecome = @pokeball.pokemon.families.find_by(level: @stone.stone_id)
        usedStone = @trainer.inventories.find_by(item_id: params[:stone_id])
        if whichPokemonToBecome && usedStone.use(1)
          @pokeball.update(pokemon_id: whichPokemonToBecome.evolution_id)
          @trainer.reload
          options = {include: [:pokeballs, :inventories]}
          render json: TrainerSerializer.new(@trainer, options).serialized_json
        else
          render json: {error: "You don't have enough stones!"}
        end
      else 
        render json: {error: "Invalid Stone ID"}
      end
    else 
      render json: {error: "Couldn't find Pokemon with that ID."}
    end
  end

  private
  def pokeball_params
    params.require(:pokeball).permit(:position)
  end
end
