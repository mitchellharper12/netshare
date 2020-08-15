class ListingController < ApplicationController
  before_action :check_ownership, except: [:new, :create]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
    @listing.capacity = params[:capacity]
    @listing.street = params[:street]
    @listing.city = params[:city]
    @listing.state = params[:state]
    @listing.country = params[:country]
    @listing.user_id = @user.id

    if @listing.save
      flash[:notice] = "Your internet offer has been listed"
    else
      # TODO better error handling
      flash[:alert] = "Error creating internet listing"
    end
    redirect_to :root
  end

  def destroy
    if @listing.destroy
      flash[:notice] = "Offer deleted"
    else
      #TODO better error handling
      flash[:alert] = "Error deleting internet offer, please try again"
    end
    redirect_to :root
  end

  private

  def check_ownership
    @listing = Listing.find(params[:listing_id])
    if @listing.nil? || @listing.user.id != @user.id
      flash[:alert] = "Unknown listing"
      redirect_to :root
    end
  end
end
