class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :flash_error_if_devise_unpermitted_parameters
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar] )
    end
    
    def flash_error_if_devise_unpermitted_parameters
      if devise_controller? && params[:controller] == "devise/registrations" && resource.errors.any?
        resource.errors.each do |attr, msg|
          flash[:error] = msg
        end
      end
    end
    
  private
      def sign_in_required
          redirect_to new_user_session_url unless user_signed_in?
      end
end
