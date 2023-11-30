class ApplicationController < ActionController::Base
    protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      categories_path(resource)
    else
      super
    end
  end
end
