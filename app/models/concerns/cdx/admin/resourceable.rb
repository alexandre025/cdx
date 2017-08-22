module Cdx
  module Admin
    module Resourceable
      extend ActiveSupport::Concern

      def content_header_title
        title
      end
    end
  end
end
