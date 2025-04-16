module API
  class APIController < ActionController::API
    before_action :authenticate_api_user!

    private

    def authenticate_api_user!
      token = request.headers["Authorization"]&.split("Bearer ")&.last
      @current_user = User.find_by(api_token: token)
      render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
    end
  end
end
