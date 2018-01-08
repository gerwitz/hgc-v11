# thanks https://github.com/simonrice/middleman-rspec

require 'rspec'
require 'capybara/rspec'

require 'middleman-core'
require 'middleman-core/rack'
require 'middleman-blog'
require 'middleman-search'
require 'middleman-sprockets'

middleman_app = ::Middleman::Application.new

Capybara.app = ::Middleman::Rack.new(middleman_app).to_app do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :development
  set :show_exceptions, false
end
