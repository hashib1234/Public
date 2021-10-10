class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone_no,:email])   
    end

    def  after_admin_sign_in_path_for(resource)
      admin_home_path
    end

    def  after_user_sign_in_path_for(resource)
      user_session_path
    end

end