class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActionController::InvalidAuthenticityToken, with: :omniauth_failure

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def omniauth_failure
    if user_signed_in?
      redirect_to root_path, alert: "You are already signed in."
    else
      super
    end
  end
end
