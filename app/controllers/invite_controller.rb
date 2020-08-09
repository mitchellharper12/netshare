class InviteController < ApplicationController
  def register
    @organization = Organization.find(params[:org_id])
  end

  def enroll
  end
end
