module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
        helper_method :current_user
        helper_method :user_signed_in?
    end

    protected

    def authorize!
        raise Unauthorized unless user_signed_in?
    end

    def sign_in(user)
        session[:user_id] = user.id
        @current_user = user
    end

    def sign_out
        session[:user_id] = nil
    end

    def current_user
        @current_user ||= begin
            User.find_by(id: session[:user_id]) if session[:user_id]
        end
    end

    def user_signed_in?
        current_user.present?
    end

end
