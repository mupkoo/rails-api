module Api
    class AuthController < BaseController

        def create
            @login = LoginService.new(auth_params)

            if @login.valid? && @login.authenticate
                user = @login.user
                token = Token.create_for(user)

                render json: {
                    success: true,
                    user: UserSerializer.new(user, root: false),
                    token: token.token
                }
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
