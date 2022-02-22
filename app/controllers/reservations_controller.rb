class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]
  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @reservation.user = @user
    if @reservation.save
      redirect_to reservations_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @reservation.destroy
    redirect_to users_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user, :pet)
  end
end
