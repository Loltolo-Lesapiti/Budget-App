class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def after_sign_up_path_for(resource)
    # Send confirmation instructions email
    resource.send_confirmation_instructions

    # Redirect to login page with flash message
    flash[:notice] = 'Your account has been created. Please check your email to confirm your account before logging in.'
    new_user_session_path
  end
end
