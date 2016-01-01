class AddUserForeignKeyToSounds < ActiveRecord::Migration
  def change
    add_reference :sounds, :user, index: true, foreign_key: true
  end
end
