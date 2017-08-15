require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'factory_girl_rails'
require 'faker'
require 'rails-controller-testing'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = 'random'

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  # Reload FactoryGirl when using spring
  config.before(:suite) do
    FactoryGirl.reload
  end

  ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[File.join(ENGINE_RAILS_ROOT, 'spec/support/**/*.rb')].each { |f| require f }

  config.include Cdx::Engine.routes.url_helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.extend ControllerMacros, type: :controller

  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end
end
