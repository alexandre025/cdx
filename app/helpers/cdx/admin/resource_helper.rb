module Cdx
  module Admin
    module ResourceHelper

      def content_header_page_title
        # TODO
        t('activerecord.models.cdx/user.other')
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
        options[:data] ||= { method: :delete, confirm: 'Are you sure ?' }
        link_to fa_icon(:trash), url, options
      end

    end
  end
end
