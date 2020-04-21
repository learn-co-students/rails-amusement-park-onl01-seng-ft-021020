class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id if @user.valid?
    redirect_to user_path(@user)
  end

  def show
    redirect_to root_path unless logged_in?
    @user = User.find_by_id(params[:id])
  end

  def edit

  end
 
  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def logged_in?
    session[:user_id].present?
  end

end
