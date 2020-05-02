class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authentication_required
  helper_method :current_user

  private 
  def authentication_required
    if !logged_in?
      redirect_to '/'
    end 
  end 

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id:session[:user_id])
  end 
end