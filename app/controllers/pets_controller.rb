class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]
  def index
    @pets = policy_scope(Pet)
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @user = current_user.id
    @pet.user_id = @user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @user = @pet.user
    @pet.destroy
    redirect_to user_path(@user)
  end

  private

  def set_pet
    @pet = authorize Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :breed, :photo)
  end
end
