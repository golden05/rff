class JobsController < ApplicationController

  before_action :admin_signed
  
  def index
    @user = User.find(params[:user_id])
    @jobs = @user.jobs 
  end

  def new
    @user = User.find(params[:user_id])
    @job = Job.new 
  end

  def edit
    @user = User.find(params[:user_id])
    @job = Job.find(params[:id])
    #@jobs = Job.all
    @corps = Corp.all 
  end

  def update
    corp_id = params[:corp]
    job = Job.find(params[:job_id])
    job.corp_id = corp_id
    job.save
    redirect_to user_jobs_path, notice: "succeff"
  end

end
