module Cdx
  module Admin
    module ApplicationHelper
      include FontAwesome::Rails::IconHelper

      def context_tag
        "#{controller_name}_#{action_name}"
      end

      def content_header_page_title
        t("admin.content_header.page_title.#{context_tag}")
      end

      def render_main_sidebar_menu
        content_for :main_sidebar_menu do
          render partial: 'cdx/admin/shared/main_sidebar_menu', locals: { current_main_tree: controller_name.to_sym }
        end
      end

    end
  end
end
