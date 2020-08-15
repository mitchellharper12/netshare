class HomeController < ApplicationController
  def index
    @requests = @user.requests
  end
end
