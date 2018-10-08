class TrainersController < ApplicationController
  def show
    @trainer = Trainer.find(params[:id])
    options = {include: [:pokemons]}
    trainer = TrainerSerializer.new(@trainer, options).serialized_json
    render json: trainer
  end
end
