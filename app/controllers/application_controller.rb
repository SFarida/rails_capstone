class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      categories_path(resource)
    else
      super
    end
  end
end
