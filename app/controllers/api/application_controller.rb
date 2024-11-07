class Api::ApplicationController < ActionController::Base
    before_action :no_cache
    before_action :authenticate_client!
    before_action :validate_request

    private

    def validate_request
        base_attributes = ["api_key", "secret", "current_date"]
        property_attributes = @property.variables.select(:key).map{|v| v.key}
        @unauthorized_params = request.query_parameters.keys - (base_attributes + property_attributes)
    end

    def authenticate_client!
        @property = Property.includes(:variables).find_by(api_key: params.require(:api_key), secret: params.require(:secret))

        if @property.nil? || !params[:current_date]
            render json: {status: :unauthenticated, message: "Credentials not valid. Required parameters missing."}, status: 401
        end
    end

    def no_cache
        request.session_options[:skip] = true
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Request-Method'] = %w[GET POST OPTIONS].join(',')
        headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
        headers['Pragma'] = 'no-cache'
        headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
    end

end