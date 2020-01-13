class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'users/users_sanitizer'
  require 'admin_users/admin_users_sanitizer'

  protected
    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User,:user,params)
      elsif resource_class == AdminUser
        AdminUser::ParameterSanitizer.new(AdminUser,:admin_user,params)
      else
        super
      end
    end
end
