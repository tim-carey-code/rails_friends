module RailsFriends
  module Extender
    def self.included(base)

      # Dynamically define the Friendship's association based on where the module is included.
      RailsFriends::Friendship.class_eval do
        belongs_to :friendable, polymorphic: true
        belongs_to :friend, class_name: "#{base.to_s}", foreign_key: :friend_id
      end

    end
  end
end