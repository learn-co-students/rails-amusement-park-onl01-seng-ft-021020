class SessionsController < ApplicationController
    skip_before_action :authentication_required, only: [:new,:create]

    def new 

    end 


    def create 
        # binding.pry

        if user = User.find_by(name: params[:user][:name])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            render 'new'
        end

    end 

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end
end 