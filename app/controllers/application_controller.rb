class ApplicationController < ActionController::Base
  before_action :pundit_user
	before_action :configure_permitted_parameters, if: :devise_controller?
	include Pundit

  protected

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  def pundit_user
    current_user = User.new unless user_signed_in? 
    return current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
