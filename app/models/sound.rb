class Sound < ActiveRecord::Base
  include Paperclip::Glue
  belongs_to :user
  has_attached_file :soundfile
  validates_attachment :soundfile, content_type: { content_type: ["audio/aac", "audio/mp4", "audio/mpeg", "audio/ogg", "audio/wav", "audio/webm"] }
  validates_attachment_presence :soundfile
end