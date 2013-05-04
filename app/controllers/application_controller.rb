class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

  def verify_is_admin
    admin_only_error = "You must be admin to do this action"
    redirect_to(root_path, :alert => admin_only_error) if current_user.nil? 
    redirect_to(root_path, :alert => admin_only_error) unless current_user.is_admin?
  end

end
