class User < ActiveRecord::Base
  has_many :sounds, inverse_of: :user
  has_secure_password
  validates :username, uniqueness: true
end