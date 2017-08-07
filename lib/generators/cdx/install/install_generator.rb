module Cdx
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::ResourceHelpers

      source_root File.expand_path('../templates', __FILE__)

      desc 'Create a Cdx initializer, copy migrations, mount engine'

      def copy_initializer
        template 'cdx.rb', 'config/initializers/cdx.rb'
      end

      def mount_engine
        route '/'
      end
    end
  end
end


