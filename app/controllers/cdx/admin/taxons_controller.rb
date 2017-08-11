module Cdx
  module Admin
    class TaxonsController < ResourceController
      # Callbacks
      before_action :load_taxonomy
      before_action :available_parent_taxons, only: [:new, :edit]

      # Methods
      private

      def load_taxonomy
        @taxonomy = Cdx::Taxonomy.find(params[:taxonomy_id])
      end

      def available_parent_taxons
        @available_parent_taxons = @object.new_record? ? Cdx::Taxon.by_taxonomy(@taxonomy) : Cdx::Taxon.by_taxonomy(@taxonomy).where.not(id: @object.children.ids.push(@object.id))
      end
    end
  end
end
