class AttractionsController < ApplicationController

    def index 
        # binding.pry
        @attractions = Attraction.all 
        @user = current_user
    end 

    def show 
        # binding.pry
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
        @user = current_user
    end 

    def new
        @attraction = Attraction.new
    end 

    def create 
        # binding.pry
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)

    end 

    def edit
        @attraction = Attraction.find_by(id: params[:id])


    end 

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)

    end 

    private 
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end 

end