class User < ActiveRecord::Base
  has_many :sounds
  has_secure_password
end