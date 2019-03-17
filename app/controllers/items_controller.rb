class ItemsController < ApplicationController

  def index
    @items = Item.all
    json = Rails.cache.fetch("items") do
      ItemSerializer.new(@items).serialized_json
    end
    render json: json
  end
end
