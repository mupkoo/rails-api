class SessionsController < ApplicationController

    def new
        @login = LoginService.new
    end

    def create
        @login = LoginService.new(login_params)

        if @login.valid? && @login.authenticate
            # Login

            redirect_to root_url, notice: 'You have logged in successfully.'
        else
            render :new
        end
    end

    def destroy

    end

    protected

    def login_params
        params.require(:login_service).permit(:email, :password)
    end

end
