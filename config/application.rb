require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module AmsJbuilderBench
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework nil
    end

    config.autoload_paths += ['app/serializers']
  end
end
