module JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  def self.encode(payload)
    token = JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(payload)
    data = JWT.decode(payload, SECRET_KEY)
  end
end