module ApiAuthConcern

    extend ActiveSupport::Concern

    included do
        rescue_from 'Unauthorized' do |exception|
            render json: {}, status: 401
        end
    end

    protected

    def authorize!
        raise Unauthorized unless user_signed_in?
    end

    def current_user
        @current_user ||= begin
            user = false

            auth_token = request.headers['Auth-Token']
            if auth_token.present?
                token = Token.find_by(token: auth_token)

                if token.present?
                    user = token.user
                end
            end

            user
        end
    end

    def user_signed_in?
        current_user.present?
    end

end
