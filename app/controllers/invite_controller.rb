class InviteController < ApplicationController
  skip_before_action :load_user

  def register
    @organization = Organization.find(params[:org_id])
    @user = User.new
  end

  def enroll
    @user = User.new
    @user.email = params[:email]
    @user.username = params[:username]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.set_password_digest(params[:password])
    @user.organization_id = params[:organization_id]
    if @user.save
      flash[:notice] = "User successfully created, please log in"
      redirect_to login_path
    else
      if @user.errors
        error_message = @user.errors.messages.collect { |k, v|
          k.id2name.capitalize.gsub('_', ' ') + ' ' + v.join(', ')
        }.join(', ')
        flash[:alert] = error_message
      else
        # TODO Improve unknown error handling
        flash[:alert] = "Unknown error"
      end
      @organization = Organization.find(params[:organization_id])
      render :register, status: 400
    end
  end
end
