class ApplicationController < ActionController::API
    def current_user
        @current_user ||= authenticated_current
      end
    
      private
    
      def authenticate_request
        @current_user = authenticated_current
        render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
        @current_user
      end
    
      def authenticated_current
        AuthenticateApiRequestService.new(http_auth_header).call
      end
    
    
      def http_auth_header
        request.headers['Authorization']&.split(' ')&.last
      end
end
