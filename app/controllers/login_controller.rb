class LoginController < ApplicationController
    skip_before_action :load_user
    before_action :check_authenticated, except: :logout

    def index
      @user = User.new
    end

    def login
      user_by_email = User.find_by_email(params[:username_or_email])
      user_by_username = User.find_by_username(params[:username_or_email])
      @user = user_by_email || user_by_username
      if @user
        password = SCrypt::Password.new(@user.password_digest)
        # SCrypt::Password overrides == to implement secure comparison
        if password == params[:password]
          login_success
        else
          login_error
        end
      else
        login_error
      end
    end

    def logout
      reset_session
      redirect_to :login
    end

    private

    def check_authenticated
      if session[:user_id]
        redirect_to :root
      end
    end

    def login_success
      reset_session
      session[:user_id] = @user.id
      redirect_to :root
    end

    def login_error
      @user = User.new
      @user.username = params[:username_or_email]
      @user.password = params[:password]
      flash[:alert] = "Invalid Username/Email and Password"
      render 'index', status: 401
    end
end
