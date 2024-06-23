class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top, :about]
    before_action :configure_permitted_parameters, if: :devise_controller?

    add_flash_types :notice


    protected
    
    def after_sign_up_path_for(resource)
      user_path(current_user)
    end

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end

    def after_sign_out_path_for(resource)
      '/'
    end
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
    
    
    private
  
    def set_flash_message(key, kind, options = {})
      message = find_message(kind, options)
      flash[:notice] = message if message.present?
    end
    
end
