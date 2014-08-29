module Api
    class UsersController < BaseController

        def show
            token = Token.find_by(token: params[:id])

            if token and token.expires_at > Time.now
                render json: { success: true, user: UserSerializer.new(token.user, root: false) }
            else
                render json: { error: true, message: 'Token has expired' }
            end
        end

    end
end
