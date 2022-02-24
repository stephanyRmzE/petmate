class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]
  def index
    if params[:query].present?
      @busqueda = params[:query].capitalize
      if Pet::CATEGORY.include?(@busqueda)
        @pets = policy_scope(Pet.where(species: @busqueda))
      else
        @pets = policy_scope(Pet)
      end
    else
      @pets = policy_scope(Pet)
    end
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
    authorize @pet
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    authorize @pet
    @pet.destroy
    redirect_to user_path, notice: "Your pet was removed"
  end

  private

  def set_pet
    @pet = authorize Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :breed, :description, photos: [])
  end
end
