class PagesController < ApplicationController
  skip_authorization_check
  def dashboard
    @users = User.all
  end

  def update
    @user = User.find(params[:user_id])

  end

  def destroy
    @user = User.find(params[:user_id])
    redirect_to pages_dashboard_path
  end
end
