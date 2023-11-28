class User < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true, length: { minimum: 10 }
end
