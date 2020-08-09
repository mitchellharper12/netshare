class Admin::OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def new
  end

  def create
    Organization.create(title: params[:title])
    redirect_to admin_organizations_path

  end
  
  def destroy
    Organization.find(params[:id]).delete
    redirect_to admin_organizations_path
  end

  private
    def organization_params
      params.require(:title)
    end
end
