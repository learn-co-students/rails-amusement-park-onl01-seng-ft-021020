class User < ActiveRecord::Base
    has_secure_password
    validates :name,  presence: true
    has_many :rides
    has_many :attractions, through: :rides

    # has a method 'mood' that returns 'sad' when the user is more nauseous than happy (FAILED - 49)
    # has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 50)
    def mood
    	if self.nausea && self.happiness
        if self.nausea > self.happiness
       	 	"sad"
        else
        	"happy"
        end
    	end
    end

end
