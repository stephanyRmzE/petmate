class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
