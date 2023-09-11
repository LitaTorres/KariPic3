class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        publications_path
    end

    def authorize_request(kind = nil) #si kind = nill 
        unless kind.include?(current_user.role) # pero si kind es dif de nill pero es role entonces redirecciona.
            redirect_to publications_path, notice: "holi :3 no tiene permiso"
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    end
end
