class UsersController < ApplicationController
  def show
    @user = authorize User.find(params[:id])
    @pets = @user.pets
    @reservations = Reservation.all
  end

  def edit
    @user = authorize User.find(params[:id])
  end

  def update
    @user = authorize User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def reservation
    @user = authorize User.find(params[:id])
  end

  def destroy
    @user = authorize User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
