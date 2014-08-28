class ApplicationController < ActionController::Base

    include CurrentUserConcern

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    rescue_from 'Unauthorized' do |exception|
        redirect_to root_url, alert: 'Page only for logged in users.'
    end

end
