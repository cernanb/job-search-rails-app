class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @jobs = Job.order_by_num_of_apps
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job created"
      redirect_to jobs_path
    else
      render 'jobs/new'
    end
  end

  def show
    @job = Job.find(params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @job }
    end
  end

  # def search
  #
  # end

  def search_job
    @jobs = Job.where("company LIKE ?", "%#{params[:job]}%")
  end

  private
    def job_params
      params.require(:job).permit(:title, :company, :description)
    end
end
