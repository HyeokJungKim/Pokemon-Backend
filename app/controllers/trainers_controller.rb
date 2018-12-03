class TrainersController < ApplicationController
  def login
    @trainer = Trainer.find_by(username: trainer_params(:username))
    if(@trainer && @trainer.authenticate(trainer_params(:password)))
      render json: tokenForAccount(@trainer)
    else
      render json: {error: "Invalid Username or Password"}, status: :bad_request
    end
  end

  def persist
    @trainer = currentUser
    if(@trainer)
      options = {include: [:pokeballs]}
      trainer = TrainerSerializer.new(@trainer, options).serialized_json
      render json: trainer
    else
      render json: {error: "Invalid Token"}, status: :bad_request
    end
  end

  def show
    @trainer = currentUser
    if(@trainer)
      options = {include: [:pokeballs]}
      trainer = TrainerSerializer.new(@trainer, options).serialized_json
      render json: trainer
    else
      render json: {error: "Invalid Token"}, status: :bad_request
    end
  end

  def catch
    @trainer = currentUser
    if(@trainer)
      @pokemon = Pokemon.find(params[:id])
      @pokeball = Pokeball.create(trainer: @trainer, pokemon: @pokemon, level: params[:level])
      pokemon = PokeballSerializer.new(@pokeball)
      render json: pokemon
    else
      render json: {error: "Invalid Token"}, status: :bad_request
    end
  end

  private

  def trainer_params(*args)
    params.require(:trainer).permit(*args)[*args]
  end
end
