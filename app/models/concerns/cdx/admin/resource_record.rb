module Cdx
  module Admin
    module ResourceRecord
      extend ActiveSupport::Concern

      def content_header_title
        email
      end
    end
  end
end
