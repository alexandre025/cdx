module Cdx
  module ControllerHelpers
    module Seo
      extend ActiveSupport::Concern

      included do
        helper Cdx::SeoHelper
        helper_method :meta_data, :open_graph_data, :canonical_url, :meta_title
      end

      def meta_title
        # Override this methods in your controllers to get a custom title
        contextual_record.meta_title
      end

      def canonical_url
        # Override this methods in your controllers to get a custom canonical_url
        request.fullpath
      end

      def contextual_record
        # Override this methods in your controllers to get seo data from a specific record
        instance_variable_get("@#{controller_name.singularize}") || @object || Setting.current
      end

      def meta_data
        # Override this methods in your controllers to get custom SEO data
        object = contextual_record
        fields = {}

        if object.respond_to? :seo
          fields[:keywords]    = object.meta_keywords || Setting.current.meta_keywords
          fields[:description] = object.meta_description || Setting.current.meta_description
        end
        fields.reject { |k, v| v.blank? }
      end

      def open_graph_data
        # Override this methods in your controllers to get custom OpenGraph data
        object = contextual_record
        fields = {}

        if object.respond_to? :seo
          fields['og:title']       = object.og_title || Setting.current.og_title
          fields['og:description'] = object.og_description || Setting.current.og_description
          fields['og:keywords']    = object.og_keywords || Setting.current.og_keywords
          fields['og:image']       = object.og_image&.attachment&.url(:regular) || Setting.current.og_image&.attachment&.url(:regular)
          fields['og:video']       = object.og_video || Setting.current.og_video
        end
        fields.reject { |k, v| v.blank? }
      end
    end
  end

  module SeoHelper
    extend ActiveSupport::Concern

    def seo_data_tags
      # Should be included in your head tag
      html = meta_data.map do |k, v|
        tag.meta name: k, content: v
      end.join

      html += open_graph_data.map do |k, v|
        tag.meta property: k, content: v
      end.join

      html += tag.link rel: :canonical, href: canonical_url
    end
  end
end
