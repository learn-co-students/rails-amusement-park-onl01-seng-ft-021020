class UsersController < ApplicationController
    skip_before_action :authentication_required, only: [:new, :create]
    def new 
        @user = User.new
    end 

    def create
        # binding.pry
        if (user = User.create(user_params))
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          render 'new'
        end
    end

    def show 
        # binding.pry
        @user = User.find_by(id: params[:id])
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end 

end