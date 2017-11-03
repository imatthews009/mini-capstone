class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authenticate_user!
        redirect_to "/login" unless current_user
    end

    def authenticate_admin!
        unless current_user && current_user.admin 
            flash[:warning] = "you are not authorized!"
            redirect_to "/products"
        end
    end

    #ensures that this method is run first
    before_action :calculated_cart_count

    private #######

    def calculated_cart_count
        if current_user
            @cart_count = current_user.carted_products.where(status: "carted").count
        else
            @cart_count = 0
        end
    end
end
