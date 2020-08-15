class HomeController < ApplicationController
  def index
    @requests = @user.requests
    @listings = @user.listings
  end
end
