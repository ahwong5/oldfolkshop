class ShippingsController < ApplicationController
before_action :authenticate_user!

  def address

  end

  def index
  end

  def order_confirmation
    @totalprice = 0

    @cart = JSON.parse(cookies[:cart])
    @items = []
    @cart.each do |item_id,quantity|
      item = Item.find_by(id: item_id)
      item.define_singleton_method(:quantity) do
        quantity
      end
      @items << item

      @totalprice += item.price.to_f * item.quantity.to_i

    end

  end

end
