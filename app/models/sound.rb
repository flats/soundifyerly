class Sound < ActiveRecord::Base
  include Attachable
  belongs_to :user, inverse_of: :sounds
  before_destroy :destroy_soundfile

  def destroy_soundfile
    delete_attached_file
  end
end