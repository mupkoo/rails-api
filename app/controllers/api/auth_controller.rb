module Api
    class AuthController < BaseController

        def create
            @login = LoginService.new(auth_params)

            if @login.valid? && @login.authenticate
                render json: { success: true, user: @login.user }
            else
                render json: { error: @login.errors.full_messages.join(',') }
            end
        end

        protected

        def auth_params
            params.require(:auth).permit(:email, :password)
        end

    end
end
