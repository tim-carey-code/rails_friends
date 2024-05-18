require 'stateful_enum'

require 'active_support'
require 'active_record'
require 'rails/engine'
require 'rails_friends/engine'

module RailsFriends
  extend ActiveSupport::Autoload

  autoload :Friendable
  autoload :Friendship
  autoload :Extender
end

ActiveSupport.on_load(:active_record) do
  extend RailsFriends::Friendable
end
