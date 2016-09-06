class ItemsController < ApplicationController

  def index
    if params[:search]
      Item.reindex
      @items = Item.search(params[:search])
    else
      @items = Item.all.order(created_at: :desc)
    end
  end


  def show
    @item = Item.find_by(id: params[:id])
  end

end
