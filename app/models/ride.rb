class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = find_user
    att = find_attraction
    messages = Array.new
    enough_tickets?(user, att, messages)
    tall_enough?(user, att, messages)


    if messages.empty?
      messages << "Thanks for riding the #{att.name}!"
      user.tickets -= att.tickets
      user.happiness += att.happiness_rating
      user.nausea += att.nausea_rating
      user.save
      self.save    
      att.save
    else
      messages.unshift("Sorry.") 
    end

    messages.join(' ')
  end

  def find_user
    User.find(self.user_id)
  end

  def find_attraction
    Attraction.find(self.attraction_id)
  end

  def tall_enough?(user, att, messages)
    if user.height < att.min_height
      messages << "You are not tall enough to ride the #{att.name}."
    end
  end

  def enough_tickets?(user, att, messages)
    if user.tickets < att.tickets
      messages << "You do not have enough tickets to ride the #{att.name}."
    end
  end

end
