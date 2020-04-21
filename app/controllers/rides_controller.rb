class RidesController < ApplicationController
  def create
    attraction = Attraction.find_by_id(params[:ride])
    new_ride = current_user.rides.build(attraction_id: attraction.id).take_ride

    redirect_to user_path(current_user), alert: new_ride
  end
end
