class User < ApplicationRecord
    has_secure_password
  
    before_create :generate_api_token
  
    def regenerate_api_token
      update!(api_token: generate_unique_api_token)
    end
  
    private
  
    def generate_api_token
      self.api_token ||= generate_unique_api_token
    end
  
    def generate_unique_api_token
      loop do
        token = SecureRandom.hex(20)
        break token unless User.exists?(api_token: token)
      end
    end
  end
  