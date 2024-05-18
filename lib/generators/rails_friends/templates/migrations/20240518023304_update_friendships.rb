if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class UpdateFriendships < ActiveRecord::Migration[4.2]; end
else
  class UpdateFriendships < ActiveRecord::Migration; end
end

UpdateFriendships.class_eval do
  def self.up
    add_column :friendships, :status_temp, :integer, index: true

    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 0 WHERE status = 'pending'")
    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 1 WHERE status = 'requested'")
    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 2 WHERE status = 'accepted'")
    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 3 WHERE status = 'blocked'")

    remove_column :friendships, :status
    rename_column :friendships, :status_temp, :status
  end

  def self.down
    add_column :friendships, :status_temp, :string

    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 'pending' WHERE status = 0")
    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 'requested' WHERE status = 1")
    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 'accepted' WHERE status = 2")
    ActiveRecord::Base.connection.execute("UPDATE friendships SET status_temp = 'blocked' WHERE status = 3")

    remove_column :friendships, :status
    rename_column :friendships, :status_temp, :status
  end
end