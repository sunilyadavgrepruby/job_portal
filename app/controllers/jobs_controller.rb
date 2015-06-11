class JobsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @org = Organization.find(params[:organization_id])
    if params[:view] == 'alljobs'
      @jobs = Job.all
    else
      @jobs = @org.jobs
    end
  end
  
  def new
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.build
  end
  
  def create
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.build(job_params)
    if @job.save
      flash[:notice] =  "Job created successfully"
      redirect_to organization_jobs_path(@org, @job)
    else
      render 'new'
    end
  end
  
  def edit
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.where(id: params[:id]).first
  end
  

  def update
   @org = Organization.find(params[:organization_id])
   @job = @org.jobs.where(id: params[:id]).first
    if @job.update(job_params)
      flash[:notice] =  "Job Updated successfully"
      redirect_to organization_jobs_path
    else
      render 'edit'
    end
  end
  
  def show
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.where(id: params[:id]).first
  end
  
  def destroy
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.where(id: params[:id]).first
    @job.destroy
    redirect_to organization_jobs_path(@org)
  end
  
  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
