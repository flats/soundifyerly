class AddSoundfileToSound < ActiveRecord::Migration
  def change
    add_attachment :sounds, :soundfile
  end
end