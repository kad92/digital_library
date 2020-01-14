class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys:[:username, :email, :password, :password_confirmation, :first_name, :last_name,:state,:city,:address,:phone])
  end
end