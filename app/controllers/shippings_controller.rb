class ShippingsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def order_confirmation
    @carrier =  Carrier.find_by(id: params[:carrier])

    @address = current_user.addresses.find_by(id: params[:address])

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
    @carrier.price.to_i
      @totalprice = @totalprice + @carrier.price.to_f
  end

end
