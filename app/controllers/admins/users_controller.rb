class Admins::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def update
    redirect_to admins_users
  end

  def show
    @user = User.find(params[:id])
  end

end
