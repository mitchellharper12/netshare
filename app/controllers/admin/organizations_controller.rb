class Admin::OrganizationsController < ApplicationController
  before_action :load_user

  def index
    @organizations = Organization.all.entries
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

    def load_user
      if User.all.count != 0
        super
        if @user && @user.organization.title != "Admin"
          flash[:alert] = "Unauthorized"
          redirect_to :root
        end
      end
    end
end
