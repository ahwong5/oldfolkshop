class DashboardsController < ApplicationController
  # before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :phone, :user_id, :role, :image )
  end


end
