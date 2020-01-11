class AdminUserParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    @params.permit(:sign_up, keys:[:username,:employee_id, :email, :password, :password_confirmation, :first_name, :last_name,:state,:city,:address,:phone])
  end
end