module Api
    class BaseController < ActionController::Base

        include ApiAuthConcern

        after_action :cors_set_access_control_headers

        def cors_preflight_check
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
            headers['Access-Control-Request-Method'] = '*'
            headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, Auth-Token'
            headers['Access-Control-Max-Age'] = '1728000'

            render json: { success: true }
        end

        protected

        def cors_set_access_control_headers
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
            headers['Access-Control-Request-Method'] = '*'
            headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, Auth-Token'
        end

    end
end
