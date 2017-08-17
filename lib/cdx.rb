require 'jquery-rails'
require 'sprockets/rails'
require 'bootstrap-sass'
require 'font-awesome-rails'
require 'icheck-rails'
require 'bootstrap-wysihtml5-rails'

require 'devise'
require 'simple_form'
require 'friendly_id'
require 'state_machines-activerecord'
require 'awesome_nested_set'
require 'byebug'
require 'web-console'

require 'cdx/engine'

module Cdx
  mattr_accessor :admin_path
  @@admin_path = 'admin'

  def self.setup
    yield self
  end
end

require 'cdx/controller_helpers/site'
