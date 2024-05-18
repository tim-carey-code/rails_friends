RAILS_VERSIONS = ['>= 4.2.0'].freeze

$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'rails_friends/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_friends'
  s.version     = RailsFriends::VERSION
  s.authors     = ['Tim Carey']
  s.email       = ['timcarey1989@gmail.com']
  s.homepage    = 'https://github.com/tim-carey-code/rails_friends'
  s.summary     = 'Add social network friendship features to your Active Record models.'
  s.description = 'Add social network friendship features to your Active Record models.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.required_ruby_version = '>= 2.7.0'

  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/tim-carey-code/rails_friends'
  s.metadata['changelog_uri'] = 'https://github.com/tim-carey-code/rails_friends/CHANGELOG.md'

  s.add_dependency 'activemodel', RAILS_VERSIONS
  s.add_dependency 'activerecord', RAILS_VERSIONS
  s.add_dependency 'activesupport', RAILS_VERSIONS

  s.add_dependency 'stateful_enum'

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'generator_spec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'sqlite3'
  # fix time zone error when opening server
  s.add_development_dependency 'tzinfo-data'
end
