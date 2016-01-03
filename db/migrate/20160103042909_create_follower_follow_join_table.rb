class CreateFollowerFollowJoinTable < ActiveRecord::Migration
  def change
    create_table :follower_follows do |t|
      t.references :follower
      t.references :leader
    end
  end
end
