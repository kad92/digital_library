class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'users_sanitizer'

  protected
    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User,:user,params)
      else
        super
      end
    end
end
