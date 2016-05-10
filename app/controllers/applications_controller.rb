class ApplicationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @applications = @user.applications
  end

  def new
    @job = Job.find(params[:job_id])
    if current_user.jobs.find_by(id: @job.id)
      flash[:notice] = "Already applied for job"
      redirect_to job_path(@job)
    else
      @application = Application.new
      @application.references.build
      @application.references.build
    end
  end

  def create
    @job = Job.find(params[:application][:job_id])
    @application = current_user.applications.build(app_params)
    if @application.save
      flash[:notice] = "Applied for job!"
      redirect_to user_applications_path(current_user)
    else
      flash.now[:error] = "Unable to apply for job."
      render 'applications/new'
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    redirect_to user_applications_path(current_user)
  end

  def show
    @application = Application.find(params[:id])
    # raise @application.inspect
  end

  private
    def app_params
      params.require(:application).permit(:job_id, :cover_letter, :references_attributes => [:name, :phone_number, :relationship])
    end
end
