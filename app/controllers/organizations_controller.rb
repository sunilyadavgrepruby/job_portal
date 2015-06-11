class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organizations = current_user.organizations
  end
  
  def new
    @organization = current_user.organizations.build
  end
  
  def create
    @organization = current_user.organizations.build(organization_params)
    if @organization.save
      flash["success"] = "Organization created successfully"
      redirect_to @organization
    else
      render 'new'
    end
  end
  
  def edit
    @organization = current_user.organizations.where(id: params[:id]).first
  end
  

  def update
    @organization = current_user.organizations.find(params[:id])
    if @organization.update(organization_params)
      flash["success"] = "Successfully Updated."
      redirect_to @organization
    else
      render 'edit'
    end
  end
  
  def show
    @organization = current_user.organizations.find(params[:id])
  end
  
  def destroy
    @organization = current_user.organizations.find(params[:id])
    @organization.destroy
    flash["notice"] = "Organization deleted Successfully!"
    redirect_to organizations_path
  end
  
  private
  def organization_params
    params.require(:organization).permit(:organization_name, :organization_address, :organization_email)
  end
end















