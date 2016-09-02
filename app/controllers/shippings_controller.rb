class ShippingsController < ApplicationController
  def address
  end

  def index
  end

  def order_confirmation
    @cart = JSON.parse(cookies[:cart])
    @items = []
    @cart.each do |item_id,quantity|
      item = Item.find_by(id: item_id)
      item.define_singleton_method(:quantity) do
        quantity
      end
      @items << item
    end

  end

end
