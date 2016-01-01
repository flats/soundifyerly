class Sound < ActiveRecord::Base
  include Attachable
  belongs_to :user, inverse_of: :sounds
end