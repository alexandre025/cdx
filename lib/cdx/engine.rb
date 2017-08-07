module Cdx
  class Engine < ::Rails::Engine
    isolate_namespace Cdx

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.helper false
    end
  end
end
