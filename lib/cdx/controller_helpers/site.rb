module Cdx
  module ControllerHelpers
    module Site
      extend ActiveSupport::Concern

      included do
        helper_method :current_site
      end

      def current_site
        @current_site ||= Cdx::Site.current(request.env['SERVER_NAME'])
      end
    end
  end
end
