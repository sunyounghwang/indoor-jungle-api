class API::PlantsController < ApplicationController
  def index
    render json: Plant.all
  end

  def create
    plant = Plant.new(plant_params)
    
    if plant.save
      render json: plant
    else
      render json: { message: plant.errors }, status: 400
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :type_of, :location, :start_date, :img_url, :notes)
  end
end
