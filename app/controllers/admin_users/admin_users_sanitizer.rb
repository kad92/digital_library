class AdminUser::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys:[:username,:employee_id, :email, :password, :password_confirmation, :first_name, :last_name,:state,:city,:address,:phone])
  end
end