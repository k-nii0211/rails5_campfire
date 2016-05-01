class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    added_attributes = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attributes
    devise_parameter_sanitizer.permit :account_update, keys: added_attributes
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password, :remember_me]
  end
end
