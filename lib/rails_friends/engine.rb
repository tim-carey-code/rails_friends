module RailsFriends
  class Engine < ::Rails::Engine
    # Do not isolate namespace to avoid issues
    initializer 'rails_friends.load_generators' do
      Rails.application.config.generators.templates << RailsFriends::Engine.root.join('lib', 'generators',
                                                                                      'rails_friends', 'templates')
    end
  end
end
