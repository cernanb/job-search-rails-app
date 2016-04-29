class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create]

  def index
    # raise params.inspect
    if params[:user_id]
      @user = User.find(params[:user_id])
      @jobs = @user.jobs
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render 'jobs/new'
    end
    # raise @job.inspect
  end

  def show
    @job = Job.find(params[:id])
  end

  private
    def job_params
      params.require(:job).permit(:title, :company, :description)
    end
end
