module API
  module V1
    class SessionsController < API::APIController
      skip_before_action :authenticate_api_user!, only: :create

      def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          user.regenerate_api_token if user.api_token.blank?
          render json: { token: user.api_token }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
