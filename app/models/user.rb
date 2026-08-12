class User < ApplicationRecord
  has_secure_password

  enum :role, {"admin": 1, "provider": 2, "customer": 3}

  validates :name,  presence: true
  validates :email, uniqueness: true, presence: true

  def provider?
    if self.role == "provider" 
      return true 
    else
      return false
    end
  end
end
