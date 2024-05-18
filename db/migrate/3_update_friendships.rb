if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class UpdateFriendships < ActiveRecord::Migration[4.2]; end
else
  class UpdateFriendships < ActiveRecord::Migration; end
end

UpdateFriendships.class_eval do
  def self.up
    add_column :friendships, :status_temp, :integer, index: true
    RailsFriends::Friendship.where(status: 'pending').update_all(status_temp: 0)
    RailsFriends::Friendship.where(status: 'requested').update_all(status_temp: 1)
    RailsFriends::Friendship.where(status: 'accepted').update_all(status_temp: 2)
    RailsFriends::Friendship.where(status: 'blocked').update_all(status_temp: 3)
    remove_column :friendships, :status
    rename_column :friendships, :status_temp, :status
  end

  def self.down
    add_column :friendships, :status_temp, :string
    RailsFriends::Friendship.where(status: 0).update_all(status_temp: 'pending')
    RailsFriends::Friendship.where(status: 1).update_all(status_temp: 'requested')
    RailsFriends::Friendship.where(status: 2).update_all(status_temp: 'accepted')
    RailsFriends::Friendship.where(status: 3).update_all(status_temp: 'blocked')
    remove_column :friendships, :status
    rename_column :friendships, :status_temp, :status
  end
end
