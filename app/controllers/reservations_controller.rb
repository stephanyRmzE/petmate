class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :update, :edit]
  def index
    @reservations = policy_scope(Reservation)
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
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
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
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
