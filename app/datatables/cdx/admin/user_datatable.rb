module Cdx
  module Admin
    class UserDatatable < AjaxDatatablesRails::Base
      # Delegators
      def_delegators :@view, :link_to_edit, :link_to_delete

      # Methods
      def view_columns
        @view_columns ||= {
            email:      { source: 'Cdx::User.email' },
            first_name: { source: 'Cdx::User.first_name' },
            last_name:  { source: 'Cdx::User.last_name' }
        }
      end

      def data
        records.map do |record|
          {
              email:      record.email,
              first_name: record.first_name,
              last_name:  record.last_name,
              actions:    actions(record)
          }
        end
      end

      private

      def get_raw_records
        Cdx::User.all
      end

      def actions(record)
        "#{link_to_edit record} #{link_to_delete record}".html_safe
      end
    end
  end
end
