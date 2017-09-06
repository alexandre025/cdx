module Cdx
  module Admin
    module BaseHelper
      include FontAwesome::Rails::IconHelper

      include FormHelper

      def theme_class
        if current_admin_user&.theme && !current_admin_user.theme.blank?
          "skin-#{current_admin_user.theme}"
        elsif current_settings
          "skin-#{current_settings.default_theme}"
        else
          'skin-yellow'
        end
      end

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

      def main_sidebar_menu_simple_item(current_main_tree, target, icon, path, label)
        target = Array(target)
        tag.li class: ('active' if target.include?(current_main_tree)) do
          link_to path do
            concat fa_icon icon
            concat tag.span label
          end
        end
      end

      def ld(date)
        l date unless date.nil?
      end
    end
  end
end
