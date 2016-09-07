class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(created_at: :desc)
  end


  def show
    @category = Category.includes(:items).find(params[:id])
    @items = @category.items.order("created_at DESC").page params[:page]
  end


end
