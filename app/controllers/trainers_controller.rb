class TrainersController < ApplicationController
  def show
    @trainer = Trainer.find(params[:id])
    options = {include: [:pokemons], params: {trainer: @trainer}}
    trainer = TrainerSerializer.new(@trainer, options).serialized_json
    render json: trainer
  end


  def login
    @trainer = Trainer.find_by(username: params[:username])
    if(@trainer && @trainer.authenticate(params[:password]))
      options = {include: [:pokemons], params: {trainer: @trainer}}
      trainer = TrainerSerializer.new(@trainer, options).serialized_json
      render json: trainer
    else
      render json: {error: "Invalid Username or Password"}
    end
  end
end
