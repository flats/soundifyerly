class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :real_name
      t.string :image_url
      t.text :bio
    end
  end
end
