class AttractionsController < ApplicationController
    before_action :logged_in?
    before_action :find_attraction, only: [:show, :edit, :update]
    def index
        @attractions = Attraction.all
    end
    
    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.create(attraction_params)
        if @attraction
          redirect_to attraction_path(@attraction)
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        @attraction.update(attraction_params)
        if @attraction.save
          redirect_to attraction_path(@attraction)
        else
          render :edit
        end
      end
    private
    
    def find_attraction
      @attraction = Attraction.find_by(id: params[:id])
    end


    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
