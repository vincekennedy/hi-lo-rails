module API
  module V1
    class Sessions < Grape::API
      resource :login do
        desc 'Authenticate user and return token'

        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
        end

        post do
          user = User.find_by(email: params[:email])
          if user&.authenticate(params[:password])
            token = SecureRandom.hex(20)
            user.update!(api_token: token)
            { token: token }
          else
            error!({ error: 'Invalid email or password' }, 401)
          end
        end
      end
    end
  end
end
