class AttractionsController < ApplicationController
  
  def index
    @attractions = Attraction.all
    render "admin_index" if current_user.admin
  end
  
  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(att_params)
    redirect_to attraction_path(attraction)
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    render "admin_show" if current_user.admin
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(att_params)
    redirect_to attraction_path(@attraction)
  end

  private
  
  def att_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height) 
  end
end

