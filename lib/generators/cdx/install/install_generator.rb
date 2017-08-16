module Cdx
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'Create a Cdx initializer, copy migrations, mount engine'

      class_option :path, desc: 'Set engine mount path'

      def copy_initializer
        template 'cdx.rb', 'config/initializers/cdx.rb'
      end

      def mount_engine
        route "mount Cdx::Engine, at: '/#{options[:path]}'"
      end
    end
  end
end
