class RenameFollowerFollowToFollows < ActiveRecord::Migration
  def change
    rename_table :follower_follows, :follows
  end
end
