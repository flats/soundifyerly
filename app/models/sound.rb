class Sound < ActiveRecord::Base
  include Paperclip::Glue
  belongs_to :user
  has_attached_file :soundfile
  validates_attachment_presence :soundfile
end