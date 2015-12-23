class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :title
    end
  end
end
