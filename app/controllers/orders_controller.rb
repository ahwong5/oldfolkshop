class OrdersController < ApplicationController

  def show

  end

  def create
    # @order = current_user.orders.new(order_params)


    @order = Order.create(totalprice: params[:totalprice], user_id: params[:user_id])

    if @order.save
      @bill = Billplz.create_bill_for(@order)
      @order.update_attributes(bill_id: @bill.parsed_response['id'], bill_url: @bill.parsed_response['url'])
      cookies.delete :cart
      # binding.pry
      redirect_to @bill.parsed_response['url']
    else
      render :new
    end

  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :totalprice, :bill_id, :bill_url, :due_at, :paid_at)
  end

end
