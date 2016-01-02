class User < ActiveRecord::Base
  has_many :sounds, inverse_of: :user, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :real_name, presence: true
end