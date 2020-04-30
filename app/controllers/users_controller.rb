class UsersController < ApplicationController
    before_action :logged_in?, except: [:new, :create]
    def index
        @user = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params) 
        if @user.valid? 
            set_session
            redirect_to user_path(@user)
        else
            render :new, alert: "Please fill in all fields."
        end
    end

    def show
        if current_user
            @ride = current_user.rides.last
        else 
            redirect_to '/' 
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :height, :tickets, :happiness, :admin)
    end

end
