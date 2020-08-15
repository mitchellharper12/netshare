class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :load_user

  protected

  def load_user
    unless session[:user_id]
      reset_session
      redirect_to :login
    else
      @user = User.find(session[:user_id])
    end
  end
end
