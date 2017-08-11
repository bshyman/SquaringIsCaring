class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :birthday, :street_address, :apt_num,  :city, :state, :zip, :phone_num)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :birthday, :street_address, :apt_num,  :city, :state, :zip, :phone_num, :current_password)
  end
end