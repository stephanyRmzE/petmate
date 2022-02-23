class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :update]
  def index
    @reservation = Reservation.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user
    @reservation.pet = @pet
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path(@user)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new
  end

  def destroy
    @reservation.destroy
    redirect_to users_path
  end

  private

  def set_reservation
    @reservation = authorize Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user, :pet)
  end
end
