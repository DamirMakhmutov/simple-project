class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
