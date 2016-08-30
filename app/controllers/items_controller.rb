class ItemsController < ApplicationController

  # before_action :authenticate!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end


  def show
    @item = Item.find_by(id: params[:id])
  end


  def new
    @item = Item.new
  end


  def create

    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end


  def edit
    @item = Item.find_by(id: params[:id])
  end


  def update
    @item = Item.find_by(id: params[:id])

    if @item.update(item_params)
      redirect_to items_path
    end
  end


  def destroy
    @item = Item.find_by(id: params[:id])

    if @item.destroy
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :inventory, :status, :created_at, :updated_at, :category_id)
  end

end
