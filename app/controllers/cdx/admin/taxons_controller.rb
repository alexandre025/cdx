module Cdx
  module Admin
    class TaxonsController < ResourceController
      belongs_to 'cdx/taxonomy'

      # Callbacks
      before_action :available_parent_taxons, only: [:new, :edit]

      # Methods
      private

      def available_parent_taxons
        @available_parent_taxons = @object.new_record? ? Cdx::Taxon.by_taxonomy(@parent) : Cdx::Taxon.by_taxonomy(@parent).where.not(id: @object.children.ids.push(@object.id))
      end
    end
  end
end
