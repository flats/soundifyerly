class AddPasswordAndDigestToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :password
      t.string :password_digest
    end
  end
end