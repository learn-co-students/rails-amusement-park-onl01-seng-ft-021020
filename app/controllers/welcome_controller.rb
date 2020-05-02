class WelcomeController < ApplicationController
    skip_before_action :authentication_required, only: [:home]

    def home 
    end

end