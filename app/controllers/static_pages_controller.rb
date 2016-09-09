class StaticPagesController < ApplicationController
  def home
    @items = Item.all.order(created_at: :desc).page params[:page]
  end

  def FAQ
  end

  def about
  end
end
