class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
      if attraction.tickets > user.tickets && attraction.min_height >= user.height
        "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
      elsif attraction.min_height >= user.height
        "Sorry. " + not_tall_enough
      elsif  attraction.tickets > user.tickets
        "Sorry. " + not_enough_tickets
      else
        ride_taken
        "Thanks for riding the #{self.attraction.name}!"
      end
    end

    def ride_taken
      self.user.update(:tickets => (self.user.tickets - self.attraction.tickets),
      :nausea => (self.user.nausea + self.attraction.nausea_rating),
      :happiness => (self.user.happiness + self.attraction.happiness_rating)
     )
    end

    def not_enough_tickets
      "You do not have enough tickets to ride the #{self.attraction.name}."
    end
    
    def not_tall_enough
      "You are not tall enough to ride the #{self.attraction.name}."
    end

end
