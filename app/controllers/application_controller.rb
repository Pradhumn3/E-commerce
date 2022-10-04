class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_cart

  private

  def set_cart  
    cart = Cart.find_by(user_id: current_user.id)
    abc = cart.present? ? (@current_cart = cart) : nil
  
    return unless abc.nil?
    @current_cart = Cart.create(user_id: current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_no, :password, :password_confirmation, :email])
  end
end
