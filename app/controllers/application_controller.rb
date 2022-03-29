class ApplicationController < ActionController::Base
    helper_method :is_admin!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        added_attributes = %i[username email password password_confirmation remember_me avatar]
        devise_parameter_sanitizer.permit(:sign_up, keys: added_attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: added_attributes)
    end

    private
    def is_admin!
        redirect_to(root_path) if !current_user || !current_user.admin?
    end
end
