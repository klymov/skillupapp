class User < ApplicationRecord
  has_secure_password

  # validates :username, presence: true, length: { minimum: 3, maximum: 21 }
  # validates :password_digest, presence: true, length: { in: 6..20 }
  # validates :phone, presence: true, length: { minimum: 12, maximum: 12 }
  # validates :email, presence: true, uniqueness: true, on: :create
end
#:nickname, :phone, :email, :password, :role, :avatar, :avto_id