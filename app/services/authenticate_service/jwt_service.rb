# frozen_string_literal: true

module AuthenticateService
  class JwtService
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

    def self.encode(payload, exp = 12.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
