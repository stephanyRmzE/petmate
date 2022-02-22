class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :destroy]
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @user = current_user.id
    @pet.user_id = @user
    if @pet.save
      redirect_to pets_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @pet.destroy
    redirect_to users_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :breed, :photo)
  end
end
