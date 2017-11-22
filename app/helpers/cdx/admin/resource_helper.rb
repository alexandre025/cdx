module Cdx
  module Admin
    module ResourceHelper
      def content_header_page_title
        # Work arround with Ransack issue, where all helpers are available
        # even with our initializer : include_all_helpers = false
        if @object && try(:member_action?)
          # TODO : Parent data ?
          if member_action? && @object.persisted?
            "#{t("activerecord.models.#{@resource.model_class.model_name.to_s.underscore}.one")} : #{@object.content_header_title}"
          else
            t("activerecord.models.#{@resource.model_class.model_name.to_s.underscore}.other")
          end
        else

          t("admin.content_header.page_title.#{context_tag}")
        end
      end

      def render_content_header_breadcrumb
        content_for :content_header_breadcrumb do
          if @parent
            concat tag.li link_to(@parent.model_name.human.pluralize, parent_collection_url)
            concat tag.li link_to(@parent.content_header_title, edit_parent_object_url)
          end
          concat tag.li link_to(@resource.model_class.model_name.human.pluralize, collection_url)
          if member_action? && @object.persisted?
            url = action_name == 'edit' ? edit_object_url(@object) : object_url(@object)
            concat tag.li link_to(@object.content_header_title, url)
          end
          concat tag.li t("admin.content_header.page_title.actions.#{action_name}")
        end
      end

      def link_to_new(options = {})
        if can? :new, @object.class
          url             = options[:url] || new_object_url
          options[:class] = 'btn-sm btn-info pull-right'
          link_to url, options do
            fa_icon(:plus) + ' ' + t('admin.actions.new')
          end
        end
      end

      def link_to_show(resource, options = {})
        if can? :show, resource
          url             = options[:url] || object_url(resource)
          options[:class] = 'btn-sm btn-success'
          link_to fa_icon(:eye), url, options
        end
      end

      def link_to_edit(resource, options = {})
        if can? :edit, resource
          url             = options[:url] || edit_object_url(resource)
          options[:class] = 'btn-sm btn-info'
          link_to fa_icon(:pencil), url, options
        end
      end

      def link_to_delete(resource, options = {})
        if can? :destroy, resource
          url                      = options[:url] || object_url(resource)
          options[:class]          = %w(btn-sm btn-danger)
          options[:data]           ||= {}
          options[:data][:method]  ||= :delete
          options[:data][:confirm] ||= resource&.content_header_title ? t('admin.ujs_confirm.delete', o: resource.content_header_title) : t('admin.ujs_confirm.default')
          link_to fa_icon(:trash), url, options
        end
      end

      def link_to_return(options = {})
        if can? :index, @object.class
          url             = options[:url] || collection_url
          options[:class] = %w(btn btn-default)
          link_to t('admin.actions.return'), url, options
        end
      end
    end
  end
end
