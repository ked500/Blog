class Users::RegistrationsController < Devise::RegistrationsController
  invisible_captcha only: [:create, :update]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


end
