class AddressesController < ApplicationController

  def index
    @addresses = current_user.addresses
  end

  def show
  end


  def new
    @address = Address.new
  end


  def create
    @address = current_user.addresses.build(address_params)

    # @address = Address.new(address_params)

    if @address.save
      redirect_to addresses_path
    else
      render new_address_path
    end
  end


  def edit
    @address = Address.find_by(id: params[:id])
  end


  def update
    @address = Address.find_by(id: params[:id])

    if @address.update(address_params)
      redirect_to addresses_path
    else
      redirect_to edit_address_path(@address)
    end
  end

  def address
    @addresses = current_user.addresses
  end

  def destroy

  end

  private  #to prevent accessible to below info

  def address_params
    params.require(:address).permit(:name, :company, :telephone, :address, :city, :state, :zip, :country)
  end
end
