module Cdx
  module Admin
    module ApplicationHelper

      def content_header_page_title
        t("admin.content_header.page_title.#{controller_name}_#{action_name}")
      end

    end
  end
end
