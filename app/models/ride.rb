class Ride < ActiveRecord::Base
    belongs_to :attraction 
    belongs_to :user

    def take_ride 
        phrase = "Sorry."
        # if self.user.tickets <= self.attraction.tickets 
        #     # binding.pry
        #     phrase = phrase << " You do not have enough tickets to ride the #{self.attraction.name}."
        # else
        #     self.user.tickets -= self.attraction.tickets
        #     phrase = "Thanks for riding the #{self.attraction.name}!"
        # end 

        # if self.attraction.min_height > self.user.height 
        #     phrase = phrase << " You are not tall enough to ride the #{self.attraction.name}."
        # else 
        #     phrase = "Thanks for riding the #{self.attraction.name}!"
        # end 
        # self.user.nausea += self.attraction.nausea_rating
        # self.user.happiness += self.attraction.happiness_rating
        # #binding.pry


        if self.user.tickets >= self.attraction.tickets 
                if self.user.height >= self.attraction.min_height
                    self.user.tickets -= self.attraction.tickets
                    self.user.nausea += self.attraction.nausea_rating
                    self.user.happiness += self.attraction.happiness_rating
                    phrase = "Thanks for riding the #{self.attraction.name}!"
                else 
                    phrase = phrase << " You are not tall enough to ride the #{self.attraction.name}."
                end 

        elsif self.user.tickets < self.attraction.tickets &&  self.user.height < self.attraction.min_height 
            phrase = phrase << " You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        else
            phrase = phrase << " You do not have enough tickets to ride the #{self.attraction.name}."

        end 


        #binding.pry

        self.user.update(tickets: self.user.tickets, nausea: self.user.nausea, happiness: self.user.happiness)
        phrase
    end 



end
