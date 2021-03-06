class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:email, :password, :role) }
    devise_parameter_sanitizer.for(:invite).concat [:email]

  end
  
  def after_sign_in_path_for(resource)
    if resource.is?("candidate")
      dashboard_candidates_path(resource)
    elsif resource.is?("recruiter")
      dashboard_recruiter_path(resource)
    elsif resource.is?("employee")
      dashboard_user_path(resource)
    end
  end
end
