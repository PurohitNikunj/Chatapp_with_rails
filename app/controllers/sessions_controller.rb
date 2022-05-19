class SessionsController < ApplicationController

    def sign_in
    end

    def post_sign_in
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            redirect_to root_path
        else
            flash[:alert] = "Invalid Credentials!!"
            render :sign_in, status: :unprocessable_entity
        end
    end

    def log_out
        logout
        redirect_to sign_in_path, status: :see_other 
    end

    private
    def not_loggedin
        if loggedin?
            flash[:alert] = "You are already logged-in"
            redirect_to root_path
        end
    end
end
