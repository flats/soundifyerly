class RemovePaperclipAttachmentsFromSound < ActiveRecord::Migration
  def change
    change_table :sounds do |t|
      t.remove :soundfile_file_name
      t.remove :soundfile_content_type
      t.remove :soundfile_file_size
      t.remove :soundfile_updated_at
    end
  end
end
