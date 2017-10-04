require 'turbolinks'
require 'jquery-rails'
require 'sprockets/rails'
require 'bootstrap-sass'
require 'font-awesome-rails'
require 'icheck-rails'
require 'bootstrap-wysihtml5-rails'
require 'jstree-rails-4'
require 'toastr-rails'
require 'emoji_flag'
require 'cocoon'
require 'rails-i18n'
require 'paperclip'
require 'kaminari'
require 'kaminari-i18n'
require 'friendly_id'
require 'json_translate'
require 'friendly_id/json_translate'
require 'devise'
require 'jbuilder'
require 'simple_form'
require 'ajax-datatables-rails'
require 'ransack'
require 'state_machines-activerecord'
require 'awesome_nested_set'

require 'cdx/engine'

module Cdx
  mattr_accessor :admin_path
  @@admin_path = 'admin'

  mattr_accessor :taxonomy_available_codes
  @@taxonomy_available_codes = %w(pages)

  mattr_accessor :user_available_roles
  @@user_available_roles = %w(admin)

  def self.setup
    yield self
  end
end

require 'cdx/controller_helpers/site'
require 'cdx/controller_helpers/settings'
require 'cdx/controller_helpers/seo'
require 'cdx/controller_helpers/locale'
