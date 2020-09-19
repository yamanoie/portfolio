# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
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

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when User
  #     posts_path
  #   when AdminUser
  #     stored_location_for(resource) ||
  #       if resource.is_a?(AdminUser)
  #         root_path
  #       else
  #         super
  #       end
  #   end
  # end

  def new_guest
    # ゲストユーザーがあれば取り出す、なければ新規作成する
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: "You logged in as a GUEST USER"
  end
end
