require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ecomap
  class Application < Rails::Application
    config.time_zone = "Europe/Kiev"
    config.encoding = "utf-8"
    
    config.generators do |g|
      g.fixture_replacement :factory_girl
      g.factory_girl dir: 'spec/factories'
    end
  end
end
