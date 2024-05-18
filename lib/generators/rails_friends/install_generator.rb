# frozen_string_literal: true

module RailsFriends
  module Generators
    class InstallGenerator < Rails::Generators::Base
      # include Rails::Generators::ResourceHelpers

      source_root File.expand_path('templates', __dir__)

      desc 'Copies the migrations for RailsFriends'

      def copy_migrations
        directory 'migrations', 'db/migrate'
      end
    end
  end
end
