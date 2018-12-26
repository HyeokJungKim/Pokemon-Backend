class TrainersController < ApplicationController
  before_action :check_token, except: [:login]

  def check_token
    @trainer = currentUser
    render json: {error: "Invalid Token"} unless !!@trainer
  end

  def login
    @trainer = Trainer.find_by(username: trainer_params(:username))
    if(@trainer && @trainer.authenticate(trainer_params(:password)))
      render json: tokenForAccount(@trainer)
    else
      render json: {error: "Invalid Username or Password"}, status: :bad_request
    end
  end

  def persist
    options = {include: [:pokeballs]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  def show
    options = {include: [:pokeballs]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  def catch
    # TODO: Add experience to each of the Pokemon
    @pokemon = Pokemon.find(params[:id])
    @trainer.pokeballs.each {|pokeball| pokeball.add_experience(params[:experience])}
    @pokeball = Pokeball.create(trainer: @trainer, pokemon: @pokemon, level: params[:level])
    render json: PokeballSerializer.new(@pokeball)
  end

  private

  def trainer_params(*args)
    params.require(:trainer).permit(*args)[*args]
  end
end
