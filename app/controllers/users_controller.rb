class UsersController < ApplicationController
  
  before_action :configure_sign_up_params, only: [:create]
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :email, :password, :password_confirmation])
  end


  #GET /resource/sign_up
  def new
    super
    #redirect_to '/'
  end
end
