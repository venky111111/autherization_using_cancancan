class CarworldsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :current_carworld, only: [:show, :edit, :update, :destroy]

  def index
    @carworlds = Carworld.all
  end

  def show

  end

  def new
    @carworld = Carworld.new
  end

  def create
    carworld = Carworld.create(carworld_params)

    redirect_to carworld_path(carworld)
  end

  def edit

  end

  def update
    @carworld.update(carworld_params)

    redirect_to carworld_path(@carworld)
  end

  def destroy
    @carworld.destroy

    redirect_to carworlds_path
  end

  private

  def carworld_params
    params.require(:carworld).permit(:brand, :model)
  end

  def current_carworld
    @carworld = Carworld.find(params[:id])
  end

end