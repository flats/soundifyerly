class AddCarrierwaveFileColumnToSounds < ActiveRecord::Migration
  def change
    change_table :sounds do |t|
      t.string :soundfile
    end
  end
end
