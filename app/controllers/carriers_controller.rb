class CarriersController < ApplicationController

  def carrier
    @carriers =  Carrier.all
  end


  def index
    @carriers = Carrier.all
  end


  def new
    @carrier = Carrier.new
  end


  def create
    @carrier = Carrier.new(carrier_params)

    if @carrier.save
      redirect_to carriers_path
    else
      render new_carrier_path
    end
  end


  def edit
    @carrier = Carrier.find_by(id: params[:id])
  end


  def update
    @carrier = Carrier.find_by(id: params[:id])

    if @carrier.update(carrier_params)
      redirect_to carriers_path
    else
      redirect_to edit_carrier_path(@carrier)
    end
  end


  private

  def carrier_params
    params.require(:carrier).permit(:user_id, :name, :destination, :price)
  end


end
