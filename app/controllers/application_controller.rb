class ApplicationController < ActionController::Base
  include UsersHelper
  include ContestsHelper
  include CellsHelper
  protect_from_forgery with: :null_session

  before_action :configure_permitted_paramaters, if: :devise_controller?
  # before_action :authenticate_user!

  protected

  def configure_permitted_paramaters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :birthday, :email, :password, :remember_me)}
    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :birthday, :email, :password, :remember_me)}

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :street_address, :apt_num, :city, :state, :zip, :phone_num, :admin, :email, :password, :remember_me, :provider, :uid])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me, :provider, :uid])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :birthday, :street_address, :apt_num, :city, :state, :zip, :phone_num, :admin, :email, :password, :current_password, :remember_me, :provider, :uid])
  end

  

end
