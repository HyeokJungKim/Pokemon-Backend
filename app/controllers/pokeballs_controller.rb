class PokeballsController < ApplicationController
  before_action :check_token

  def update
    @pokeball = Pokeball.find(params[:id])
    @pokeball.update(pokeball_params.merge(onTeam: !@pokeball.onTeam))
    render json: PokeballSerializer.new(@pokeball)
  end

  private
  def pokeball_params
    params.require(:pokeball).permit(:position)
  end
end
