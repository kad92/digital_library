class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'users/parameter_sanitizer'
  require 'admin_users/parameter_sanitizer'

  protected
    def devise_parameter_sanitizer
      if resource_class == User
        Users::ParameterSanitizer.new(User,:user,params)
      elsif resource_class == AdminUser
        AdminUsers::ParameterSanitizer.new(AdminUser,:admin_user,params)
      else
        super
      end
    end
end
