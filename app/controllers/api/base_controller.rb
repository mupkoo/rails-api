module Api
    class BaseController < ActionController::Base

        before_action :cors_preflight_check
        after_action :cors_set_access_control_headers

        protected

        def cors_preflight_check
            if request.method == :options
                headers['Access-Control-Allow-Origin'] = '*'
                headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
                headers['Access-Control-Request-Method'] = '*'
                headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, Token'
                headers['Access-Control-Max-Age'] = '1728000'

                render json: { success: true }
            end
        end

        def cors_set_access_control_headers
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
            headers['Access-Control-Request-Method'] = '*'
            headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, Token'
        end

    end
end
