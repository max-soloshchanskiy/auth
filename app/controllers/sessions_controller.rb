class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by({"email"=> params["email"]})
        #if user exists send to companies otherwise back to login
        if @user
            if BCrypt::Password.new(@user["password"]) ==params["password"]
                flash["notice"] = "Welcome!"
                redirect_to "/companies"
            else
                flash["notice"] = "Nope!"
                redirect_to "/sessions/new"
            end
        else
            flash["notice"] = "Welcome!"
            redirect_to "/sessions/new"
        end
    end
end
