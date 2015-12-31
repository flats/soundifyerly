class Sound < ActiveRecord::Base
  include Attachable
  belongs_to :user
end