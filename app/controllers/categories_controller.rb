class CategoriesController < ApplicationController

  # before_action :authenticate!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(created_at: :desc)
  end


  def show
    @category = Category.find_by(id: params[:id])
  end


  def new
    @category = Category.new
  end


  def create

    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end


  def edit
    @category = Category.find_by(id: params[:id])
  end


  def update
    @category = Category.find_by(id: params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    end
  end


  def destroy
    @category = Category.find_by(id: params[:id])

    if @category.destroy
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :created_at, :updated_at)
  end

end
