class InventoriesController < ApplicationController
  before_action :check_token

  def buy
    params["itemsArray"].each do |params_hash|
      inventory = @trainer.inventories.find_by(id: params_hash["id"])
      if inventory
        inventory.buy(params_hash[:quantity])
      end
    end
    @trainer.reload
    options = {include: [:inventories]}
    render json: TrainerSerializer.new(@trainer, options).serialized_json
  end

  def update
    @ball = @trainer.inventories.find_by(id: params["id"])
    @ball.use(1)
    render json: @ball
  end
end
