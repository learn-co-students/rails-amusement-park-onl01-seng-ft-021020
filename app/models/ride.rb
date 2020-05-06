class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride 
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}." 
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif  self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}." 
    else
      new_tickets = self.user.tickets - self.attraction.tickets
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_happiness = self.user.happiness + self.attraction.happiness_rating

      self.user.update(
        tickets: new_tickets,
        happiness: new_happiness,
        nausea: new_nausea
        )

      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end
