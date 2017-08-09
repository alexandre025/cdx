module Cdx
  module Admin
    module ResourceHelper

      def content_header_page_title
        # TODO : Parent data ?
        if member_action?
          "#{t("activerecord.models.cdx/#{@resource.model_class.model_name.human.downcase}.one")} #{@object.content_header_title}"
        else
          t("activerecord.models.cdx/#{@resource.model_class.model_name.human.downcase}.other")
        end
      end

      def render_content_header_breadcrumb
        # TODO : Parent data ?
        content_for :content_header_breadcrumb do
          concat tag.li link_to(@resource.model_class.model_name.human.pluralize, admin_users_path)
          concat tag.li link_to(@object.content_header_title, edit_admin_user_path(@object)) if member_action?
          concat tag.li t("admin.content_header.page_title.actions.#{action_name}")
        end
      end

      def link_to_edit(resource, options = {})
        # TODO : Dev edit_object_url
        url = options[:url] || edit_admin_user_path(resource)
        options[:class] = 'btn btn-info'
        link_to fa_icon(:pencil), url, options
      end

      def link_to_delete(resource, options = {})
        # TODO : Dev object_url
        url = options[:url] || admin_user_path(resource)
        options[:class] = %w(btn btn-danger)
        options[:data] ||= {method: :delete, confirm: 'Are you sure ?'}
        link_to fa_icon(:trash), url, options
      end

    end
  end
end
