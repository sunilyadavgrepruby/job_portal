class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_organizations, only: [:new, :create, :edit, :update]
  
  def index
      @jobs = Job.all
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job created successfully"
      redirect_to @job
    else
      render 'new'
    end
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  

  def update
   @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] =  "Job Updated successfully"
      redirect_to jobs_path
    else
      render 'edit'
    end
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def destroy
     @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] =  "Job Deleted successfully"
    redirect_to jobs_path
  end
  
  private
  
  def job_params
    params.require(:job).permit(:title, :description, :organization_id)
  end
  
  def load_organizations
    @organizations = current_user.organizations
  end
end
