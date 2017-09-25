module Cdx
  module Admin
    class PageDatatable < AjaxDatatablesRails::Base
      # Delegators
      def_delegators :@view, :link_to_edit, :link_to_delete, :t, :ld

      # Methods
      def view_columns
        @view_columns ||= {
            title:        { source: 'Cdx::Page.title_translations' },
            slug:         { source: 'Cdx::Page.slug_translations' },
            state:        { source: 'Cdx::Page.state' },
            published_on: { source: 'Cdx::Page.published_on' }
        }
      end

      def data
        records.map do |record|
          {
              title:        record.title,
              slug:         record.slug,
              state:        t("admin.generic_states.#{record.state}"),
              published_on: ld(record.published_on),
              actions:      actions(record)
          }
        end
      end

      private

      def get_raw_records
        Cdx::Page.all
      end

      def actions(record)
        "#{link_to_edit record} #{link_to_delete record}".html_safe
      end
    end
  end
end
