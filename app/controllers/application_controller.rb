class ApplicationController < ActionController::Base
    # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    wishes_path
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys:[:first_name, :email, :password, :current_password])
    end

end
