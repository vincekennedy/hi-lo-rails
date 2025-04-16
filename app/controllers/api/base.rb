module API
  class Base < Grape::API
    helpers do
      def current_user
        token = headers['Authorization']&.split('Bearer ')&.last
        @current_user ||= User.find_by(api_token: token)
      end

      def authenticate_user!
        error!({ error: 'Unauthorized' }, 401) unless current_user
      end
    end

    # before do
    #   authenticate_user!
    # end
    before { authenticate_user! unless %w[POST].include?(request.request_method) && request.path == '/api/v1/login' }

    mount API::V1::Sessions

    mount API::V1::Base
  end
end
