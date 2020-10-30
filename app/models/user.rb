class User < ApplicationRecord
  has_many :orders
  has_secure_password

  validates :username, presence: true, length: { minimum: 3, maximum: 21 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
end
