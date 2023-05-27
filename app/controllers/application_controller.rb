class ApplicationController < ActionController::Base
  def current_user
    User.first
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :name, :bio, :photo)
    end
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:password, :current_password) }
  end
  end
end
