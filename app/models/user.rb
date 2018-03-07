class User < ApplicationRecord
  has_secure_password

  has_many :scores
  has_many :comments
  has_many :ranks
end
