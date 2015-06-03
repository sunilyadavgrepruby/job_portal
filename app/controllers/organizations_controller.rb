class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end
  
  def new
    @organization = Organization.new
  end
  
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to @organization
    else
      render 'new'
    end
  end
  
  def edit
    @organization = Organization.find(params[:id])
  end
  

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to @organization
    else
      render 'edit'
    end
    def rescue
    end
  end
  
  def show
    @organization = Organization.find(params[:id])
  end
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to organizations_path
  end
  
  private
  def organization_params
    params.require(:organization).permit(:organization_name, :organization_address, :organization_email)
  end
end















