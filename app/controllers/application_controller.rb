class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.profile_created
      user_applications_path(current_user)
    else
      edit_user_path(current_user)
    end
  end
end
