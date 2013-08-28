class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  
  def verifiy_admin_or_owner!(object)
      admin_or_owner_error = "You must be an owner to perform this action"
      redirect_to(root_path, :alert => admin_or_owner_error) if current_user.nil?
      if !current_user.is_admin? || current_user.id != object.creator.id
        redirect_to(root_path, :alert => admin_or_owner_error)
      end
  end
  
  def verify_is_admin
    admin_only_error = "You must be admin to do this action"
    redirect_to(root_path, :alert => admin_only_error) if current_user.nil? 
    redirect_to(root_path, :alert => admin_only_error) unless current_user.is_admin?
  end

end
