class RequestController < ApplicationController
  before_action :check_ownership, except: [:new, :create]

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
    @request.user = @user

    if @request.save
      flash[:notice] = "Request successful"
      redirect_to :root
    else
      flash[:alert] = "Error"
      render :new, status: 400
    end
  end

  def destroy
    result = @request.user.requests.delete(@request)
    result = @request.destroy && result
    if result
      flash[:notice] = "Request deleted"
    else
      # TODO better handling
      flash[:alert] = "Error deleting request, please try again"
    end
    redirect_to :root
  end

  private

  def check_ownership
    @request = Request.find(params[:request_id])
    if @request.nil? || @request.user.id != @user.id
      flash[:alert] = "Unknown request"
      redirect_to :root
    end
  end
end
