class ItemsController < ApplicationController

  def index
    @items = Item.search(search_params, page: params[:page], per_page: 15)
  end


  def show
    @item = Item.find_by(id: params[:id])
  end

  private

  def search_params
    params.dig(:search) || "*"
  end
end
