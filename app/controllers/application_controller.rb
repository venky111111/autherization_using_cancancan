class ApplicationController < ActionController::Base
    # def after_sign_in_path_for(resource)
    #     carworlds_path
    # end
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        # redirect_to root_url, :alert => exception.message+""
        redirect_to root_url, :alert => "you're not allowed to perform this action"
    end
    
    protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type, :email, :password])
    end 

end
