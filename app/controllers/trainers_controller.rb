class TrainersController < ApplicationController
  before_action :check_token, except: [:login]

  def login
    @trainer = Trainer.find_by(username: trainer_params(:username))
    if(@trainer && @trainer.authenticate(trainer_params(:password)))
      render json: tokenForAccount(@trainer)
    else
      render json: {error: "Invalid Username or Password"}, status: :bad_request
    end
  end

  def persist
    options = {include: [:pokeballs, :inventories]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  def show
    options = {include: [:pokeballs, :inventories]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  def catch
    @pokemon = Pokemon.find(params[:id])
    @ball = @trainer.inventories.find_by(id: params["ballId"])
    @trainer.increase_money(params[:money])
    @ball.use(1)
    @trainer.pokemon_team.each {|pokeball| pokeball.add_experience(params[:experience])}
    @pokeball = Pokeball.create(trainer: @trainer, pokemon: @pokemon, level: params[:level], onTeam: params[:canFitOnTeam])
    render json: PokeballSerializer.new(@pokeball)
  end

  def experience
    @trainer.increase_money(params[:money])
    @trainer.pokemon_team.each {|pokeball| pokeball.add_experience(params[:experience])}
    options = {include: [:pokeballs]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  private

  def trainer_params(*args)
    params.require(:trainer).permit(*args)[*args]
  end
end
