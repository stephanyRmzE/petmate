class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @user = current_user
    @pet.user = @user
    if @pet.save
      redirect_to pets_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :type, :breed)
  end
end
