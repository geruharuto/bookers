class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  def after_sign_in_path_for(resouce)
        notice = "Welcome! You have signed up successfully."
        user_path(current_user)
   end
   def after_sign_up_path_for(resouce)
        notice = "Welcome! You have signed up successfully."
        user_path(current_user)
   end
end
