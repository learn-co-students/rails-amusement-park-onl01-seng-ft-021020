class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        @errors = []
        if !enough_tickets?
            @errors << "You do not have enough tickets to ride the #{attraction.name}."
        end
        if !tall_enough?
            @errors << "You are not tall enough to ride the #{attraction.name}."
        end
        if !@errors.empty?
            print_errors
        else
            go_on_ride
            "Thanks for riding the #{attraction.name}!"
        end
    end

    private
    
    def enough_tickets?
        user.tickets >= attraction.tickets
    end

    def tall_enough?
        user.height >= attraction.min_height
    end

    def go_on_ride
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    end

    def print_errors
        "Sorry. " + @errors.join(" ")
    end
end
