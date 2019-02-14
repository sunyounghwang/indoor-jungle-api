class API::PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

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

  def show
    render json: @plant
  end

  def update
    if @plant.update(plant_params)
      render json: @plant
    else
      render json: { message: @plant.errors }, status: 400
    end
  end

  def destroy
    if @plant.destroy
      render status: 204
    else
      render json: { message: "Unable to delete this plant" }, status: 400
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :type_of, :location, :start_date, :img_url, :notes)
  end

  def set_plant
    @plant = Plant.find_by(id: params[:id])

    unless @plant
      render json: { message: "Unable to find this plant" }, status: 400
    end
  end
end
