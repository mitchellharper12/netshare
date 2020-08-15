class RequestController < ApplicationController
  def my_requests
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.head_count = params[:head_count]
    @request.street = params[:street]
    @request.city = params[:city]
    @request.state = params[:state]
    @request.country = params[:country]
    @request.user_id = @user.id

    if @request.save
      flash[:notice] = "Request successful"
      redirect_to :root
    else
      flash[:alert] = "Error"
      render :new
    end
  end
end
