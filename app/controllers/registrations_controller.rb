class RegistrationsController < ApplicationController

    def new
        @registration = RegistrationService.new
    end

    def create
        @registration = RegistrationService.new(registration_params)

        if @registration.valid?
            user = @registration.save
            sign_in(user)

            redirect_to root_url, notice: 'You have registered successfully!'
        else
            render :new
        end
    end

    protected

    def registration_params
        params.require(:registration_service).permit(:email, :password, :password_confirmation)
    end

end
