class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_property, if: :authenticated_and_not_property_controller?

  protected

  def authenticated_and_not_property_controller?
    return current_user && !property_controller?
  end

  def home_controller?
    controller_name === "home"
  end

  def property_controller?
    return controller_name === "properties"
  end

  def set_property
    if Property.all.any?
      if !session[:property_id]
        session[:property_id] = Property.first.id
      elsif session[:property_id]
        @property = Property.find(session[:property_id])
      end
    else
      session.delete(:property_id)
      redirect_to new_property_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
