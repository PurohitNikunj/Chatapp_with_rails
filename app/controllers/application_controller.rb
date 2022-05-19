class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :is_authenticated, except: [:sign_in, :post_sign_in, :new, :create]
    before_action :not_loggedin, only: [:sign_in, :post_sign_in, :new, :create]

    private
    def is_authenticated
        unless loggedin?
            flash[:alert] = "You should be logged-in to use this service"
            redirect_to sign_in_path
        end
    end

    def not_loggedin
        if loggedin?
            flash[:alert] = "You are already logged-in"
            redirect_to root_path
        end
    end
end
