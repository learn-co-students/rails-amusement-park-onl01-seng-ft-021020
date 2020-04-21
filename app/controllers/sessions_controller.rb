class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(name: params[:user_name]).try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
