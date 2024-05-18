module RailsFriends
  class Engine < ::Rails::Engine
    isolate_namespace RailsFriends

    # initializer 'rails_friends.has_friendship' do
    #   ActiveSupport.on_load(:active_record) do
    #     include RailsFriends::Friendable
    #   end
    # end
  end
end
