class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
    when Manager
      admin_orders_path
    when Customer
      items_path
    end

  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :address, :postal_code, :phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  end
end
