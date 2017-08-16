module Cdx
  class Engine < ::Rails::Engine
    isolate_namespace Cdx

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.helper false
    end

    initializer 'cdx.action_controller.include_all_helpers' do |app|
      app.config.action_controller.include_all_helpers = false
    end

    initializer 'cdx.assets.precompile' do |app|
      app.config.assets.precompile += %w[cdx/admin.js cdx/admin.css cdx/*.png cdx/*.jpg]
    end
  end
end
