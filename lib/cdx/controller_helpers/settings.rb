module Cdx
  module ControllerHelpers
    module Settings
      extend ActiveSupport::Concern

      included do
        helper_method :current_settings
      end

      def current_settings
        @current_settings ||= Cdx::Setting.current
      end
    end
  end
end
