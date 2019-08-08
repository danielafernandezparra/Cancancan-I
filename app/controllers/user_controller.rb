class UserController < ApplicationController
  skip_authorization_check
  def update
    @user = User.find(params[:id])
    if @user.admin?
      @user.visit!
    else
      @user.admin!
    end
    redirect_to pages_dashboard_path, notice: "El usuario ha cambiado de rol"
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to pages_dashboard_path, notice: "El usuario ha sido eliminado"
  end
end
