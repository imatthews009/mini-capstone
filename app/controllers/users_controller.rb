class UsersController < ApplicationController
    def new
        render "new.html.erb"
    end

    def create
        user = User.new({
            name: params[:name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation],
            })
        if user.save
            session[:user_id] = user.id 
            flash[:succes] = "successfully created account!"
            redirect_to "/products"
        else
            flash[:warning] = "invalid email or password!"
            redirect_to "/signup"
        end
    end
end
