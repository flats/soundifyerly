class CreateUsers < ActiveRecord::Migration
  def change
    t.string :username
    t.string :real_name
    t.string :image_url
    t.text :bio
  end
end
