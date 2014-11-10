require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module AmsJbuilderBench
  class Application < Rails::Application
    require 'jbuilder_serializer'
    require 'jbuilder_serializers'
    require 'ams_serializers'

    config.generators do |g|
      g.test_framework nil
    end

    config.autoload_paths += ['app/jbuilder_seralizers/**/*.rb']
  end
end
