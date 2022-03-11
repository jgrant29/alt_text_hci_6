class ApplicationController < ActionController::Base
  before_action :set_current_user
	before_action :configure_permitted_parameters, if: :devise_controller?
	include Pundit

  protected

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  def set_current_user
    current_user = User.new unless user_signed_in? 
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
