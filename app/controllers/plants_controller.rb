class PlantsController < ApplicationController

  def index
    plants = Plant.all
    render json: plants, status: :ok
  end

  def show
    plant = find_plant
    render json: plant, status: :ok
  end
  
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end

  def find_plant
    plant = Plant.find_by(id: params[:id])
  end
end
