class ApplicationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @applications = @user.applications
  end

  def create
    job = Job.find(params[:job])
    if current_user.jobs.find_by(id: job.id)
      flash[:notice] = "Already applied for job"
      redirect_to job_path(job)
    else
      @application = current_user.applications.build(job_id: params[:job])
      if @application.save
        flash[:notice] = "Applied for job!"
        redirect_to user_applications_path(current_user)
      else
        flash[:notice] = "Unable to apply for job."
        redirect_to user_applications_path(current_user)
      end
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.delete
    redirect_to user_applications_path(current_user)
  end
end
