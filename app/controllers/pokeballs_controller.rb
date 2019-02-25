class PokeballsController < ApplicationController
  before_action :check_token

  def update
    @pokeball = Pokeball.find(params[:id])
    if params[:moveAcross]
      @pokeball.update(pokeball_params.merge(onTeam: !@pokeball.onTeam))
    else
      @pokeball.update(pokeball_params)
    end
    options = {include: [:pokeballs]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  private
  def pokeball_params
    params.require(:pokeball).permit(:position)
  end
end
