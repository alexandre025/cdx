class Cdx::Admin::Devise::SessionsController < Devise::SessionsController
  layout 'cdx/admin_login'

  helper Cdx::Admin::BaseHelper

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def after_sign_out_path_for(resource_or_scope)
    new_admin_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    admin_root_path
  end
end
