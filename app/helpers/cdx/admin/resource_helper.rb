module Cdx
  module Admin
    module ResourceHelper

      def content_header_page_title
        # TODO : Parent data ?
        if member_action? && @object.persisted?
          "#{t("activerecord.models.cdx/#{@resource.model_class.model_name.human.downcase}.one")} #{@object.content_header_title}"
        else
          t("activerecord.models.cdx/#{@resource.model_class.model_name.human.downcase}.other")
        end
      end

      def render_content_header_breadcrumb
        # TODO : Parent data ?
        content_for :content_header_breadcrumb do
          concat tag.li link_to(@resource.model_class.model_name.human.pluralize, admin_users_path)
          concat tag.li link_to(@object.content_header_title, edit_admin_user_path(@object)) if (member_action? && @object.persisted?)
          concat tag.li t("admin.content_header.page_title.actions.#{action_name}")
        end
      end

      def link_to_new(options = {})
        url = options[:url] || new_object_url
        options[:class] = 'btn-sm btn-info pull-right'
        link_to url, options do
          fa_icon(:plus) + ' ' + t('admin.actions.new')
        end
      end

      def link_to_edit(resource, options = {})
        url = options[:url] || edit_object_url(resource)
        options[:class] = 'btn-sm btn-info'
        link_to fa_icon(:pencil), url, options
      end

      def link_to_delete(resource, options = {})
        url = options[:url] || object_url(resource)
        options[:class] = %w(btn-sm btn-danger)
        options[:data] ||= {method: :delete, confirm: 'Are you sure ?'}
        link_to fa_icon(:trash), url, options
      end

      def link_to_cancel(options = {})
        url = options[:url] || collection_url
        options[:class] = %w(btn btn-default)
        link_to t('admin.actions.cancel'), url, options
      end

    end
  end
end
